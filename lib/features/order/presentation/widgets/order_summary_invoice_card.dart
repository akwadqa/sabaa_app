import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import 'invoice_payment_bottom_sheet.dart';

class OrderSummaryInvoiceCard extends StatelessWidget {
  final String id;
  final String amount;
  final String date;
  final String status;
  final List<String>? actions;

  const OrderSummaryInvoiceCard({
    super.key,
    required this.id,
    required this.amount,
    required this.date,
    required this.status,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(id,
                              style: AppTextStyle.rubikBold14
                                  .copyWith(color: AppColors.textHeading)),
                          Text(amount,
                              style: AppTextStyle.rubikBold18
                                  .copyWith(color: AppColors.black900)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            date,
                            style: AppTextStyle.rubikBold10
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
          if (actions != null && actions!.isNotEmpty) ...[
            const Divider(height: 1, color: AppColors.dividerColor),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Row(
                children: actions!.map((action) {
                  final isLast = action == actions!.last;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: isLast ? 0 : 22),
                      child: _buildActionButton(context, action),
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

    switch (status) {
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
        labelKey = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Text(
        labelKey.tr().toUpperCase(),
        style: AppTextStyle.rubikBold12.copyWith(color: text, fontSize: 10),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String type) {
    final isPay = type == 'pay';
    return GestureDetector(
      onTap: isPay
          ? () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => InvoicePaymentBottomSheet(
                  invoiceId: id,
                  amount: amount,
                  outstandingBalance:
                      '45,000 QAR', // TODO: Make this dynamic from props
                ),
              );
            }
          : null,
      child: Container(
        height: 48,
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
            isPay
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
