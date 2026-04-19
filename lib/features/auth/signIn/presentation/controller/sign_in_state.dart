import 'package:sabaa/features/auth/signIn/domain/model/signin_response_model.dart';

class SignInState {
  final String email;
  final String password;
  final bool isFormValid;
  final SigninResponseModel? signinResponseModel;

  SignInState({
    this.email = '',
    this.password = '',
    this.isFormValid = false,
    this.signinResponseModel,
  });

  SignInState copyWith({
    String? email,
    String? password,
    bool? isFormValid,
    SigninResponseModel? signinResponseModel,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isFormValid: isFormValid ?? this.isFormValid,
      signinResponseModel: signinResponseModel ?? this.signinResponseModel,
    );
  }
}