import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class PaymentSummaryCards extends StatelessWidget {
  final String amount;
  final String outstandingBalance;

  const PaymentSummaryCards({
    super.key,
    required this.amount,
    required this.outstandingBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            label: 'invoice_amount'.tr(),
            value: amount,
            valueColor: AppColors.primary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _SummaryCard(
            label: 'out_balance'.tr(),
            value: outstandingBalance,
            valueColor: AppColors.errorRed,
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const _SummaryCard({
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 18),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.methodSelectorBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: AppTextStyle.rubikRegular16.copyWith(color: AppColors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: AppTextStyle.rubikBold18.copyWith(color: valueColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
