import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class PaymentSuccessMessage extends StatelessWidget {
  const PaymentSuccessMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          Text(
            'payment_successful'.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyle.rubikBold25.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 18),
          Text(
            'payment_recorded_success'.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyle.rubikMedium18.copyWith(color: AppColors.gray04),
          ),
        ],
      ),
    );
  }
}
