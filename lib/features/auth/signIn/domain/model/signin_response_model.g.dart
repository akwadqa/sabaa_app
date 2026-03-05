// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SigninResponseModel _$SigninResponseModelFromJson(Map<String, dynamic> json) =>
    _SigninResponseModel(
      mobileNumber: json['mobile_number'] as String,
      userExist: json['user_exist'] as bool,
    );

Map<String, dynamic> _$SigninResponseModelToJson(
        _SigninResponseModel instance) =>
    <String, dynamic>{
      'mobile_number': instance.mobileNumber,
      'user_exist': instance.userExist,
    };

_LoginValidation _$LoginValidationFromJson(Map<String, dynamic> json) =>
    _LoginValidation(
      mobileNumber: json['mobile_number'] as String,
      userExist: json['user_exist'] as bool,
    );

Map<String, dynamic> _$LoginValidationToJson(_LoginValidation instance) =>
    <String, dynamic>{
      'mobile_number': instance.mobileNumber,
      'user_exist': instance.userExist,
    };
