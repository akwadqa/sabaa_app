// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInformation _$UserInformationFromJson(Map<String, dynamic> json) =>
    _UserInformation(
      userId: json['userId'] as String,
      fullName: json['full_name'] as String,
      role: json['role'] as String,
      email: json['email'] as String?,
      warehouse: json['warehouse'] as String?,
    );

Map<String, dynamic> _$UserInformationToJson(_UserInformation instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'full_name': instance.fullName,
      'role': instance.role,
      'email': instance.email,
      'warehouse': instance.warehouse,
    };
