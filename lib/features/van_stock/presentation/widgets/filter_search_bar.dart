import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

import '../../../../src/resourses/font_manager/app_text_style.dart';

class FilterSearchBar extends StatelessWidget {
  const FilterSearchBar({
    super.key,
    required this.controller,
    this.onChanged,
    this.onFilterTap,
    required this.hint,
  });
  final String hint;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;
  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderGrey),
      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      cursorColor: AppColors.black,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(4),
        prefixIcon: Icon(Icons.search, color: AppColors.grayHint),
        suffixIcon: IconButton(
            icon: const Icon(
              Icons.tune_rounded,
              color: AppColors.textSecondary,
              size: 22,
            ),
            onPressed: onFilterTap),
        hintText: hint.tr(),
        hintStyle: AppTextStyle.interRegular16.copyWith(
          color: AppColors.textSecondary,
        ),
        filled: true,
        fillColor: AppColors.white,
        border: _border(),
        errorBorder: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(),
        disabledBorder: _border(),
        focusedErrorBorder: _border(),
      ),
    ).symmetricPadding(horizontal: 16);
  }
}
