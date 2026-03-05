// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sabaa/features/auth/signIn/domain/model/signin_response_model.dart';

class SignInState {
  final bool? isPhoneFilled;
  final SigninResponseModel? signinResponseModel;
    final bool? isVerify;
  final bool? isResend;

  SignInState({
    this.isPhoneFilled,
    this.signinResponseModel,
    this.isVerify,
    this.isResend,
  });

  SignInState copyWith({
    bool? isPhoneFilled,
    SigninResponseModel? signinResponseModel,
    bool? isVerify,
    bool? isResend,
  }) {
    return SignInState(
      isPhoneFilled: isPhoneFilled ?? this.isPhoneFilled,
      signinResponseModel: signinResponseModel ?? this.signinResponseModel,
      isVerify: isVerify ?? this.isVerify,
      isResend: isResend ?? this.isResend,
    );
  }
}
