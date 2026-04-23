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
    extends $AsyncNotifierProvider<VanStockController, VanStockModel> {
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
    r'9a8b5a001bb68bafdbf285d1ed37fdad46a5d58d';

abstract class _$VanStockController extends $AsyncNotifier<VanStockModel> {
  FutureOr<VanStockModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<VanStockModel>, VanStockModel>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<VanStockModel>, VanStockModel>,
        AsyncValue<VanStockModel>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
