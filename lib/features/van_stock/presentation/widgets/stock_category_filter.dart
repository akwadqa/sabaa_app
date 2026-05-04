import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';
import '../../domain/model/stock_category.dart';

class StockCategoryFilter extends StatelessWidget {
  const StockCategoryFilter({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<StockCategory> categories;
  final int                 selectedIndex;
  final ValueChanged<int>   onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(categories.length, (i) {
          final isActive = i == selectedIndex;
          return Padding(
            padding: EdgeInsetsDirectional.only(start: i < categories.length - 1 ? 14 : 0),
            child: _CategoryChip(
              labelKey: categories[i].labelKey,
              isActive: isActive,
              onTap: () => onSelected(i),
            ),
          );
        }),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.labelKey,
    required this.isActive,
    required this.onTap,
  });

  final String       labelKey;
  final bool         isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? AppColors.secondPrimary : AppColors.white,
          borderRadius: BorderRadius.circular(25),
          border: isActive
              ? null
              : Border.all(color: AppColors.navBorder),
          boxShadow: isActive
              ? const [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: Text(
          labelKey.tr(),
          style: AppTextStyle.interMedium14.copyWith(
            color: isActive ? AppColors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}