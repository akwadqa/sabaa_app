import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/return_invoice/presentation/controller/return_order_controller.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/functions/check_role.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import '../../../customers/domain/model/create_customer_response/create_customer_response.dart';
import '../../domain/order_summary/order_summary_model.dart';
import 'invoice_payment_bottom_sheet.dart';

class OrderSummaryInvoiceCard extends ConsumerWidget {
  final InvoiceModel invoice;
  final double outstandingBalance;
  final List<String>? actions;
  final CustomerModel customer;

  const OrderSummaryInvoiceCard({
    super.key,
    required this.invoice,
    required this.outstandingBalance,
    this.actions,
    required this.customer,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ Check delivery role
    final isDelivery = checkRole(
      ref,
      delivery: true,
      defaultWidget: false,
    ) as bool;

    // ✅ Filter actions based on role
    final effectiveActions = isDelivery
        // Delivery → only 'pay' (remove 'return')
        ? actions?.where((a) => a == 'pay').toList()
        // Other roles → keep original actions
        : actions;

    // ✅ Hide action bar entirely if invoice is Paid or is a Return
    final showActions = effectiveActions != null &&
        effectiveActions.isNotEmpty &&
        !invoice.isReturn;
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Container(
                  width: 48,
                  padding: EdgeInsets.all(11),
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.stockImageBg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Assets.icons.invoiceIc.svg(),
                  // child: const Icon(Icons.description_outlined,
                  //     color: AppColors.gray),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              invoice.invoiceId,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.rubikBold14
                                  .copyWith(color: AppColors.textHeading),
                            ),
                          ),
                          10.horizontalSpace,
                          Text(invoice.grandTotal.toCurrency(),
                              style: AppTextStyle.rubikBold18
                                  .copyWith(color: AppColors.black900)),
                        ],
                      ),
                      8.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            invoice.postingDate,
                            style: AppTextStyle.rubikSemiBold12
                                .copyWith(color: AppColors.textGrey),
                          ),
                          _buildStatusBadge(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // ── Action Buttons ──────────────────────────────────────
          if (showActions) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Row(
                spacing: 20,
                children: effectiveActions.map((action) {
                  final isLast = action == effectiveActions.last;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: isLast ? 0 : 22),
                      child: _buildActionButton(context, action, ref),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color bg;
    Color text;
    String labelKey;

    switch (invoice.status) {
      case 'Paid':
        bg = AppColors.paidBg;
        text = AppColors.paidText;
        labelKey = 'Paid';
        break;
      case 'Unpaid':
        bg = AppColors.unpaidBg;
        text = AppColors.unpaidText;
        labelKey = 'Unpaid';
        break;
      case 'Partly Paid':
        bg = AppColors.partlyPaidBg;
        text = AppColors.partlyPaidText;
        labelKey = 'Partly Paid';
        break;
      case 'Return':
        bg = AppColors.returnBg;
        text = AppColors.returnText;
        labelKey = 'Return';
        break;
      default:
        bg = Colors.grey;
        text = Colors.white;
        labelKey = invoice.status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Text(
        labelKey.tr().toUpperCase(),
        style: AppTextStyle.rubikBold12.copyWith(color: text),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String type, WidgetRef ref) {
    final isPay = type == 'pay';

    return GestureDetector(
      onTap: isPay
          ? () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => InvoicePaymentBottomSheet(
                  invoice: invoice,
                  outstandingBalance: outstandingBalance,
                ),
              );
            }
          : () {
              context.push(
                AppRoutes.returnInvoiceScreen,
                extra: {
                  'customer': customer,
                  'invoiceId': invoice.invoiceId,
                },
              );
            },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isPay ? AppColors.primary : AppColors.white,
          border:
              isPay ? null : Border.all(color: AppColors.navBorder, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            (isPay)
                ? Assets.icons.invoicePayIc.svg()
                : Assets.icons.invoiceReturnIc.svg(),
            Text(
              type.tr(),
              style: AppTextStyle.rubikBold14.copyWith(
                color: isPay ? AppColors.white : AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
