import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sabaa/features/main/presentation/screens/main_screen.dart';
import 'package:sabaa/features/new_order/presentation/controller/new_order_controller.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/invoice_pdf_actions_service.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/functions/check_role.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'package:share_plus/share_plus.dart';

class InvoiceCreatedDialog extends ConsumerWidget {
  const InvoiceCreatedDialog({super.key, required this.invoice});

  final InvoiceModel invoice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(newOrderControllerProvider).value!;
    final isReturn = state.isReturn;

    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(color: Colors.transparent),
        ),
        Center(
          child: Dialog(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'transaction_successful'.tr(),
                    style: AppTextStyle.interBold22.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SvgPicture.asset(
                    Assets.icons.successCheckIcon.keyName,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    isReturn
                        ? 'return_invoice_created_successfully'.tr()
                        : 'invoice_created_successfully'.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.interRegular14.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── Pay Now (non-return, non-salesman only) ────────
                  if (!isReturn)
                    checkRole(
                      ref,
                      salesMan: const SizedBox(),
                      defaultWidget: _PayNowButton(invoice: invoice),
                    ),

                  const SizedBox(height: 8),

                  // ── Print & Share row ──────────────────────────────
                  _PrintShareRow(invoice: invoice, isReturn: isReturn),

                  const SizedBox(height: 8),

                  // ── Done button ────────────────────────────────────
                  _DoneButton(invoice: invoice),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// PAY NOW
// ═════════════════════════════════════════════════════════════════════════════

class _PayNowButton extends ConsumerWidget {
  const _PayNowButton({required this.invoice});

  final InvoiceModel invoice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customer = ref.read(newOrderControllerProvider).value!.customer;

    return CustomButtonWidget(
      text: 'pay_now',
      onTap: () {
        context.goNamed(AppRoutes.mainScreen);
        context.pushNamed(
          AppRoutes.orderSummaryScreen,
          extra: {
            'customer': customer,
            'invoice': invoice,
            'openPayment': true,
          },
        );
      },
      isFiled: true,
      height: 48,
      width: double.infinity,
      backgroundColor: AppColors.primary,
      radius: 8,
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// DONE
// ═════════════════════════════════════════════════════════════════════════════

class _DoneButton extends ConsumerWidget {
  const _DoneButton({required this.invoice});

  final InvoiceModel invoice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customer = ref.read(newOrderControllerProvider).value!.customer;

    return CustomButtonWidget(
      text: 'done',
      onTap: () {
        context.goNamed(AppRoutes.mainScreen);
        context.pushNamed(
          AppRoutes.orderSummaryScreen,
          extra: {
            'customer': customer,
            'invoice': invoice,
          },
        );
      },
      isFiled: false,
      height: 48,
      width: double.infinity,
      backgroundColor: AppColors.partlyPaidBg,
      radius: 8,
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// PRINT & SHARE ROW
// ═════════════════════════════════════════════════════════════════════════════

class _PrintShareRow extends ConsumerStatefulWidget {
  const _PrintShareRow({
    required this.invoice,
    required this.isReturn,
  });

  final InvoiceModel invoice;
  final bool isReturn;

  @override
  ConsumerState<_PrintShareRow> createState() => _PrintShareRowState();
}

enum _DialogAction { print, share }

class _PrintShareRowState extends ConsumerState<_PrintShareRow> {
  _DialogAction? _loadingAction;
  late final InvoicePdfActionsService _pdfActions;

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
        if (!loading) {
          setState(() => _loadingAction = null);
        }
      },
    );
  }

  Future<void> _print() async {
    if (_isBusy) return;
    setState(() => _loadingAction = _DialogAction.print);

    try {
      await _pdfActions.printFromHtmlById(
        documentId: widget.invoice.invoiceId,
        docType: InvoiceDocType.salesInvoice,
      );
    } finally {
      if (mounted) setState(() => _loadingAction = null);
    }
  }

  Future<void> _share() async {
    if (_isBusy) return;
    setState(() => _loadingAction = _DialogAction.share);

    try {
      await _pdfActions.shareFromHtmlById(
        documentId: widget.invoice.invoiceId,
        docType: InvoiceDocType.salesInvoice,
      );
    } finally {
      if (mounted) setState(() => _loadingAction = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ── Print Button ─────────────────────────────────────────
        Expanded(
          child: SizedBox(
            height: 48,
            child: OutlinedButton(
              onPressed: _isBusy ? null : _print,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primary, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: _loadingAction == _DialogAction.print
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
                          size: 20,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'print'.tr(),
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

        // ── Share Button ─────────────────────────────────────────
        Expanded(
          child: SizedBox(
            height: 48,
            child: OutlinedButton(
              onPressed: _isBusy ? null : _share,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primary, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: _loadingAction == _DialogAction.share
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
                          size: 20,
                        ),
                        const SizedBox(width: 6),
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