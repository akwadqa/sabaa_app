import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:sabaa/features/order/data/repository/order_repository.dart';
import 'package:sabaa/features/order/presentation/controller/invoice_details_controller.dart';
import 'package:sabaa/src/core/utils/functions/invoice_pdf_generator.dart';
import 'package:sabaa/src/core/utils/functions/pdf_preview_screen.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:share_plus/share_plus.dart';

enum InvoiceDocType {
  salesInvoice,   // "Sales Invoice"
  paymentEntry,   // "Payment Entry"
}

extension on InvoiceDocType {
  String get apiValue => switch (this) {
        InvoiceDocType.salesInvoice => 'Sales Invoice',
        InvoiceDocType.paymentEntry => 'Payment Entry',
      };
}

class InvoicePdfActionsService {
  InvoicePdfActionsService({
    required this.ref,
    required this.context,
    required this.isMounted,
    required this.onLoadingChange,
  });

  final WidgetRef ref;
  final BuildContext Function() context;
  final bool Function() isMounted;
  final ValueChanged<bool> onLoadingChange;

  // ═══════════════════════════════════════════════════════════════════════
  // PUBLIC API — HTML MODE
  // ═══════════════════════════════════════════════════════════════════════

  /// Uses the current invoice from [invoiceDetailsControllerProvider].
  /// For pages that already loaded the invoice details.
  Future<void> printFromHtml() async {
    final state = _readInvoiceState();
    if (state == null) return;
    await printFromHtmlById(
      documentId: state.invoiceId,
      docType: InvoiceDocType.salesInvoice,
    );
  }

  Future<void> shareFromHtml() async {
    final state = _readInvoiceState();
    if (state == null) return;
    await shareFromHtmlById(
      documentId: state.invoiceId,
      docType: InvoiceDocType.salesInvoice,
    );
  }

  /// ✅ Print any document (Sales Invoice or Payment Entry) by ID
  Future<void> printFromHtmlById({
    required String documentId,
    required InvoiceDocType docType,
  }) async {
    onLoadingChange(true);

    try {
      final html = await _fetchHtml(documentId, docType);

      debugPrint('📄 HTML received, length: ${html.length}');
      if (!isMounted()) return;
      onLoadingChange(false);

      await Printing.layoutPdf(
        onLayout: (format) async => Printing.convertHtml(
          html: html,
          format: format,
        ),
        name: '${docType.apiValue}_$documentId.pdf',
      );
    } catch (e, st) {
      debugPrint('❌ Print HTML error: $e\n$st');
      _showError('failed_to_generate_pdf'.tr());
      onLoadingChange(false);
    }
  }

  /// ✅ Share any document by ID
Future<void> shareFromHtmlById({
  required String documentId,
  required InvoiceDocType docType,
}) async {
  onLoadingChange(true);

  try {
    final html = await _fetchHtml(documentId, docType);
    debugPrint('✅ HTML fetched: ${html.length}');

    if (!isMounted()) return;
    onLoadingChange(false);

    // ✅ Share HTML file directly — opens in browser, WhatsApp, email etc.
    final dir = await getTemporaryDirectory();
    final fileName = '${docType.apiValue}_${_sanitize(documentId)}.html'
        .replaceAll(' ', '_');
    final filePath = '${dir.path}/$fileName';
    await File(filePath).writeAsString(html);

    debugPrint('✅ HTML file saved: $filePath');

    if (!isMounted()) return;

    await Share.shareXFiles(
      [XFile(filePath, mimeType: 'text/html')],
      subject: '${docType.apiValue} - $documentId',
    );

    debugPrint('✅ Share opened');
  } catch (e, st) {
    debugPrint('❌ Share failed: $e\n$st');
    if (isMounted()) _showError('failed_to_share_pdf'.tr());
    onLoadingChange(false);
  }
}
  
  
  // ═══════════════════════════════════════════════════════════════════════
  // PUBLIC API — LOCAL PDF (FALLBACK)
  // ═══════════════════════════════════════════════════════════════════════



  Future<void> printFromLocalPdf() => _printFromLocalPdf();
  Future<void> shareFromLocalPdf() => _shareFromLocalPdf();

  // ═══════════════════════════════════════════════════════════════════════
  // HTML-BASED FLOW
  // ═══════════════════════════════════════════════════════════════════════

  // Future<void> _printFromHtml() async {
  //   final state = _readInvoiceState();
  //   if (state == null) return;

  //   onLoadingChange(true);

  //   try {
  //     final html = await ref
  //         .read(invoiceDetailsControllerProvider.notifier)
  //         .fetchInvoiceHtml(state.invoiceId);

  //     debugPrint('📄 HTML received, length: ${html.length}');
  //     if (!isMounted()) return;
  //     onLoadingChange(false);

