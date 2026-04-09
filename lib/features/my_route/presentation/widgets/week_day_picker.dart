import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../../domain/model/week_day.dart';

class WeekDayPicker extends StatelessWidget {
  const WeekDayPicker({
    super.key,
    required this.days,
    required this.onDaySelected,
  });

  final List<WeekDay>  days;
  final ValueChanged<int> onDaySelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(days.length, (i) {
          return Padding(
            padding: EdgeInsets.only(right: i < days.length - 1 ? 13 : 0),
            child: _DayCell(
              day: days[i],
              onTap: () => onDaySelected(i),
            ),
          );
        }),
      ),
    );
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({required this.day, required this.onTap});

  final WeekDay      day;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = day.isSelected;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? null
              : Border.all(color: AppColors.navBorder),
          boxShadow: isSelected
              ? const [
                  BoxShadow(color: Color(0x33137FEC), blurRadius: 6,  offset: Offset(0, 4),  spreadRadius: -4),
                  BoxShadow(color: Color(0x33137FEC), blurRadius: 15, offset: Offset(0, 10), spreadRadius: -3),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day.dayKey.tr().toUpperCase(),
              style: AppTextStyle.interMedium10.copyWith(
                color: isSelected ? AppColors.white : AppColors.textSecondary,
              ),
            ),
            Text(
              day.date,
              style: AppTextStyle.interBold18.copyWith(
                fontSize: 16,
                color: isSelected ? AppColors.white : AppColors.textHeading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}