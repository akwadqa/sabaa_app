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
    this.onBarcodeTap,
    required this.hint,
     this.isCustomer=false,
  });
  final String hint;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback?         onBarcodeTap;
  final bool isCustomer;
  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderGrey),
      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // ── Search field ─────────────────────────────────────────
        Flexible(
          flex: 4,
          child: TextFormField(
      controller: controller,
      onChanged: onChanged,
      cursorColor: AppColors.black,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(4),
        prefixIcon: Icon(Icons.search, color: AppColors.grayHint),

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
    )

        ),
        // const SizedBox(width: 8),
    (isCustomer)?
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
    )
    .onlyPadding(start: 16):
        Flexible(
          child: GestureDetector(
            onTap: onBarcodeTap,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child:  Icon(
                Icons.qr_code_scanner_rounded,
                color: AppColors.primary,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
 }
}
