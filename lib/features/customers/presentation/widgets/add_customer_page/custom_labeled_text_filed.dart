
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class CustomLabeledTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;

  const CustomLabeledTextField({
    super.key,
    required this.label,
    required this.hint,
     this.controller,
    this.keyboardType = TextInputType.text, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label.tr(),
              style:
                  AppTextStyle.rubikSemiBold16.copyWith(color: AppColors.dark),
            ),
            const SizedBox(width: 4),
            Text(
              '*',
              style: AppTextStyle.rubikBold16.copyWith(color: AppColors.newRed),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          onChanged: (value) => onChanged?.call(value),
          cursorColor: AppColors.primary,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            
            hintText: hint.tr(),
            hintStyle: AppTextStyle.rubikRegular16
                .copyWith(color: AppColors.textSecondary),
            filled: true,
            fillColor: AppColors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.navBorder),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.navBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}