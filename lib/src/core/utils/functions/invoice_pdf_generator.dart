// lib/features/order/data/services/invoice_pdf_generator.dart

import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' as flutter;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sabaa/features/order/presentation/controller/invoice_details_controller.dart';
import 'package:sabaa/src/core/utils/functions/helper_methods.dart';

class InvoicePdfGenerator {
  /// Generates PDF bytes from [InvoiceDetailsState].
  /// Returns [Uint8List] directly — no file needed.
  static Future<Uint8List> generate(
    flutter.BuildContext context,
    InvoiceDetailsState data,
  ) async {
    // ── Load bundled fonts ──────────────────────────────────────────────
    final regularFontData =
        await rootBundle.load('assets/fonts/Cairo-Regular.ttf');
    final boldFontData = await rootBundle.load('assets/fonts/Cairo-Bold.ttf');

    final fontRegular = pw.Font.ttf(regularFontData);
    final fontBold = pw.Font.ttf(boldFontData);

    // ── Check locale for RTL ────────────────────────────────────────────
    final isRtl = context.locale.languageCode == 'ar';

    final pdf = pw.Document(
      theme: pw.ThemeData.withFont(
        base: fontRegular,
        bold: fontBold,
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        textDirection: isRtl ? pw.TextDirection.rtl : pw.TextDirection.ltr,
        build: (pw.Context pdfContext) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _buildHeader(data),
              pw.SizedBox(height: 24),
              _buildInfoSection(data),
              pw.SizedBox(height: 24),
              _buildItemsTable(data, isRtl),
              pw.SizedBox(height: 24),
              _buildTotalsSection(data),
              pw.Spacer(),
              _buildFooter(),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  // ── Header ────────────────────────────────────────────────────────────────

  static pw.Widget _buildHeader(InvoiceDetailsState data) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'SABAA',
              style: pw.TextStyle(
                fontSize: 28,
                fontWeight: pw.FontWeight.bold,
                color: PdfColor.fromHex('#1E3A5F'),
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              'invoice_details'.tr(),
              style: pw.TextStyle(
                fontSize: 14,
                color: PdfColor.fromHex('#666666'),
              ),
            ),
          ],
        ),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Container(
              padding:
                  const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: pw.BoxDecoration(
                color: data.status == 'Paid'
                    ? PdfColor.fromHex('#E8F5E9')
                    : PdfColor.fromHex('#FFF8E1'),
                borderRadius: pw.BorderRadius.circular(8),
              ),
              child: pw.Text(
                data.status,
                style: pw.TextStyle(
                  fontSize: 12,
                  fontWeight: pw.FontWeight.bold,
                  color: data.status == 'Paid'
                      ? PdfColor.fromHex('#2E7D32')
                      : PdfColor.fromHex('#F57F17'),
                ),
              ),
            ),
            pw.SizedBox(height: 8),
            pw.Text(
              '#${data.invoiceId}',
              style: pw.TextStyle(
                fontSize: 13,
                color: PdfColor.fromHex('#333333'),
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ── Info Section ──────────────────────────────────────────────────────────

  static pw.Widget _buildInfoSection(InvoiceDetailsState data) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        color: PdfColor.fromHex('#F5F7FA'),
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoColumn(label: 'customer'.tr(), value: data.customerName),
          _buildInfoColumn(label: 'date'.tr(), value: data.postingDate),
        ],
      ),
    );
  }

  static pw.Widget _buildInfoColumn({
    required String label,
    required String value,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          label,
          style: pw.TextStyle(
            fontSize: 10,
            color: PdfColor.fromHex('#999999'),
          ),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          value,
          style: pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
            color: PdfColor.fromHex('#222222'),
          ),
        ),
      ],
    );
  }

  // ── Items Table ───────────────────────────────────────────────────────────

  static pw.Widget _buildItemsTable(InvoiceDetailsState data, bool isRtl) {
    final headers = [
      'item_name'.tr(),
      'qty'.tr(),
      'unit'.tr(),
      'price'.tr(),
      'total'.tr(),
    ];

    final tableData = data.items.map((item) {
      return [
        item.itemName,
        item.qty.toString(),
        item.uom,
        formatPrice(item.rate.toDouble()),
        formatPrice(item.amount.toDouble()),
      ];
    }).toList();

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'items'.tr(),
          style: pw.TextStyle(
            fontSize: 14,
            fontWeight: pw.FontWeight.bold,
            color: PdfColor.fromHex('#1E3A5F'),
          ),
        ),
        pw.SizedBox(height: 8),
        pw.Table.fromTextArray(
          headers: headers,
          data: tableData,
          border: pw.TableBorder.all(
            color: PdfColor.fromHex('#E0E0E0'),
            width: 0.5,
          ),
          headerStyle: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
            fontSize: 11,
            color: PdfColors.white,
          ),
          headerDecoration: pw.BoxDecoration(
            color: PdfColor.fromHex('#1E3A5F'),
          ),
          cellStyle: const pw.TextStyle(fontSize: 11),
          cellAlignments: {
            0: isRtl ? pw.Alignment.centerRight : pw.Alignment.centerLeft,
            1: pw.Alignment.center,
            2: pw.Alignment.center,
            3: isRtl ? pw.Alignment.centerLeft : pw.Alignment.centerRight,
            4: isRtl ? pw.Alignment.centerLeft : pw.Alignment.centerRight,
          },
          rowDecoration: const pw.BoxDecoration(color: PdfColors.white),
          oddRowDecoration: pw.BoxDecoration(
            color: PdfColor.fromHex('#F8F9FA'),
          ),
          cellPadding: const pw.EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 6,
          ),
        ),
      ],
    );
  }

  // ── Totals Section ────────────────────────────────────────────────────────

  static pw.Widget _buildTotalsSection(InvoiceDetailsState data) {
    return pw.Align(
      alignment: pw.Alignment.centerRight,
      child: pw.Container(
        width: 220,
        padding: const pw.EdgeInsets.all(16),
        decoration: pw.BoxDecoration(
          color: PdfColor.fromHex('#F5F7FA'),
          borderRadius: pw.BorderRadius.circular(8),
        ),
        child: pw.Column(
          children: [
            _buildTotalRow(
              label: 'subtotal'.tr(),
              value: formatPrice(data.subtotal),
            ),
            pw.SizedBox(height: 6),
            _buildTotalRow(
              label: 'delivery_fee'.tr(),
              value: formatPrice(data.deliveryFee),
            ),
            pw.Divider(
              color: PdfColor.fromHex('#CCCCCC'),
              thickness: 0.5,
            ),
            _buildTotalRow(
              label: 'total'.tr(),
              value: formatPrice(data.total),
              isBold: true,
              isHighlighted: true,
            ),
          ],
        ),
      ),
    );
  }

  static pw.Widget _buildTotalRow({
    required String label,
    required String value,
    bool isBold = false,
    bool isHighlighted = false,
  }) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(
          label,
          style: pw.TextStyle(
            fontSize: isBold ? 13 : 11,
            fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
            color: isHighlighted
                ? PdfColor.fromHex('#1E3A5F')
                : PdfColor.fromHex('#666666'),
          ),
        ),
        pw.Text(
          value,
          style: pw.TextStyle(
            fontSize: isBold ? 13 : 11,
            fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
            color: isHighlighted
                ? PdfColor.fromHex('#1E3A5F')
                : PdfColor.fromHex('#333333'),
          ),
        ),
      ],
    );
  }

  // ── Footer ────────────────────────────────────────────────────────────────

  static pw.Widget _buildFooter() {
    return pw.Column(
      children: [
        pw.Divider(color: PdfColor.fromHex('#E0E0E0'), thickness: 0.5),
        pw.SizedBox(height: 8),
        pw.Center(
          child: pw.Text(
            'thank_you_for_your_business'.tr(),
            style: pw.TextStyle(
              fontSize: 11,
              color: PdfColor.fromHex('#999999'),
              // fontStyle: pw.FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}