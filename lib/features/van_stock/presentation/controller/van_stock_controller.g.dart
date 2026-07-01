// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'van_stock_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VanStockController)
final vanStockControllerProvider = VanStockControllerProvider._();

final class VanStockControllerProvider
    extends $AsyncNotifierProvider<VanStockController, VanStockState> {
  VanStockControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'vanStockControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$vanStockControllerHash();

  @$internal
  @override
  VanStockController create() => VanStockController();
}

String _$vanStockControllerHash() =>
    r'59575fc6818fb8fd7e1e86aee1d89234c11080f6';

abstract class _$VanStockController extends $AsyncNotifier<VanStockState> {
  FutureOr<VanStockState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<VanStockState>, VanStockState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<VanStockState>, VanStockState>,
        AsyncValue<VanStockState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
