
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/functions/app_spacing.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class HeaderBanner extends StatelessWidget {
  const HeaderBanner({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
            width: double.infinity,

      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical:40,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Row(
              children: [
                Text(
                  '${'hello'.tr()} $userName',
                 style: AppTextStyle.interSemiBold18.copyWith(
                    color: AppColors.white,
                    letterSpacing: -0.14,
                  ),
                ),
                8.horizontalSpace,
                const Text('👋', style: TextStyle(fontSize: 22)),
              ],
            ),
          ),
          12.verticalSpace,
           Text(
            'ready_for_your_route_today'.tr(),
             style: AppTextStyle.interMedium18.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}