// ── Section header ────────────────────────────────────────────────────────────

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class NewOrderSectionHeaderWidget extends StatelessWidget {
  const NewOrderSectionHeaderWidget({super.key, 
    required this.titleKey,
    required this.count,
    required this.isReturn,
  });

  final String titleKey;
  final int count;
  final bool isReturn;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          titleKey.tr(),
          style: AppTextStyle.interBold18.copyWith(
            color: AppColors.textHeading,
            letterSpacing: -0.27,
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          child: Container(
            key: ValueKey(isReturn),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isReturn ? const Color(0xFFFEECDF) : AppColors.dateBadge,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$count ${'items_label'.tr()}',
              style: AppTextStyle.interSemiBold14.copyWith(
                fontSize: 12,
                color: isReturn ? AppColors.accent : AppColors.primary,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
