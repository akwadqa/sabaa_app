// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeDashboardModel _$HomeDashboardModelFromJson(Map<String, dynamic> json) =>
    _HomeDashboardModel(
      date: DateModel.fromJson(json['date'] as Map<String, dynamic>),
      dailyPerformance: DailyPerformanceModel.fromJson(
          json['dailyPerformance'] as Map<String, dynamic>),
      trip: json['trip'] == null
          ? null
          : HomeTripModel.fromJson(json['trip'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeDashboardModelToJson(_HomeDashboardModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'dailyPerformance': instance.dailyPerformance,
      'trip': instance.trip,
    };

_DateModel _$DateModelFromJson(Map<String, dynamic> json) => _DateModel(
      today: json['today'] as String,
      formattedDate: json['formattedDate'] as String,
    );

Map<String, dynamic> _$DateModelToJson(_DateModel instance) =>
    <String, dynamic>{
      'today': instance.today,
      'formattedDate': instance.formattedDate,
    };
