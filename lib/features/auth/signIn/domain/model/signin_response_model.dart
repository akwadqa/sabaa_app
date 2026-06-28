import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_response_model.freezed.dart';
part 'signin_response_model.g.dart';

@freezed
abstract class SigninResponseModel with _$SigninResponseModel {
  const factory SigninResponseModel({
    @JsonKey(name: 'token') required String token,
    @JsonKey(name: 'user') required UserModel user,
  }) = _SigninResponseModel;

  factory SigninResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseModelFromJson(json);
}

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'userId') required String userId,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'fullName') required String fullName,
    @JsonKey(name: 'isEnabled') required bool isEnabled,
    @JsonKey(name: 'warehouse')  String? warehouse,
    @JsonKey(name: 'role') required String role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
