// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(newOrderRepository)
final newOrderRepositoryProvider = NewOrderRepositoryProvider._();

final class NewOrderRepositoryProvider extends $FunctionalProvider<
    NewOrderRepository,
    NewOrderRepository,
    NewOrderRepository> with $Provider<NewOrderRepository> {
  NewOrderRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'newOrderRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$newOrderRepositoryHash();

  @$internal
  @override
  $ProviderElement<NewOrderRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NewOrderRepository create(Ref ref) {
    return newOrderRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NewOrderRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NewOrderRepository>(value),
    );
  }
}

String _$newOrderRepositoryHash() =>
    r'63c9b9dd15ebb511849b3f46168157fd61129bca';
