// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeDashboardModel _$HomeDashboardModelFromJson(Map<String, dynamic> json) =>
    _HomeDashboardModel(
      userName: json['userName'] as String? ?? '',
      todayDate: json['todayDate'] as String? ?? '',
      salesVolume: json['salesVolume'] as String? ?? '',
      todaysVisits: (json['todaysVisits'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$HomeDashboardModelToJson(_HomeDashboardModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'todayDate': instance.todayDate,
      'salesVolume': instance.salesVolume,
      'todaysVisits': instance.todaysVisits,
    };
