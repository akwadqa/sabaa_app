import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class OrderSummaryFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const OrderSummaryFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsetsDirectional.only(end: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 36,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.filterBg,
          border: isSelected ? null : Border.all(color: AppColors.navBorder),
          borderRadius: BorderRadius.circular(9999),
        ),
        alignment: Alignment.center,
        child: Text(
          label.tr().toUpperCase(),
          style: AppTextStyle.rubikSemiBold14.copyWith(
            color: isSelected ? AppColors.white : AppColors.textHeading,
          ),
        ),
      ),
    );
  }
}
