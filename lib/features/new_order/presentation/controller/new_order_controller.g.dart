// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NewOrderController)
final newOrderControllerProvider = NewOrderControllerProvider._();

final class NewOrderControllerProvider
    extends $AsyncNotifierProvider<NewOrderController, NewOrderState> {
  NewOrderControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'newOrderControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$newOrderControllerHash();

  @$internal
  @override
  NewOrderController create() => NewOrderController();
}

String _$newOrderControllerHash() =>
    r'c5734385fcf2061f9e66ed843583576518139fc7';

abstract class _$NewOrderController extends $AsyncNotifier<NewOrderState> {
  FutureOr<NewOrderState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<NewOrderState>, NewOrderState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<NewOrderState>, NewOrderState>,
        AsyncValue<NewOrderState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
