// lib/features/order/presentation/services/invoice_pdf_actions_service.dart

import 'dart:io';
import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:sabaa/features/order/presentation/controller/invoice_details_controller.dart';
import 'package:sabaa/src/core/utils/functions/invoice_pdf_generator.dart';
import 'package:sabaa/src/core/utils/functions/pdf_preview_screen.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:share_plus/share_plus.dart';

/// Handles all PDF/HTML share and print operations for the invoice review page.
///
/// Keeps the UI classes free from side-effect logic.
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

  // ─── PUBLIC — CURRENT MODE (HTML) ────────────────────────────────────

  Future<void> printFromHtml() => _printFromHtml();
  Future<void> shareFromHtml() => _shareFromHtml();

  // ─── PUBLIC — FALLBACK MODE (LOCAL PDF) ──────────────────────────────
  //  Kept commented in caller — keep methods available for easy rollback.

  Future<void> printFromLocalPdf() => _printFromLocalPdf();
  Future<void> shareFromLocalPdf() => _shareFromLocalPdf();

  // ═══════════════════════════════════════════════════════════════════════
  // HTML-BASED FLOW
  // ═══════════════════════════════════════════════════════════════════════

  Future<void> _printFromHtml() async {
    final state = _readInvoiceState();
    if (state == null) return;

    onLoadingChange(true);

    try {
      final html = await ref
          .read(invoiceDetailsControllerProvider.notifier)
          .fetchInvoiceHtml(state.invoiceId);

      debugPrint('📄 HTML received, length: ${html.length}');
      if (!isMounted()) return;
      onLoadingChange(false);

      await Printing.layoutPdf(
        onLayout: (format) async => Printing.convertHtml(
          html: html,
          format: format,
        ),
        name: 'invoice_${state.invoiceId}.pdf',
      );
    } catch (e, st) {
      debugPrint('❌ Print HTML error: $e\n$st');
      _showError('failed_to_generate_pdf'.tr());
      onLoadingChange(false);
    }
  }

  Future<void> _shareFromHtml() async {
    final state = _readInvoiceState();
    if (state == null) return;

    onLoadingChange(true);

    try {
      final html = await ref
          .read(invoiceDetailsControllerProvider.notifier)
          .fetchInvoiceHtml(state.invoiceId);

      await Printing.sharePdf(
        bytes: await Printing.convertHtml(html: html, format: PdfPageFormat.a4),
        filename: 'invoice_${_sanitize(state.invoiceId)}.pdf',
      );
    } catch (e) {
      debugPrint('❌ Share HTML error: $e');
      _showError('failed_to_share_pdf'.tr());
    } finally {
      onLoadingChange(false);
    }
  }

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