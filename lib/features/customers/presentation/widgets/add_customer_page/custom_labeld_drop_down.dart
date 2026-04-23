import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class CustomLabeledDropdown extends StatelessWidget {
  final String label;
  final String hint;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomLabeledDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
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
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            isDense: true,
            value: value,
            hint: Text(
              hint.tr(),
              style: AppTextStyle.rubikRegular16
                  .copyWith(color: AppColors.textSecondary),
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item, style: AppTextStyle.rubikRegular16),
                    ))
                .toList(),
            onChanged: onChanged,
            customButton: Container(
              alignment: Alignment.centerLeft,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.navBorder
                    // value != null ? AppColors.primary : AppColors.navBorder,
                    ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      value != null ? value! : hint.tr(),
                      style: AppTextStyle.rubikRegular16.copyWith(
                        color: value != null
                            ? AppColors.black
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down_rounded,
                      color: AppColors.navBorder
                      // color: value != null ? AppColors.primary : AppColors.gray02,
                      ),
                ],
              ),
            ),
            buttonStyleData: const ButtonStyleData(padding: EdgeInsets.zero),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(height: 48),
          ),
        ),
      ],
    );
  }
}
