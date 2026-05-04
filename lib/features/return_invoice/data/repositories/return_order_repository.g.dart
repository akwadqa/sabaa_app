// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_order_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(returnOrderRepository)
final returnOrderRepositoryProvider = ReturnOrderRepositoryProvider._();

final class ReturnOrderRepositoryProvider extends $FunctionalProvider<
    ReturnOrderRepository,
    ReturnOrderRepository,
    ReturnOrderRepository> with $Provider<ReturnOrderRepository> {
  ReturnOrderRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'returnOrderRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$returnOrderRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReturnOrderRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReturnOrderRepository create(Ref ref) {
    return returnOrderRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReturnOrderRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReturnOrderRepository>(value),
    );
  }
}

String _$returnOrderRepositoryHash() =>
    r'59294c071bf9c326b05e3a3ca1137b9df8ec889e';
