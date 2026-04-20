// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeTripModel _$HomeTripModelFromJson(Map<String, dynamic> json) =>
    _HomeTripModel(
      tripName: json['tripName'] as String,
      status: json['status'] as String,
      totalVisitsPlanned: (json['totalVisitsPlanned'] as num).toInt(),
      completedVisits: (json['completedVisits'] as num).toInt(),
      remainingVisits: (json['remainingVisits'] as num).toInt(),
      progressPercentage: (json['progressPercentage'] as num).toInt(),
    );

Map<String, dynamic> _$HomeTripModelToJson(_HomeTripModel instance) =>
    <String, dynamic>{
      'tripName': instance.tripName,
      'status': instance.status,
      'totalVisitsPlanned': instance.totalVisitsPlanned,
      'completedVisits': instance.completedVisits,
      'remainingVisits': instance.remainingVisits,
      'progressPercentage': instance.progressPercentage,
    };
