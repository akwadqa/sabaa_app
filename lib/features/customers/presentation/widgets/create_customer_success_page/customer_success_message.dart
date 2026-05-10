import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class CustomerSuccessMessage extends StatelessWidget {
  const CustomerSuccessMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          Text(
            'customer_added_successfully'.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyle.rubikBold25.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 8),
          Text(
            'customer_info_saved'.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyle.rubikMedium18.copyWith(color: AppColors.gray04),
          ),
        ],
      ),
    );
  }
}
