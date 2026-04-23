// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
// import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

// import '../../domain/model/week_day_model.dart';

// class WeekDayPicker extends StatelessWidget {
//   const WeekDayPicker({
//     super.key,
//     required this.days,
//     required this.onDaySelected,
//   });

//   final List<WeekDay>  days;
//   final ValueChanged<int> onDaySelected;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(days.length, (i) {
//           return Padding(
//             padding: EdgeInsets.only(right: i < days.length - 1 ? 13 : 0),
//             child: _DayCell(
//               day: days[i],
//               onTap: () => onDaySelected(i),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

// class _DayCell extends StatelessWidget {
//   const _DayCell({required this.day, required this.onTap});

//   final WeekDay      day;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     final isSelected = day.isSelected;

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 56,
//         height: 56,
//         decoration: BoxDecoration(
//           color: isSelected ? AppColors.primary : AppColors.white,
//           borderRadius: BorderRadius.circular(12),
//           border: isSelected
//               ? null
//               : Border.all(color: AppColors.navBorder),
//           boxShadow: isSelected
//               ? const [
//                   BoxShadow(color: Color(0x33137FEC), blurRadius: 6,  offset: Offset(0, 4),  spreadRadius: -4),
//                   BoxShadow(color: Color(0x33137FEC), blurRadius: 15, offset: Offset(0, 10), spreadRadius: -3),
//                 ]
//               : null,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               day.dayKey.tr().toUpperCase(),
//               style: AppTextStyle.interMedium10.copyWith(
//                 color: isSelected ? AppColors.white : AppColors.textSecondary,
//               ),
//             ),
//             Text(
//               day.date,
//               style: AppTextStyle.interBold18.copyWith(
//                 fontSize: 16,
//                 color: isSelected ? AppColors.white : AppColors.textHeading,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

import '../../domain/model/week_day_model.dart';

class WeekDayPicker extends StatefulWidget {
  const WeekDayPicker({
    super.key,
    required this.days,
    required this.onDaySelected,
  });

  final List<WeekDayModel>      days;
  final ValueChanged<DateTime>  onDaySelected;  // passes the full DateTime back

  @override
  State<WeekDayPicker> createState() => _WeekDayPickerState();
}

class _WeekDayPickerState extends State<WeekDayPicker> {
  static const double _cellWidth  = 56;
  static const double _cellGap    = 13;
  static const double _cellStride = _cellWidth + _cellGap;

  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: _initialOffset(),
    );
  }

  /// Scroll so the selected day is centred in the viewport.
  double _initialOffset() {
    final selectedIndex = widget.days.indexWhere((d) => d.isSelected);
    if (selectedIndex < 0) return 0;

    // We don't know the viewport width at this point, so approximate with
    // a 3-cell offset to the left — the user can still scroll.
    final offset = (selectedIndex - 2) * _cellStride;
    return offset < 0 ? 0 : offset;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller:      _scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.days.length, (i) {
          final day = widget.days[i];
          return Padding(
            padding: EdgeInsets.only(
              right: i < widget.days.length - 1 ? _cellGap : 0,
            ),
            child: _DayCell(
              day:   day,
              onTap: () => widget.onDaySelected(day.date),
            ),
          );
        }),
      ),
    );
  }
}

// ── Day cell ──────────────────────────────────────────────────────────────────

class _DayCell extends StatelessWidget {
  const _DayCell({required this.day, required this.onTap});

  final WeekDayModel day;
  final VoidCallback onTap;

  bool get _isToday {
    final now = DateTime.now();
    return day.date.year  == now.year  &&
           day.date.month == now.month &&
           day.date.day   == now.day;
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = day.isSelected;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:  56,
        height: 56,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : _isToday
                  ? AppColors.dateBadge          // soft blue highlight for today
                  : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? null
              : Border.all(
                  color: _isToday
                      ? AppColors.primary.withOpacity(0.4)
                      : AppColors.navBorder,
                ),
          boxShadow: isSelected
              ? const [
                  BoxShadow(
                    color:       Color(0x33137FEC),
                    blurRadius:  6,
                    offset:      Offset(0, 4),
                    spreadRadius: -4,
                  ),
                  BoxShadow(
                    color:       Color(0x33137FEC),
                    blurRadius:  15,
                    offset:      Offset(0, 10),
                    spreadRadius: -3,
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Day abbreviation  e.g. MON
            Text(
              day.dayKey.tr().toUpperCase(),
              style: AppTextStyle.interMedium10.copyWith(
                color: isSelected
                    ? AppColors.white
                    : _isToday
                        ? AppColors.primary
                        : AppColors.textSecondary,
              ),
            ),
            // Day number  e.g. 13
            Text(
              day.dayNumber,
              style: AppTextStyle.interBold18.copyWith(
                fontSize: 16,
                color: isSelected
                    ? AppColors.white
                    : _isToday
                        ? AppColors.primary
                        : AppColors.textHeading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}