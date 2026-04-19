// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SignInController)
final signInControllerProvider = SignInControllerProvider._();

final class SignInControllerProvider
    extends $AsyncNotifierProvider<SignInController, SignInState> {
  SignInControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'signInControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$signInControllerHash();

  @$internal
  @override
  SignInController create() => SignInController();
}

String _$signInControllerHash() => r'6a42dc45622af40201d2ae265c0b2ac2ac7eac5b';

abstract class _$SignInController extends $AsyncNotifier<SignInState> {
  FutureOr<SignInState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<SignInState>, SignInState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<SignInState>, SignInState>,
        AsyncValue<SignInState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
