import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class PaymentAmountInput extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const PaymentAmountInput({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'payment_amount'.tr(),
          style: AppTextStyle.rubikSemiBold16
              .copyWith(color: AppColors.textHeading),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'enter_payment_amount'.tr(),
            hintStyle:
                AppTextStyle.rubikRegular16.copyWith(color: AppColors.grey),
            filled: true,
            fillColor: AppColors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: AppColors.methodSelectorBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFF2E1E3)
                    .withOpacity(controller.text.isEmpty ? 1 : 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.info_outline,
                  size: 14, color: AppColors.errorRed),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'payment_applied_only_to_invoice'.tr(),
                style: AppTextStyle.rubikRegular12.copyWith(
                  fontSize: 11,
                  color: AppColors.infoText,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
