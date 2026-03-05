import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_response_model.freezed.dart';
part 'signin_response_model.g.dart';

@freezed
abstract class SigninResponseModel with _$SigninResponseModel {
  const factory SigninResponseModel({
    @JsonKey(name: 'mobile_number') required String mobileNumber,
    @JsonKey(name: 'user_exist') required bool userExist,
  }) = _SigninResponseModel;

  factory SigninResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseModelFromJson(json);
}

@freezed
abstract class LoginValidation with _$LoginValidation {
  const factory LoginValidation({
    @JsonKey(name: 'mobile_number') required String mobileNumber,
    @JsonKey(name: 'user_exist') required bool userExist,
  }) = _LoginValidation;

  factory LoginValidation.fromJson(Map<String, dynamic> json) =>
      _$LoginValidationFromJson(json);
}
