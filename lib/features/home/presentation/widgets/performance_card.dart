import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/functions/app_spacing.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
class PerformanceMetric {
  const PerformanceMetric({
    required this.label,
     this.subtitle,
    required this.value,
    required this.iconColor,
     this.subtitleColor,
    required this.icon,
  });

  final String label;
  final String? subtitle;
  final String value;
  final Color iconColor;
  final Color? subtitleColor;
  final IconData icon;
}
class PerformanceCard extends StatelessWidget {
  const PerformanceCard({super.key, required this.metric});

  final PerformanceMetric metric;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg,vertical: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 25,
            offset: Offset(2, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: metric.iconColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(metric.icon,
                          color: metric.iconColor,
     size: 22),
          ),
          16.verticalSpace,
          Text(
            metric.label.tr(),
       style: AppTextStyle.interMedium14.copyWith(
              color: AppColors.textSecondary,
            ),
    
          ),
            4.verticalSpace,
          Text(
            metric.value,
            style: AppTextStyle.interBold22.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
           if (metric.subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            metric.subtitle!.tr(),
            style: AppTextStyle.interRegular12.copyWith(
              color: metric.subtitleColor ?? AppColors.textSecondary,
            ),
          ),
        ],
        ],
      ),
    );
  }
}