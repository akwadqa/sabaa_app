// lib/features/order/presentation/controller/invoice_details_provider.dart

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/order/data/repository/order_repository.dart';
import 'package:sabaa/features/order/presentation/widgets/invoice_review/invoice_pdf_actions_service.dart';
import 'package:sabaa/features/return_invoice/data/repositories/return_order_repository.dart';
import 'package:sabaa/features/return_invoice/domain/model/return_invoice_model.dart';

part 'invoice_details_controller.g.dart';

@riverpod
class InvoiceDetailsController extends _$InvoiceDetailsController {
  @override
  FutureOr<InvoiceDetailsState> build() {
    return InvoiceDetailsState.init();
  }

  Future<void> fetchInvoiceDetails(String invoiceId) async {
    state = const AsyncLoading();
    try {
      final response = await ref
          .read(returnOrderRepositoryProvider)
          .getInvoiceDetails(invoiceId: invoiceId,page: 1);

      state = AsyncData(InvoiceDetailsState(
        invoiceId: invoiceId,
        items: response.data?.items ?? [],
        subtotal: response.data?.outstandingAmount.toDouble()??0,
        deliveryFee: response.data?.paidAmount.toDouble() ?? 0,
        total: response.data?.grandTotal.toDouble()??0,
        customerName: response.data?.customerName ?? '',
        postingDate: response.data?.postingDate ?? '',
        status: response.data?.status ?? '',
      ));
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

// invoice_details_controller.dart

Future<String> fetchInvoiceHtml(String invoiceId) async {
  final repo = ref.read(orderRepositoryProvider);
  final html = await repo.getDocumentHtml(
    docName: invoiceId,
    docType: 'Sales Invoice',
  );

  debugPrint('✅ Fetched HTML length: ${html.length}');
  debugPrint('✅ First 200 chars: ${html.substring(0, html.length > 200 ? 200 : html.length)}');

  return html;
}
}

class InvoiceDetailsState {
  final String invoiceId;
  final List<InvoiceItemModel> items;
  final double subtotal;
  final double deliveryFee;
  final double total;
  final String customerName;
  final String postingDate;
  final String status;

  const InvoiceDetailsState({
    required this.invoiceId,
    required this.items,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.customerName,
    required this.postingDate,
    required this.status,
  });

  factory InvoiceDetailsState.init() => const InvoiceDetailsState(
        invoiceId: '',
        items: [],
        subtotal: 0,
        deliveryFee: 0,
        total: 0,
        customerName: '',
        postingDate: '',
        status: '',
      );
}

// Adjust this model to match your API response
class InvoiceDetailItem {
  final String name;
  final int quantity;
  final double price;
  final double total;
  final String unit;

  const InvoiceDetailItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.total,
    required this.unit,
  });
}


// class ReturnInvoiceState {
//   const ReturnInvoiceState({
//     this.selectedItems = const {},
//     this.subtotal = 0,
//     this.tax = 0,
//     this.totalAmount = 0,
//     this.deliveryFee = 0,
//     this.isSubmitting = false,
//     this.invoice,
//   });
 
//   final Map<String, dynamic> selectedItems; // itemCode -> quantity
//   final num subtotal;
//   final num tax;
//   final num totalAmount;
//   final num deliveryFee;
//   final bool isSubmitting;
//   final ReturnInvoiceModel? invoice;
 
//   ReturnInvoiceState copyWith({
//     Map<String, dynamic>? selectedItems,
//     num? subtotal,
//     num? tax,
//     num? totalAmount,
//     num? deliveryFee,
//     bool? isSubmitting,
//     ReturnInvoiceModel? invoice,
//   }) {
//     return ReturnInvoiceState(
//       selectedItems: selectedItems ?? this.selectedItems,
//       subtotal: subtotal ?? this.subtotal,
//       tax: tax ?? this.tax,
//       totalAmount: totalAmount ?? this.totalAmount,
//       deliveryFee: deliveryFee ?? this.deliveryFee,
//       isSubmitting: isSubmitting ?? this.isSubmitting,
//       invoice: invoice ?? this.invoice,
//     );
//   }
// }
 