// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeController)
final homeControllerProvider = HomeControllerProvider._();

final class HomeControllerProvider
    extends $AsyncNotifierProvider<HomeController, HomeState> {
  HomeControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'homeControllerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$homeControllerHash();

  @$internal
  @override
  HomeController create() => HomeController();
}

String _$homeControllerHash() => r'40270a97d229fd775b44834e36622fa723d79a76';

abstract class _$HomeController extends $AsyncNotifier<HomeState> {
  FutureOr<HomeState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<HomeState>, HomeState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<HomeState>, HomeState>,
        AsyncValue<HomeState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
