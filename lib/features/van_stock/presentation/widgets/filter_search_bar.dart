import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
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
      borderSide: const BorderSide(color: AppColors.navBorder),
      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            cursorColor: AppColors.black,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              prefixIcon: const Icon(Icons.search, color: AppColors.blueGrey),
              // suffixIcon: IconButton(
              //     icon: const Icon(
              //       Icons.tune_rounded,
              //       color: AppColors.textSecondary,
              //       size: 22,
              //     ),
              //     onPressed: onFilterTap),
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
          ),
        ),
        InkWell(
          onTap: () {
            context.push(AppRoutes.addCustomerScreen);
          },
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.navBorder),
            ),
            child: const Icon(
              Icons.add,
              color: AppColors.primary,
              size: 24,
            ),
          ),
        ),
      ],
    ).symmetricPadding(horizontal: 16);
  }
}