  //     await Printing.layoutPdf(
  //       onLayout: (format) async => Printing.convertHtml(
  //         html: html,
  //         format: format,
  //       ),
  //       name: 'invoice_${state.invoiceId}.pdf',
  //     );
  //   } catch (e, st) {
  //     debugPrint('❌ Print HTML error: $e\n$st');
  //     _showError('failed_to_generate_pdf'.tr());
  //     onLoadingChange(false);
  //   }
  // }

  // Future<void> _shareFromHtml() async {
  //   final state = _readInvoiceState();
  //   if (state == null) return;

  //   onLoadingChange(true);

  //   try {
  //     final html = await ref
  //         .read(invoiceDetailsControllerProvider.notifier)
  //         .fetchInvoiceHtml(state.invoiceId);

  //     await Printing.sharePdf(
  //       bytes: await Printing.convertHtml(html: html, format: PdfPageFormat.a4),
  //       filename: 'invoice_${_sanitize(state.invoiceId)}.pdf',
  //     );
  //   } catch (e) {
  //     debugPrint('❌ Share HTML error: $e');
  //     _showError('failed_to_share_pdf'.tr());
  //   } finally {
  //     onLoadingChange(false);
  //   }
  // }


  //! Manual handle pdf// 
// Future<void> _printInvoice() async {
//     final detailsState = ref.read(invoiceDetailsControllerProvider);

//     if (detailsState is! AsyncData<InvoiceDetailsState>) return;

//     final state = detailsState.value;

//     setState(() => _isGeneratingPdf = true);

//     try {
//       final Uint8List pdfBytes =
//           await InvoicePdfGenerator.generate(context, state);

//       if (!mounted) return;

//       setState(() => _isGeneratingPdf = false);

//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (_) => PdfPreviewScreen(
//             pdfBytes: pdfBytes,
//             invoiceId: state.invoiceId, // raw ID is fine here, sanitized inside
//           ),
//         ),
//       );
//     } catch (e) {
//       if (mounted) {
//         setState(() => _isGeneratingPdf = false);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('failed_to_generate_pdf'.tr()),
//             backgroundColor: AppColors.errorRed,
//           ),
//         );
//       }
//     }
//   }

  // ═══════════════════════════════════════════════════════════════════════
  // LOCAL PDF FLOW (FALLBACK)
  // ═══════════════════════════════════════════════════════════════════════

  Future<void> _printFromLocalPdf() async {
    final state = _readInvoiceState();
    if (state == null) return;

    onLoadingChange(true);

    try {
      final Uint8List bytes =
          await InvoicePdfGenerator.generate(context(), state);

      if (!isMounted()) return;
      onLoadingChange(false);

      Navigator.of(context()).push(
        MaterialPageRoute(
          builder: (_) => PdfPreviewScreen(
            pdfBytes: bytes,
            invoiceId: state.invoiceId,
          ),
        ),
      );
    } catch (e) {
      debugPrint('❌ Local print error: $e');
      _showError('failed_to_generate_pdf'.tr());
      onLoadingChange(false);
    }
  }

  Future<void> _shareFromLocalPdf() async {
    final state = _readInvoiceState();
    if (state == null) return;

    onLoadingChange(true);

    try {
      final Uint8List bytes =
          await InvoicePdfGenerator.generate(context(), state);

      if (!isMounted()) return;

      final dir = await getTemporaryDirectory();
      final path = '${dir.path}/invoice_${_sanitize(state.invoiceId)}.pdf';
      final file = File(path);
      await file.writeAsBytes(bytes);

      if (!isMounted()) return;
      await Share.shareXFiles([XFile(path, mimeType: 'application/pdf')]);
    } catch (e) {
      debugPrint('❌ Local share error: $e');
      _showError('failed_to_share_pdf'.tr());
    } finally {
      onLoadingChange(false);
    }
  }

  // ═══════════════════════════════════════════════════════════════════════
  // HELPERS
  // ═══════════════════════════════════════════════════════════════════════

  Future<String> _fetchHtml(String documentId, InvoiceDocType docType) async {
    final repo = ref.read(orderRepositoryProvider);
    final html = await repo.getDocumentHtml(
      docName: documentId,
      docType: docType.apiValue,
    );
    return html;
  }

  InvoiceDetailsState? _readInvoiceState() {
    final asyncState = ref.read(invoiceDetailsControllerProvider);
    if (asyncState is! AsyncData<InvoiceDetailsState>) return null;
    return asyncState.value;
  }

  String _sanitize(String id) => id.replaceAll(RegExp(r'[/\\:*?"<>|]'), '_');

  void _showError(String message) {
    if (!isMounted()) return;
    ScaffoldMessenger.of(context()).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.errorRed),
    );
  }

}