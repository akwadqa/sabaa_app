// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TripModel _$TripModelFromJson(Map<String, dynamic> json) => _TripModel(
      name: json['name'] as String,
      tripDate: json['tripDate'] as String,
      tripType: json['tripType'] as String,
      status: json['status'] as String,
      salesPerson: json['salesPerson'] as String,
      warehouse: json['warehouse'] as String?,
      visitSummary: VisitSummaryModel.fromJson(
          json['visitSummary'] as Map<String, dynamic>),
      customerStops: (json['customerStops'] as List<dynamic>?)
              ?.map(
                  (e) => CustomerStopModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      visits: (json['visits'] as List<dynamic>?)
              ?.map((e) => VisitModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      vehicle: json['vehicle'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      duration: (json['duration'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TripModelToJson(_TripModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tripDate': instance.tripDate,
      'tripType': instance.tripType,
      'status': instance.status,
      'salesPerson': instance.salesPerson,
      'warehouse': instance.warehouse,
      'visitSummary': instance.visitSummary,
      'customerStops': instance.customerStops,
      'visits': instance.visits,
      'vehicle': instance.vehicle,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'duration': instance.duration,
    };
