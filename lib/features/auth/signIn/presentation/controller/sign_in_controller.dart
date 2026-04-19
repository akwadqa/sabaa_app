import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/src/application/data/user_information/user_information.dart';
import 'package:sabaa/src/infrastructure/storage/local_storage_service.dart';

import '../../data/repositories/sign_in_repository.dart';
import 'sign_in_state.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  FutureOr<SignInState> build() => SignInState();

  Future<void> signIn(String userName , String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(signInRepositoryProvider);
      final response = await repo.signIn(userName,password);
         final info = UserInformation(userId: response.data!.user.userId, fullName: response.data!.user.fullName, role: response.data!.user.role, email: response.data!.user.email, warehouse: response.data!.user.warehouse);

      await ref
          .read(localStorageServiceProvider)
          .saveToken(response.data!.token);
      await ref.read(localStorageServiceProvider).saveUserInfo(info);
      return state.value!.copyWith(signinResponseModel: response.data);
    });
  }
  void updateForm(String email, String password) {
  final isValid = email.isNotEmpty && password.isNotEmpty;

  state = AsyncData(
    state.value!.copyWith(isFormValid: isValid),
  );
}
void updateEmail(String email) {
  final current = state.value!;
  final isValid = email.isNotEmpty && current.password.isNotEmpty;

  state = AsyncData(
    current.copyWith(
      email: email,
      isFormValid: isValid,
    ),
  );
}

void updatePassword(String password) {
  final current = state.value!;
  final isValid = current.email.isNotEmpty && password.isNotEmpty;

  state = AsyncData(
    current.copyWith(
      password: password,
      isFormValid: isValid,
    ),
  );
}

  // void changePhoneNumber(String value) {
  //   phoneController.setText(value);
  //   ref.invalidateSelf();
  //   // state=Async(value);
  //   // Dev.logLine("value= $value");
  //   // Dev.logLine(" phoneController.text= ${phoneController.text}");
  // }
}
