// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VisitModel _$VisitModelFromJson(Map<String, dynamic> json) => _VisitModel(
      name: json['name'] as String,
      customerId: json['customerId'] as String,
      customerName: json['customerName'] as String,
      customerPhone: json['customerPhone'] as String,
      location: json['location'] as String?,
      visitDate: json['visitDate'] as String,
      status: $enumDecode(_$RouteStopStatusEnumMap, json['status']),
      checkInTime: json['checkInTime'] as String?,
      checkOutTime: json['checkOutTime'] as String?,
      duration: (json['duration'] as num?)?.toDouble(),
      remark: json['remark'] as String?,
      deliveryNote: json['deliveryNote'] as String?,
    );

Map<String, dynamic> _$VisitModelToJson(_VisitModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'customerPhone': instance.customerPhone,
      'location': instance.location,
      'visitDate': instance.visitDate,
      'status': _$RouteStopStatusEnumMap[instance.status]!,
      'checkInTime': instance.checkInTime,
      'checkOutTime': instance.checkOutTime,
      'duration': instance.duration,
      'remark': instance.remark,
      'deliveryNote': instance.deliveryNote,
    };

const _$RouteStopStatusEnumMap = {
  RouteStopStatus.inProgress: 'In Progress',
  RouteStopStatus.pending: 'Pending',
  RouteStopStatus.completed: 'Completed',
  RouteStopStatus.skipped: 'Skipped',
  RouteStopStatus.failed: 'Failed',
};
