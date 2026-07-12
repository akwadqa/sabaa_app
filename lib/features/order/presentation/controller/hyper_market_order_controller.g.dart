// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyper_market_order_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HyperMarketOrderController)
final hyperMarketOrderControllerProvider =
    HyperMarketOrderControllerProvider._();

final class HyperMarketOrderControllerProvider extends $AsyncNotifierProvider<
    HyperMarketOrderController, HyperMarketOrderState> {
  HyperMarketOrderControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'hyperMarketOrderControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$hyperMarketOrderControllerHash();

  @$internal
  @override
  HyperMarketOrderController create() => HyperMarketOrderController();
}

String _$hyperMarketOrderControllerHash() =>
    r'6092dcd717b1a464d6bedbeea4b772f6c75cec4d';

abstract class _$HyperMarketOrderController
    extends $AsyncNotifier<HyperMarketOrderState> {
  FutureOr<HyperMarketOrderState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref
        as $Ref<AsyncValue<HyperMarketOrderState>, HyperMarketOrderState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<HyperMarketOrderState>, HyperMarketOrderState>,
        AsyncValue<HyperMarketOrderState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
