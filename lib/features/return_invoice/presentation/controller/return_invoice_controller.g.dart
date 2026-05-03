// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_invoice_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InvoiceController)
final invoiceControllerProvider = InvoiceControllerProvider._();

final class InvoiceControllerProvider
    extends $AsyncNotifierProvider<InvoiceController, ReturnInvoiceState> {
  InvoiceControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'invoiceControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$invoiceControllerHash();

  @$internal
  @override
  InvoiceController create() => InvoiceController();
}

String _$invoiceControllerHash() => r'3e1feb7099b8bea36793960bfc80f1a359a433b3';

abstract class _$InvoiceController extends $AsyncNotifier<ReturnInvoiceState> {
  FutureOr<ReturnInvoiceState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ReturnInvoiceState>, ReturnInvoiceState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<ReturnInvoiceState>, ReturnInvoiceState>,
        AsyncValue<ReturnInvoiceState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
