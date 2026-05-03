
import 'package:sabaa/features/return_invoice/domain/model/return_invoice_model.dart';

class ReturnInvoiceState {
  const ReturnInvoiceState({
    this.selectedItems = const {},
    this.subtotal = 0,
    this.tax = 0,
    this.totalAmount = 0,
    this.deliveryFee = 0,
    this.isSubmitting = false,
    this.invoice,
  });
 
  final Map<String, dynamic> selectedItems; // itemCode -> quantity
  final num subtotal;
  final num tax;
  final num totalAmount;
  final num deliveryFee;
  final bool isSubmitting;
  final ReturnInvoiceModel? invoice;
 
  ReturnInvoiceState copyWith({
    Map<String, dynamic>? selectedItems,
    num? subtotal,
    num? tax,
    num? totalAmount,
    num? deliveryFee,
    bool? isSubmitting,
    ReturnInvoiceModel? invoice,
  }) {
    return ReturnInvoiceState(
      selectedItems: selectedItems ?? this.selectedItems,
      subtotal: subtotal ?? this.subtotal,
      tax: tax ?? this.tax,
      totalAmount: totalAmount ?? this.totalAmount,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      invoice: invoice ?? this.invoice,
    );
  }
}
 