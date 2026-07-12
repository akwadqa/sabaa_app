// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrderController)
final orderControllerProvider = OrderControllerProvider._();

final class OrderControllerProvider
    extends $AsyncNotifierProvider<OrderController, OrderState> {
  OrderControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'orderControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$orderControllerHash();

  @$internal
  @override
  OrderController create() => OrderController();
}

String _$orderControllerHash() => r'f53f368c65edba9f6b731ed7746d6f485f01e0f4';

abstract class _$OrderController extends $AsyncNotifier<OrderState> {
  FutureOr<OrderState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<OrderState>, OrderState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<OrderState>, OrderState>,
        AsyncValue<OrderState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
