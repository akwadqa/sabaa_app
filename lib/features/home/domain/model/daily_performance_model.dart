import 'package:freezed_annotation/freezed_annotation.dart';


part 'daily_performance_model.freezed.dart';
part 'daily_performance_model.g.dart'; 

@freezed
abstract class DailyPerformanceModel with _$DailyPerformanceModel {
  const factory DailyPerformanceModel({
    required int totalSales,
    required int totalVisitsCompleted,
    required int totalOrdersCreated,
    required int totalVisitsSkipped,
    required int totalPaymentsCollected,
  }) = _DailyPerformanceModel;

  factory DailyPerformanceModel.fromJson(Map<String, dynamic> json) =>
      _$DailyPerformanceModelFromJson(json);
}