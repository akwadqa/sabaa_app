import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/loading_button.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/view_only/delivered_button.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/functions/check_role.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../invoice_pdf_actions_service.dart';

class ViewOnlyBottomBar extends ConsumerStatefulWidget {
  const ViewOnlyBottomBar({
    super.key,
    required this.onShare,
    required this.onPrint,
    required this.isLoading,
    required this.invoiceId,
    this.paymentReferences = const [],
    this.onPrintPayment,
    this.pdfActions,
  });

  final VoidCallback onShare;
  final VoidCallback onPrint;
  final bool isLoading;
  final String invoiceId;
  final List<String> paymentReferences;
  final InvoicePdfActionsService? pdfActions;
  final void Function(String paymentId)? onPrintPayment;
  @override
  ConsumerState<ViewOnlyBottomBar> createState() => _ViewOnlyBottomBarState();
}

class _ViewOnlyBottomBarState extends ConsumerState<ViewOnlyBottomBar> {
  bool _isPaymentPrinting = false; // ✅ separate loading
    InvoicePdfActionsService? _paymentPdfActions; // ✅ separate instance

  @override
  void initState() {
    super.initState();

    // ✅ Create a SEPARATE pdf actions service for payment printing
    // This one does NOT affect the parent's loading state
    _paymentPdfActions = InvoicePdfActionsService(
      ref: ref,
      context: () => context,
      isMounted: () => mounted,
      onLoadingChange: (loading) {
        // ✅ Only update local payment loading, NOT parent
        if (mounted) setState(() => _isPaymentPrinting = loading);
      },
    );
  }

 Future<void> _printPayment(String paymentId) async {
    if (_isPaymentPrinting) return;

    await _paymentPdfActions?.printFromHtmlById(
      documentId: paymentId,
      docType: InvoiceDocType.paymentEntry,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDelivery =
        checkRole(ref, delivery: true, defaultWidget: false) as bool;
    final hasPayments = widget.paymentReferences.isNotEmpty;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: widget.isLoading
            ? const LoadingButton()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ── Main row: Print Invoice ─────────────────────
                  Row(
                    children: [
                      Expanded(
                        child: isDelivery
                             ? DeliveredButton(invoiceId: widget.invoiceId)
                            : _PrintButton(onPrint: widget.onPrint),
                      ),
                    ],
                  ),

                  // ── Print Payment button (only if has payments) ─
                  if (hasPayments && !isDelivery) ...[
                    const SizedBox(height: 12),
                    _PrintPaymentButton(
                      paymentReferences: widget.paymentReferences,
                      isLoading: _isPaymentPrinting, // ✅ own loading
                      onPrintPayment: _printPayment,
                    ),
                  ],
                ],
              ),
      ),
    );
  }
}

class _PrintButton extends StatelessWidget {
  const _PrintButton({required this.onPrint});

  final VoidCallback onPrint;

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      text: '',
      onTap: onPrint,
      width: double.infinity,
      isFiled: true,
      height: 48,
      backgroundColor: AppColors.successGreen,
      radius: 12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          const Icon(
            Icons.print_outlined,
            color: AppColors.white,
            size: 25,
          ),
          Text(
            'print'.tr(),
            style:
                AppTextStyle.interSemiBold16.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}

class _PrintPaymentButton extends StatelessWidget {
  const _PrintPaymentButton({
    required this.paymentReferences,
    required this.onPrintPayment,
    required this.isLoading, // ✅ add
  });

  final List<String> paymentReferences;
  final void Function(String paymentId) onPrintPayment;
  final bool isLoading; // ✅ add

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: isLoading ? null : () => _handleTap(context), // ✅
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading
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
                    Icons.receipt_long_outlined,
                    color: AppColors.primary,
                    size: 22,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'print_payment'.tr(),
                    style: AppTextStyle.interSemiBold16.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  if (paymentReferences.length > 1) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${paymentReferences.length}',
                        style: AppTextStyle.interSemiBold12.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
      ),
    );
  }

  void _handleTap(BuildContext context) {
    if (paymentReferences.length == 1) {
      onPrintPayment(paymentReferences.first);
    } else {
      _showPaymentSelectionDialog(context);
    }
  }

  void _showPaymentSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => _PaymentSelectionDialog(
        paymentReferences: paymentReferences,
        onSelected: (paymentId) {
          Navigator.of(ctx).pop();
          onPrintPayment(paymentId);
        },
      ),
    );
  }
}
class _PaymentSelectionDialog extends StatelessWidget {
  const _PaymentSelectionDialog({
    required this.paymentReferences,
    required this.onSelected,
  });

  final List<String> paymentReferences;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Header ─────────────────────────────────────
            Row(
              children: [
                const Icon(
                  Icons.receipt_long_outlined,
                  color: AppColors.primary,
                  size: 24,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'select_payment'.tr(),
                    style: AppTextStyle.interBold18.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.close_rounded,
                    color: AppColors.textSecondary,
                    size: 24,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Divider(height: 1),
            const SizedBox(height: 8),

            // ── Payment list ───────────────────────────────
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.4,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: paymentReferences.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (_, index) {
                  final paymentId = paymentReferences[index];

                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => onSelected(paymentId),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.04),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.15),
                          ),
                        ),
                        child: Row(
                          children: [
                            // ── Payment icon ────────────────────
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.payment_rounded,
                                color: AppColors.primary,
                                size: 20,
                              ),
                            ),

                            const SizedBox(width: 12),

                            // ── Payment ID ──────────────────────
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    paymentId,
                                    style:
                                        AppTextStyle.interSemiBold14.copyWith(
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'payment_entry'.tr(),
                                    style: AppTextStyle.interRegular12.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // ── Print icon ──────────────────────
                            const Icon(
                              Icons.print_outlined,
                              color: AppColors.primary,
                              size: 22,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
