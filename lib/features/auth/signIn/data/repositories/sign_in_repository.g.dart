// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(signInRepository)
final signInRepositoryProvider = SignInRepositoryProvider._();

final class SignInRepositoryProvider extends $FunctionalProvider<
    SignInRepository,
    SignInRepository,
    SignInRepository> with $Provider<SignInRepository> {
  SignInRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'signInRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$signInRepositoryHash();

  @$internal
  @override
  $ProviderElement<SignInRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SignInRepository create(Ref ref) {
    return signInRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignInRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignInRepository>(value),
    );
  }
}

String _$signInRepositoryHash() => r'07b4e1448e771c67db66dfc336de73e03ee8d175';
