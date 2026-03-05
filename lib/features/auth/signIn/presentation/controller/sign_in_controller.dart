import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/sign_in_repository.dart';
import 'sign_in_state.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  FutureOr<SignInState> build() => SignInState();

  Future<void> signIn(String phone) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(signInRepositoryProvider);
      final response = await repo.signIn(phone);
      return state.value!.copyWith(signinResponseModel: response.data);
    });
  }
  
  void makeResendButtonVisible(bool isVisible) {
    state = AsyncData(state.value!.copyWith(isResend: isVisible));
  }

  void makeConfirmButtonVisible(bool isVisible) {
    state = AsyncData(state.value!.copyWith(isVerify: isVisible));
  }

  void checkPhoneFilled(bool isFilled) {
    state = AsyncData(state.value!.copyWith(isPhoneFilled: isFilled));
  }

  // void changePhoneNumber(String value) {
  //   phoneController.setText(value);
  //   ref.invalidateSelf();
  //   // state=Async(value);
  //   // Dev.logLine("value= $value");
  //   // Dev.logLine(" phoneController.text= ${phoneController.text}");
  // }
}
