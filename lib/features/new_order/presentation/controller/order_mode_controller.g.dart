// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_mode_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrderModeController)
final orderModeControllerProvider = OrderModeControllerProvider._();

final class OrderModeControllerProvider
    extends $NotifierProvider<OrderModeController, OrderMode> {
  OrderModeControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'orderModeControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$orderModeControllerHash();

  @$internal
  @override
  OrderModeController create() => OrderModeController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrderMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrderMode>(value),
    );
  }
}

String _$orderModeControllerHash() =>
    r'e7d3d24b653d25b55ae85e32170be8869c3ed86f';

abstract class _$OrderModeController extends $Notifier<OrderMode> {
  OrderMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<OrderMode, OrderMode>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<OrderMode, OrderMode>, OrderMode, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}
