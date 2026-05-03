// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_order_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReturnOrderController)
final returnOrderControllerProvider = ReturnOrderControllerProvider._();

final class ReturnOrderControllerProvider
    extends $AsyncNotifierProvider<ReturnOrderController, ReturnOrderState> {
  ReturnOrderControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'returnOrderControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$returnOrderControllerHash();

  @$internal
  @override
  ReturnOrderController create() => ReturnOrderController();
}

String _$returnOrderControllerHash() =>
    r'd586c090dc321e365b8f7f8cd105399b93143c4b';

abstract class _$ReturnOrderController
    extends $AsyncNotifier<ReturnOrderState> {
  FutureOr<ReturnOrderState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ReturnOrderState>, ReturnOrderState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<ReturnOrderState>, ReturnOrderState>,
        AsyncValue<ReturnOrderState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
