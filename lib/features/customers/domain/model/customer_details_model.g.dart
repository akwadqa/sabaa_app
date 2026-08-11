// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerDetailsModel _$CustomerDetailsModelFromJson(
        Map<String, dynamic> json) =>
    _CustomerDetailsModel(
      customerId: json['customerId'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      status: json['status'] as String,
      isActive: json['isActive'] as bool,
      outstandingBalance: json['outstandingBalance'] as num,
      totalSales: json['totalSales'] as num,
      location: json['location'] as String?,
      creditNotes: (json['creditNotes'] as List<dynamic>?)
              ?.map((e) => CreditNoteModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CustomerDetailsModelToJson(
        _CustomerDetailsModel instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'name': instance.name,
      'phone': instance.phone,
      'status': instance.status,
      'isActive': instance.isActive,
      'outstandingBalance': instance.outstandingBalance,
      'totalSales': instance.totalSales,
      'location': instance.location,
      'creditNotes': instance.creditNotes,
    };
