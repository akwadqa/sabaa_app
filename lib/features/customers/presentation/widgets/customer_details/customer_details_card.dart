import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
class CustomerStat {
  const CustomerStat({
    required this.labelKey,
    required this.value,
    this.subtitleKey,
    this.subtitleArgs,
    this.growth,         // e.g. "+12%" — null when not applicable
    this.isGrowthPositive,
  });

  final String  labelKey;
  final String  value;
  final String? subtitleKey;
  final Map<String, String>? subtitleArgs;
  final String? growth;
  final bool?   isGrowthPositive;
}

class CustomerDetailsCard extends StatelessWidget {
  const CustomerDetailsCard({
    super.key,
    required this.stat,
    required this.iconData,
    required this.iconBgColor,
    required this.iconColor,
  });

  final CustomerStat stat;
  final IconData     iconData;
  final Color        iconBgColor;
  final Color        iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Text block ──────────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stat.labelKey.tr(),
                  style: AppTextStyle.interMedium14.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                8.verticalSpace,
                Text(
                  stat.value,
                  style: AppTextStyle.interBold30.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                4.verticalSpace,
                _Subtitle(stat: stat),
              ],
            ),
          ),

          // ── Icon badge ──────────────────────────────────────────
          Container(
            // width: 36,
            // height: 36,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(iconData, size: 25, color: iconColor),
          ),
        ],
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({required this.stat});

  final CustomerStat stat;

  @override
  Widget build(BuildContext context) {
    // Growth indicator (e.g. "↑ 12% from last month")
    if (stat.growth != null) {
      final isPositive = stat.isGrowthPositive ?? true;
      return Text(
        stat.growth!,
        style: AppTextStyle.interRegular12.copyWith(
          color: isPositive
              ? const Color(0xFF22C55E)
              : AppColors.red,
        ),
      );
    }

    // Plain subtitle (e.g. "Due in 5 days")
    if (stat.subtitleKey != null) {
      return Text(
        stat.subtitleKey!.tr(namedArgs: stat.subtitleArgs ?? {}),
        style: AppTextStyle.interRegular12.copyWith(
          color: AppColors.statusVisitedAmount,
        ),
      );
    }

    return const SizedBox.shrink();
  }
}