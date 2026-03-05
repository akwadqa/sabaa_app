// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInformation _$UserInformationFromJson(Map<String, dynamic> json) =>
    _UserInformation(
      token: json['token'] as String,
      fullName: json['full_name'] as String,
      mobileNumber: json['mobile_no'] as String,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserInformationToJson(_UserInformation instance) =>
    <String, dynamic>{
      'token': instance.token,
      'full_name': instance.fullName,
      'mobile_no': instance.mobileNumber,
      'email': instance.email,
    };
