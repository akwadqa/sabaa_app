// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SigninResponseModel _$SigninResponseModelFromJson(Map<String, dynamic> json) =>
    _SigninResponseModel(
      token: json['token'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SigninResponseModelToJson(
        _SigninResponseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      userId: json['userId'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      isEnabled: json['isEnabled'] as bool,
      warehouse: json['warehouse'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'fullName': instance.fullName,
      'isEnabled': instance.isEnabled,
      'warehouse': instance.warehouse,
      'role': instance.role,
    };
