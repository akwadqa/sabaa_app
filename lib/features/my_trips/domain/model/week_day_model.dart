import 'package:freezed_annotation/freezed_annotation.dart';

part 'week_day_model.freezed.dart';

@freezed
abstract class WeekDayModel with _$WeekDayModel {
  const factory WeekDayModel({
    required DateTime date,        // full date — used for API calls
    required bool     isSelected,
  }) = _WeekDayModel;

  // ── Derived helpers ────────────────────────────────────────────────────────
  // (const factory freezed classes can't have methods directly;
  //  add them via extension below)
}

extension WeekDayModelX on WeekDayModel {
  /// Short day abbreviation key for easy_localization — e.g. 'day_mon'
  String get dayKey {
    const keys = [
      'day_mon', 'day_tue', 'day_wed',
      'day_thu', 'day_fri', 'day_sat', 'day_sun',
    ];
    return keys[date.weekday - 1]; // weekday: 1=Mon … 7=Sun
  }

  /// Display number — e.g. '7', '13'
  String get dayNumber => date.day.toString();

  String get isoDate =>
      '${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/${date.year}';
}