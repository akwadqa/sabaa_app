// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'van_stock_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(vanStockRepository)
final vanStockRepositoryProvider = VanStockRepositoryProvider._();

final class VanStockRepositoryProvider extends $FunctionalProvider<
    VanStockRepository,
    VanStockRepository,
    VanStockRepository> with $Provider<VanStockRepository> {
  VanStockRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'vanStockRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$vanStockRepositoryHash();

  @$internal
  @override
  $ProviderElement<VanStockRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  VanStockRepository create(Ref ref) {
    return vanStockRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VanStockRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VanStockRepository>(value),
    );
  }
}

String _$vanStockRepositoryHash() =>
    r'da402c9b7e098a666d9cc3b3b470cf71da496824';
