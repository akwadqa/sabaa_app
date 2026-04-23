// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_customer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    _CustomerModel(
      customerId: json['customerId'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      status: json['status'] as String?,
      isActive: json['isActive'] as bool?,
      outstandingBalance: json['outstandingBalance'] as num? ?? 0,
      totalSales: json['totalSales'] as num? ?? 0,
    );

Map<String, dynamic> _$CustomerModelToJson(_CustomerModel instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'status': instance.status,
      'isActive': instance.isActive,
      'outstandingBalance': instance.outstandingBalance,
      'totalSales': instance.totalSales,
    };
