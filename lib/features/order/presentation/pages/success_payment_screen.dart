import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sabaa/features/customers/presentation/screens/create_customer_success_page.dart';
import 'package:sabaa/features/main/presentation/screens/main_screen.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/invoice_pdf_actions_service.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/functions/pdf_preview_screen.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' as flutter;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sabaa/src/core/utils/functions/helper_methods.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../src/core/shared_widgets/custom_button_widget.dart';
import '../../../../src/resourses/font_manager/app_text_style.dart';
import '../controller/order_controller.dart';

class PaymentSuccessPage extends ConsumerWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final payment = ref.watch(orderControllerProvider).value!.paymentData;

    if (payment == null) {
      return const Scaffold(
        body: Center(child: Text("No payment data")),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            /// ICON
            const SuccessIcon(),

            const SizedBox(height: 20),

            Text(
              "Payment Successful!",
              style: AppTextStyle.interBold22,
            ),

            const SizedBox(height: 8),

            Text(
              "The payment has been successfully recorded.",
              textAlign: TextAlign.center,
              style: AppTextStyle.interRegular14.copyWith(
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: 24),

            /// CARD
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: BorderDirectional(
                  start: BorderSide(color: AppColors.primary, width: 6),
                ),
              ),
              child: Column(
                children: [
                  Text("AMOUNT PAID",
                      style: AppTextStyle.interMedium18.copyWith()),

                  10.verticalSpace,
                  Text(
                    payment.paidAmount.toCurrency(),
                    style: AppTextStyle.interBold22.copyWith(
                        color: AppColors.primary,
                        fontSize: 30,
                        fontWeight: FontWeight.w900),
                  ),
                  20.verticalSpace,
                  // const Divider(height: 30),

                  _row("Invoice", payment.paymentId),
                  _row("Customer", payment.partyName),
                  // _row("Paid Amount", payment.paidAmount.toCurrency()),
                  _row("Payment Type", payment.paymentType),
                  _row("Payment Method", payment.modeOfPayment),
                ],
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomButtonWidget(
                text: "Done",
                onTap: () {
                  // ref.read(bottomNavIndexProvider.notifier).state = 0;
                  // context.pop();
                  context.pop();
                  ref.read(orderControllerProvider.notifier).refresh();
                },
                isFiled: true,
                backgroundColor: AppColors.primary,
                height: 50,
                radius: 8,
                width: double.infinity,
              ),
            ),

            const SizedBox(height: 12),

            // ── Print Receipt Button (NEW) ───────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _PrintReceiptButton(
                invoiceId: payment.paymentId,
                customerName: payment.partyName,
                paymentType: payment.paymentType,
                paymentMethod: payment.modeOfPayment,
                amount: payment.paidAmount,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyle.interMedium14),
          SizedBox(
            width: 150,
            child: Text(value, style: AppTextStyle.interMedium14)),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// PRINT RECEIPT BUTTON
// ═══════════════════════════════════════════════════════════════════════════════
enum ReceiptAction { print, share }

class _PrintReceiptButton extends ConsumerStatefulWidget {
  const _PrintReceiptButton({
    required this.invoiceId,
    required this.customerName,
    required this.paymentType,
    required this.paymentMethod,
    required this.amount,
  });

  final String invoiceId;
  final String customerName;
  final String paymentType;
  final String paymentMethod;
  final num amount;

  @override
  ConsumerState<_PrintReceiptButton> createState() =>
      _PrintReceiptButtonState();
}

class _PrintReceiptButtonState extends ConsumerState<_PrintReceiptButton> {
  bool _isLoading = false;
  late final InvoicePdfActionsService _pdfActions;
  bool _isGeneratingPdf = false;
  ReceiptAction? _loadingAction;
  bool get _isBusy => _loadingAction != null;

  @override
  void initState() {
    super.initState();

    _pdfActions = InvoicePdfActionsService(
      ref: ref,
      context: () => context,
      isMounted: () => mounted,
      onLoadingChange: (loading) {
    if (!mounted) return;

        // only clear loading when action finishes
        if (!loading) {
          setState(() => _loadingAction = null);
        }      },
    );

    // if (widget.mode == InvoiceReviewMode.viewOnly && widget.invoiceId != null) {
    //   Future.microtask(() {
    //     ref
    //         .read(invoiceDetailsControllerProvider.notifier)
    //         .fetchInvoiceDetails(widget.invoiceId!);
    //   });
    // }
  }

  Future<void> _printReceipt() async {
    if (_isBusy) return;

    setState(() => _loadingAction = ReceiptAction.print);

    try {
      final isCreditNote = widget.paymentType == 'Credit Note';

    await _pdfActions.printFromHtmlById(
      documentId: widget.invoiceId,
      docType: isCreditNote
          ? InvoiceDocType.salesInvoice   // Print the invoice for credit note
          : InvoiceDocType.paymentEntry,  // Print payment entry for normal
    );

    } catch (e) {
      if (mounted) {
        setState(() => _loadingAction = null);
      }
    }
  }
// ! Old manual handle pdf Donot delete it maybe need re use it //
  // Future<void> _printReceipt() async {
  //   setState(() => _isLoading = true);

  //   try {
  //     final pdfBytes = await PaymentReceiptPdfGenerator.generate(
  //       context: context,
  //       invoiceId: widget.invoiceId,
  //       customerName: widget.customerName,
  //       paymentType: widget.paymentType,
  //       paymentMethod: widget.paymentMethod,
  //       amount: widget.amount.toDouble(),
  //     );

  //     if (!mounted) return;

  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (_) => PdfPreviewScreen(
  //           pdfBytes: pdfBytes,
  //           invoiceId: widget.invoiceId,
  //         ),
  //       ),
  //     );
  //   } catch (e) {
  //     debugPrint('Print receipt error: $e');
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('failed_to_generate_pdf'.tr()),
  //           backgroundColor: AppColors.errorRed,
  //         ),
  //       );
  //     }
  //   } finally {
  //     if (mounted) setState(() => _isLoading = false);
  //   }
  // }
  // ✅ Share using local PDF (PaymentReceiptPdfGenerator) — no HTML needed
  Future<void> _shareReceipt() async {
    if (_isBusy) return;

    setState(() => _loadingAction = ReceiptAction.share);

    try {
      final Uint8List pdfBytes = await PaymentReceiptPdfGenerator.generate(
        context: context,
        invoiceId: widget.invoiceId,
        customerName: widget.customerName,
        paymentType: widget.paymentType,
        paymentMethod: widget.paymentMethod,
        amount: widget.amount.toDouble(),
      );

      if (!mounted) return;

      final dir = await getTemporaryDirectory();
      final sanitized =
          widget.invoiceId.replaceAll(RegExp(r'[/\\:*?"<>|]'), '_');
      final filePath = '${dir.path}/receipt_$sanitized.pdf';
      await File(filePath).writeAsBytes(pdfBytes);

      if (!mounted) return;

      await Share.shareXFiles(
        [XFile(filePath, mimeType: 'application/pdf')],
        subject: 'Payment Receipt - ${widget.invoiceId}',
      );
    } catch (e) {
      debugPrint('❌ Share receipt error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('failed_to_share_pdf'.tr()),
            backgroundColor: AppColors.errorRed,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _loadingAction = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ── Print Button ─────────────────────────────────────────────

        Expanded(
          child: SizedBox(
            height: 50,
            child: OutlinedButton(
              onPressed: _isBusy ? null : _printReceipt,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primary, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: _loadingAction == ReceiptAction.print
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primary,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.print_outlined,
                          color: AppColors.primary,
                          size: 22,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'print_receipt'.tr(),
                          style: AppTextStyle.interSemiBold14.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // ── Share Button ─────────────────────────────────────────────
        Expanded(
          child: SizedBox(
            height: 50,
            child: OutlinedButton(
              onPressed: _isBusy ? null : _shareReceipt,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primary, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child:  _loadingAction == ReceiptAction.share
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primary,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.share_outlined,
                          color: AppColors.primary,
                          size: 22,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'share'.tr(),
                          style: AppTextStyle.interSemiBold14.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

class PaymentReceiptPdfGenerator {
  static Future<Uint8List> generate({
    required flutter.BuildContext context,
    required String invoiceId,
    required String customerName,
    required String paymentType,
    required String paymentMethod,
    required double amount,
  }) async {
    final regularFontData =
        await rootBundle.load('assets/fonts/Cairo-Regular.ttf');
    final boldFontData = await rootBundle.load('assets/fonts/Cairo-Bold.ttf');

    final fontRegular = pw.Font.ttf(regularFontData);
    final fontBold = pw.Font.ttf(boldFontData);
    final logoBytes = await rootBundle.load(Assets.images.appLogo.path);
    final logoImage = pw.MemoryImage(logoBytes.buffer.asUint8List());
    final isRtl = context.locale.languageCode == 'ar';

    // ── Brand Colors ───────────────────────────────────────────────────
    final primaryColor = PdfColor.fromHex('#1E3A5F');
    final accentColor = PdfColor.fromHex('#2E7D32');
    final lightGray = PdfColor.fromHex('#F8F9FA');
    final mediumGray = PdfColor.fromHex('#9CA3AF');
    final darkGray = PdfColor.fromHex('#374151');
    final dividerColor = PdfColor.fromHex('#E5E7EB');

    final pdf = pw.Document(
      theme: pw.ThemeData.withFont(base: fontRegular, bold: fontBold),
    );

    // ── Date/Time formatting ───────────────────────────────────────────
    final now = DateTime.now();
    final date =
        '${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}';
    final time =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

    // ── Receipt Page Format — narrow like thermal receipt ──────────────
    final receiptFormat = PdfPageFormat(
      80 * PdfPageFormat.mm, // 80mm width (standard thermal receipt)
      double.infinity, // auto height
      marginAll: 6 * PdfPageFormat.mm,
    );

    pdf.addPage(
      pw.Page(
        pageFormat: receiptFormat,
        textDirection: isRtl ? pw.TextDirection.rtl : pw.TextDirection.ltr,
        build: (pdfContext) {
          return pw.Column(
            mainAxisSize: pw.MainAxisSize.min,
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              // ═══ HEADER — Logo & Brand ═══════════════════════════════
              pw.Center(
                child: pw.Column(
                  children: [
                    pw.Container(
                      width: 60,
                      height: 60,
                      decoration: pw.BoxDecoration(
                        color: primaryColor,
                        shape: pw.BoxShape.circle,
                      ),
                      child: pw.Padding(
                        padding: const pw.EdgeInsets.all(0),
                        child: pw.Image(
                          logoImage,
                          fit: pw.BoxFit.cover,
                        ),
                      ),
                    ),
                    pw.SizedBox(height: 8),
                    pw.Text(
                      'SABAA',
                      style: pw.TextStyle(
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold,
                        color: primaryColor,
                        letterSpacing: 3,
                      ),
                    ),
                    pw.SizedBox(height: 2),
                    pw.Text(
                      'Trading Group',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: mediumGray,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 12),
              _dashedDivider(dividerColor),
              pw.SizedBox(height: 12),

              // ═══ RECEIPT TITLE ═══════════════════════════════════════
              pw.Center(
                child: pw.Text(
                  'payment_receipt'.tr().toUpperCase(),
                  style: pw.TextStyle(
                    fontSize: 13,
                    fontWeight: pw.FontWeight.bold,
                    color: darkGray,
                    letterSpacing: 2,
                  ),
                ),
              ),

              pw.SizedBox(height: 6),

              // ── Date & Time Row ──────────────────────────────────────
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    date,
                    style: pw.TextStyle(
                      fontSize: 9,
                      color: mediumGray,
                    ),
                  ),
                  pw.SizedBox(width: 8),
                  pw.Container(
                    width: 1,
                    height: 10,
                    color: dividerColor,
                  ),
                  pw.SizedBox(width: 8),
                  pw.Text(
                    time,
                    style: pw.TextStyle(
                      fontSize: 9,
                      color: mediumGray,
                    ),
                  ),
                ],
              ),

              pw.SizedBox(height: 12),
              _dashedDivider(dividerColor),
              pw.SizedBox(height: 14),

              // ═══ AMOUNT SECTION ═════════════════════════════════════
              pw.Center(
                child: pw.Text(
                  'amount_paid'.tr().toUpperCase(),
                  style: pw.TextStyle(
                    fontSize: 9,
                    color: mediumGray,
                    letterSpacing: 1.5,
                  ),
                ),
              ),

              pw.SizedBox(height: 6),

              pw.Center(
                child: pw.Text(
                  amount.toCurrency(),
                  style: pw.TextStyle(
                    fontSize: 26,
                    fontWeight: pw.FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),

              pw.SizedBox(height: 10),

              // ✅ PAID Badge ───────────────────────────────────────────
              pw.Center(
                child: pw.Container(
                  padding: const pw.EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 5,
                  ),
                  decoration: pw.BoxDecoration(
                    color: accentColor,
                    borderRadius: pw.BorderRadius.circular(20),
                  ),
                  child: pw.Text(
                    'PAID',
                    style: pw.TextStyle(
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),

              pw.SizedBox(height: 14),
              _dashedDivider(dividerColor),
              pw.SizedBox(height: 12),

              // ═══ TRANSACTION DETAILS ═════════════════════════════════
              _sectionLabel('TRANSACTION DETAILS', mediumGray),
              pw.SizedBox(height: 8),

              _receiptLine('Invoice #', invoiceId, darkGray, mediumGray),
              pw.SizedBox(height: 6),
              _receiptLine('Customer', customerName, darkGray, mediumGray),
              pw.SizedBox(height: 6),
              _receiptLine('Type', paymentType, darkGray, mediumGray),
              pw.SizedBox(height: 6),
              _receiptLine('Method', paymentMethod, darkGray, mediumGray),

              pw.SizedBox(height: 14),
              _dashedDivider(dividerColor),
              pw.SizedBox(height: 12),

              // ═══ TOTAL ROW (Highlighted) ════════════════════════════
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: pw.BoxDecoration(
                  color: lightGray,
                  borderRadius: pw.BorderRadius.circular(6),
                ),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'TOTAL',
                      style: pw.TextStyle(
                        fontSize: 11,
                        fontWeight: pw.FontWeight.bold,
                        color: darkGray,
                        letterSpacing: 1.5,
                      ),
                    ),
                    pw.Text(
                      amount.toCurrency(),
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              pw.SizedBox(height: 16),
              _dashedDivider(dividerColor),
              pw.SizedBox(height: 12),

              // ═══ FOOTER ═════════════════════════════════════════════
              pw.Center(
                child: pw.Text(
                  'thank_you_for_your_business'.tr(),
                  textAlign: pw.TextAlign.center,
                  style: pw.TextStyle(
                    fontSize: 10,
                    fontWeight: pw.FontWeight.bold,
                    color: darkGray,
                  ),
                ),
              ),
              pw.SizedBox(height: 4),
              pw.Center(
                child: pw.Text(
                  'Please keep this receipt',
                  textAlign: pw.TextAlign.center,
                  style: pw.TextStyle(
                    fontSize: 8,
                    color: mediumGray,
                  ),
                ),
              ),

              pw.SizedBox(height: 10),

              // // ── Barcode-like decoration ──────────────────────────────
              // pw.Center(
              //   child: pw.Container(
              //     height: 30,
              //     width: 140,
              //     child: pw.CustomPaint(
              //       painter: (canvas, size) {
              //         _drawFakeBarcode(canvas, size, primaryColor);
              //       },
              //     ),
              //   ),
              // ),

              // pw.SizedBox(height: 4),

              // pw.Center(
              //   child: pw.Text(
              //     '*$invoiceId*',
              //     style: pw.TextStyle(
              //       fontSize: 8,
              //       color: mediumGray,
              //       letterSpacing: 2,
              //     ),
              //   ),
              // ),
              pw.Center(
                child: pw.BarcodeWidget(
                  barcode: pw.Barcode.code128(),
                  data: invoiceId,
                  width: 140,
                  height: 40,
                  drawText: false,
                  color: primaryColor,
                ),
              ),

              pw.SizedBox(height: 4),

              pw.Center(
                child: pw.Text(
                  invoiceId,
                  style: pw.TextStyle(
                    fontSize: 8,
                    color: mediumGray,
                    letterSpacing: 2,
                  ),
                ),
              ),
              pw.SizedBox(height: 12),

              // ── Bottom note ──────────────────────────────────────────
              pw.Center(
                child: pw.Text(
                  '— END OF RECEIPT —',
                  style: pw.TextStyle(
                    fontSize: 7,
                    color: mediumGray,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  // ── Section label helper ─────────────────────────────────────────────
  static pw.Widget _sectionLabel(String label, PdfColor color) {
    return pw.Text(
      label,
      style: pw.TextStyle(
        fontSize: 8,
        color: color,
        letterSpacing: 1.5,
        fontWeight: pw.FontWeight.bold,
      ),
    );
  }

  // ── Receipt line (label .... value) ──────────────────────────────────
  static pw.Widget _receiptLine(
    String label,
    String value,
    PdfColor valueColor,
    PdfColor labelColor,
  ) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          flex: 4,
          child: pw.Text(
            label,
            style: pw.TextStyle(
              fontSize: 10,
              color: labelColor,
            ),
          ),
        ),
        pw.Expanded(
          flex: 6,
          child: pw.Text(
            value,
            textAlign: pw.TextAlign.right,
            style: pw.TextStyle(
              fontSize: 10,
              fontWeight: pw.FontWeight.bold,
              color: valueColor,
            ),
          ),
        ),
      ],
    );
  }

  // ── Dashed divider ───────────────────────────────────────────────────
  static pw.Widget _dashedDivider(PdfColor color) {
    return pw.LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints?.maxWidth ?? 200;
        const dashWidth = 3.0;
        const dashSpace = 2.0;
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();

        return pw.Row(
          mainAxisSize: pw.MainAxisSize.max,
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return pw.SizedBox(
              width: dashWidth,
              height: 1,
              child: pw.DecoratedBox(
                decoration: pw.BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }

  // ── Fake barcode drawing ─────────────────────────────────────────────
  static void _drawFakeBarcode(
    dynamic canvas,
    PdfPoint size,
    PdfColor color,
  ) {
    canvas.setFillColor(color);

    // Pattern of varying bar widths
    final pattern = [2.0, 1, 3, 1, 2, 2, 1, 3, 2, 1, 2, 3, 1, 2, 1, 3, 2, 1, 2];
    double x = 0;
    int i = 0;

    while (x < size.x) {
      final w = pattern[i % pattern.length];
      canvas.drawRect(x, 0, w, size.y);
      canvas.fillPath();
      x += w + 1;
      i++;
    }
  }
}
