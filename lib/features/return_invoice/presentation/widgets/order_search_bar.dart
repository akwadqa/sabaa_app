import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class OrderSearchBar extends StatelessWidget {
  const OrderSearchBar({
    super.key,
    required this.controller,
    required this.hintKey,
    this.onChanged,
    this.onBarcodeTap,
  });

  final TextEditingController controller;
  final String                hintKey;
  final ValueChanged<String>? onChanged;
  final VoidCallback?         onBarcodeTap;
  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderGrey),
      borderRadius: BorderRadius.circular(12),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ── Search field ─────────────────────────────────────────
        Flexible(
          child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          cursorColor: AppColors.black,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(4),
            prefixIcon: Icon(Icons.search, color: AppColors.grayHint),
            
            hintText: hintKey.tr(),
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
        const SizedBox(width: 8),
    
        // ── Barcode button ───────────────────────────────────────
        GestureDetector(
          onTap: onBarcodeTap,
          child: Container(
            width: 44,
            height: 44,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child:  Assets.icons.barcodeIcon.svg()
          ),
        ),
      ],
    );
  }
}
