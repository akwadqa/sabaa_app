// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_trips_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MyTripsController)
final myTripsControllerProvider = MyTripsControllerProvider._();

final class MyTripsControllerProvider
    extends $AsyncNotifierProvider<MyTripsController, MyTripsState> {
  MyTripsControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'myTripsControllerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$myTripsControllerHash();

  @$internal
  @override
  MyTripsController create() => MyTripsController();
}

String _$myTripsControllerHash() => r'7c85b1cd2ee109c32bec2ecd92d88416e3409cff';

abstract class _$MyTripsController extends $AsyncNotifier<MyTripsState> {
  FutureOr<MyTripsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<MyTripsState>, MyTripsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<MyTripsState>, MyTripsState>,
        AsyncValue<MyTripsState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
