import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class OrderCategoryFilter extends StatelessWidget {
  const OrderCategoryFilter({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onSelected,
    required this.returnColor,
  });

  final List<String> categories; // list of translation keys
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final Color returnColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(categories.length, (i) {
          final isActive = i == selectedIndex;
          return Padding(
            padding: EdgeInsets.only(right: i < categories.length - 1 ? 8 : 0),
            child: GestureDetector(
              onTap: () => onSelected(i),
              child: Container(
                height: 36,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: isActive ? returnColor : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(9999),
                  border: isActive
                      ? null
                      : Border.all(color: const Color(0xFFF3F4F6)),
                ),
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  categories[i].tr(),
                  style: AppTextStyle.interMedium14.copyWith(
                    color: isActive ? AppColors.white : AppColors.textHeading,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
