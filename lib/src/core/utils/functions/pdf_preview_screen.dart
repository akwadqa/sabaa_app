// lib/features/order/presentation/screens/pdf_preview_screen.dart

import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'package:share_plus/share_plus.dart';

class PdfPreviewScreen extends StatefulWidget {
  const PdfPreviewScreen({
    super.key,
    required this.pdfBytes,
    required this.invoiceId,
  });

  final Uint8List pdfBytes;
  final String invoiceId;

  @override
  State<PdfPreviewScreen> createState() => _PdfPreviewScreenState();
}

class _PdfPreviewScreenState extends State<PdfPreviewScreen> {
  bool _isBusy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.close, color: AppColors.textPrimary),
        ),
        title: Text(
          'pdf_preview'.tr(),
          style: AppTextStyle.interBold20.copyWith(color: AppColors.dark),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: AppColors.navBorder),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: _isBusy
              ? _buildLoadingRow()
              : Row(
                  spacing: 12,
                  children: [
                    // ── Discard ──────────────────────────────────────────
                    Expanded(
                      child: _ActionButton(
                        label: 'discard'.tr(),
                        icon: Icons.delete_outline,
                        color: AppColors.errorRed,
                        outlined: true,
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ),

                    // ── Download / Share ─────────────────────────────────
                    Expanded(
                      child: _ActionButton(
                        label: 'download'.tr(),
                        icon: Icons.download_outlined,
                        color: AppColors.primary,
                        onTap: _downloadAndShare,
                      ),
                    ),

                    // ── Print ────────────────────────────────────────────
                    Expanded(
                      child: _ActionButton(
                        label: 'print'.tr(),
                        icon: Icons.print_outlined,
                        color: AppColors.successGreen,
                        onTap: _print,
                      ),
                    ),
                  ],
                ),
        ),
      ),
      body: PdfPreview(
        build: (_) => widget.pdfBytes,
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        allowPrinting: false,
        allowSharing: false,
        pdfFileName: 'invoice_${widget.invoiceId}.pdf',
        loadingWidget: const Center(child: AppLoader()),
      ),
    );
  }

  // ── Loading Row ───────────────────────────────────────────────────────────

  Widget _buildLoadingRow() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'processing'.tr(),
            style:
                AppTextStyle.interSemiBold14.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  String _sanitizeFileName(String invoiceId) {
    return invoiceId.replaceAll(RegExp(r'[/\\:*?"<>|]'), '_');
  }
  // ── Download & Share ──────────────────────────────────────────────────────

  Future<void> _downloadAndShare() async {
    setState(() => _isBusy = true);

    try {
      final dir = await getTemporaryDirectory();
      final safeName = _sanitizeFileName(widget.invoiceId);
      final filePath = '${dir.path}/invoice_$safeName.pdf';
      final file = File(filePath);
      await file.writeAsBytes(widget.pdfBytes);
      SharePlus.instance.share(
        ShareParams(
            files: [XFile(file.path)],
            text: '${'invoice'.tr()} #${widget.invoiceId}'),
      );
      // await ShareResult(
      //   [XFile(file.path)],
      //   text: '${'invoice'.tr()} #${widget.invoiceId}',
      // );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('failed_to_share_pdf'.tr()),
            backgroundColor: AppColors.errorRed,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  // ── Print ─────────────────────────────────────────────────────────────────

  Future<void> _print() async {
    setState(() => _isBusy = true);

    try {
      await Printing.layoutPdf(
        onLayout: (_) async => widget.pdfBytes,
        name: 'invoice_${widget.invoiceId}.pdf',
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('failed_to_generate_pdf'.tr()),
            backgroundColor: AppColors.errorRed,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }
}

// ── Reusable Action Button ──────────────────────────────────────────────────

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
    this.outlined = false,
  });

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: outlined ? Colors.transparent : color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 48,
          decoration: outlined
              ? BoxDecoration(
                  border: Border.all(color: color, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                )
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 6,
            children: [
              Icon(icon, color: outlined ? color : Colors.white, size: 18),
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.interSemiBold14.copyWith(
                    color: outlined ? color : Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
