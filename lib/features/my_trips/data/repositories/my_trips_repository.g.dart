// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_trips_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(myTripsRepository)
final myTripsRepositoryProvider = MyTripsRepositoryProvider._();

final class MyTripsRepositoryProvider extends $FunctionalProvider<
    MyTripsRepository,
    MyTripsRepository,
    MyTripsRepository> with $Provider<MyTripsRepository> {
  MyTripsRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'myTripsRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$myTripsRepositoryHash();

  @$internal
  @override
  $ProviderElement<MyTripsRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MyTripsRepository create(Ref ref) {
    return myTripsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MyTripsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MyTripsRepository>(value),
    );
  }
}

String _$myTripsRepositoryHash() => r'bdefd6eb0012b84c73cc2aa9252aabdc423158b2';
