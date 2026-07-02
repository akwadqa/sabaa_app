// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CustomersController)
final customersControllerProvider = CustomersControllerProvider._();

final class CustomersControllerProvider
    extends $AsyncNotifierProvider<CustomersController, CustomerState> {
  CustomersControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'customersControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$customersControllerHash();

  @$internal
  @override
  CustomersController create() => CustomersController();
}

String _$customersControllerHash() =>
    r'dd87345348ecb5739b4028ce1c21c84c2d2d82f6';

abstract class _$CustomersController extends $AsyncNotifier<CustomerState> {
  FutureOr<CustomerState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CustomerState>, CustomerState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<CustomerState>, CustomerState>,
        AsyncValue<CustomerState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
