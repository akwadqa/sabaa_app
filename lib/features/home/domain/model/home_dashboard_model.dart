import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sabaa/features/home/domain/model/daily_performance_model.dart';
import 'package:sabaa/features/home/domain/model/home_trip_model.dart';

part 'home_dashboard_model.freezed.dart';
part 'home_dashboard_model.g.dart';

@freezed
abstract class HomeDashboardModel with _$HomeDashboardModel {
  const factory HomeDashboardModel({
    required DateModel date,
    required DailyPerformanceModel dailyPerformance,
    required HomeTripModel trip,
  }) = _HomeDashboardModel;

  factory HomeDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDashboardModelFromJson(json);
}
@freezed
abstract class DateModel with _$DateModel {
  const factory DateModel({
    required String today,
    required String formattedDate,
  }) = _DateModel;

  factory DateModel.fromJson(Map<String, dynamic> json) =>
      _$DateModelFromJson(json);
}