// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_performance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyPerformanceModel _$DailyPerformanceModelFromJson(
        Map<String, dynamic> json) =>
    _DailyPerformanceModel(
      totalSales: (json['totalSales'] as num).toInt(),
      totalVisitsCompleted: (json['totalVisitsCompleted'] as num).toInt(),
      totalOrdersCreated: (json['totalOrdersCreated'] as num).toInt(),
      totalPaymentsCollected: (json['totalPaymentsCollected'] as num).toInt(),
    );

Map<String, dynamic> _$DailyPerformanceModelToJson(
        _DailyPerformanceModel instance) =>
    <String, dynamic>{
      'totalSales': instance.totalSales,
      'totalVisitsCompleted': instance.totalVisitsCompleted,
      'totalOrdersCreated': instance.totalOrdersCreated,
      'totalPaymentsCollected': instance.totalPaymentsCollected,
    };
