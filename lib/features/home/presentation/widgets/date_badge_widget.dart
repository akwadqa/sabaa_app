import 'package:flutter/material.dart';
import 'package:sabaa/src/core/utils/functions/app_spacing.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class DateBadge extends StatelessWidget {
  const DateBadge({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.dateBadge,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
       style: AppTextStyle.interSemiBold12.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }
}