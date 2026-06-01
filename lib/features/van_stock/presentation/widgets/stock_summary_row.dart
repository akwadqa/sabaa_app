import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

import '../../../../src/core/utils/extenssions/int_extenssion.dart';
import '../../../../src/resourses/font_manager/app_text_style.dart';
import '../../domain/model/stock_summary.dart';

class StockSummaryRow extends StatelessWidget {
  const StockSummaryRow({super.key, required this.summary});

  final StockSummary summary;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        _SummaryCard(
          labelKey: summary.totalSkuKey,
          value: summary.totalSkuValue,
          valueColor: AppColors.textPrimary,
        ),
        // const SizedBox(width: 12),
        // _SummaryCard(
        //   labelKey: summary.lowStockKey,
        //   value: summary.lowStockValue,
        //   valueColor:AppColors.red,
        // ),
        // const SizedBox(width: 12),
        _SummaryCard(
          labelKey: summary.valueKey,
          value: summary.valueAmount.toCurrency(),
          valueColor: AppColors.textPrimary,
        ),
      ],
    ).symmetricPadding(horizontal: 18);
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.labelKey,
    required this.value,
    required this.valueColor,
  });

  final String labelKey;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.navBorder),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              labelKey.tr(),
              style: AppTextStyle.interRegular14.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            4.verticalSpace,
            FittedBox(
              child: Text(
                value,
                style: AppTextStyle.interBold18.copyWith(color: valueColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}