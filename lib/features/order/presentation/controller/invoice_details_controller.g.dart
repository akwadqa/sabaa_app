// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InvoiceDetailsController)
final invoiceDetailsControllerProvider = InvoiceDetailsControllerProvider._();

final class InvoiceDetailsControllerProvider extends $AsyncNotifierProvider<
    InvoiceDetailsController, InvoiceDetailsState> {
  InvoiceDetailsControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'invoiceDetailsControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$invoiceDetailsControllerHash();

  @$internal
  @override
  InvoiceDetailsController create() => InvoiceDetailsController();
}

String _$invoiceDetailsControllerHash() =>
    r'5e9785d30ce0a5dcc09b673db6593874aaba970d';

abstract class _$InvoiceDetailsController
    extends $AsyncNotifier<InvoiceDetailsState> {
  FutureOr<InvoiceDetailsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<InvoiceDetailsState>, InvoiceDetailsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<InvoiceDetailsState>, InvoiceDetailsState>,
        AsyncValue<InvoiceDetailsState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
