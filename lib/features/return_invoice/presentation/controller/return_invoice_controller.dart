import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/new_order/data/repositories/new_order_repository.dart';
import 'package:sabaa/features/return_invoice/domain/model/return_invoice_model.dart';
import 'package:sabaa/src/core/shared_widgets/app_toast.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';

import 'return_invoice_state.dart';
 
part 'return_invoice_controller.g.dart';

@riverpod
class InvoiceController extends _$InvoiceController {
  @override
  FutureOr<ReturnInvoiceState> build() async {
    return const ReturnInvoiceState();
  }
 
  void updateItemQuantity(String itemCode, int newQuantity) {
    final current = state.value!;
    final map = Map<String, dynamic>.from(current.selectedItems);
 
    if (newQuantity <= 0) {
      map.remove(itemCode);
    } else {
      map[itemCode] = newQuantity;
    }
 
    _updateCalculations(map);
  }
 
  void removeItem(String itemCode) {
    final current = state.value!;
    final map = Map<String, dynamic>.from(current.selectedItems);
    map.remove(itemCode);
 
    _updateCalculations(map);
  }
 
  void updateDeliveryFee(num fee) {
    final current = state.value!;
    final newTotal = current.subtotal + current.tax + fee;
 
    state = AsyncData(
      current.copyWith(
        deliveryFee: fee,
        totalAmount: newTotal,
      ),
    );
  }
 
  void _updateCalculations(Map<String, dynamic> items) {
    final current = state.value!;
 
    // Calculate subtotal (you may need to fetch actual prices)
    final subtotal = current.subtotal;
    final tax = subtotal * 0.15; // 15% tax
    final total = subtotal + tax + current.deliveryFee;
 
    state = AsyncData(
      current.copyWith(
        selectedItems: items,
        subtotal: subtotal,
        tax: tax,
        totalAmount: total,
      ),
    );
  }
 
  Future<bool> submitInvoice() async {
    final current = state.value!;
    state = AsyncData(current.copyWith(isSubmitting: true));
 
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
 
      // In real scenario, call repository to submit
      final invoice = ReturnInvoiceModel(
        invoiceId: 'ACC-SINV-2026-00132',
        customer: 'customer123',
        customerName: 'Customer Name',
        status: 'Unpaid',
        postingDate: DateTime.now().toString(),
        grandTotal: current.totalAmount,
        totalTaxesAndCharges: current.tax,
        outstandingAmount: current.totalAmount,
        paidAmount: 0,
        isReturn: false,
        items: [],
      );
 
      state = AsyncData(
        current.copyWith(
          isSubmitting: false,
          invoice: invoice,
        ),
      );
 
      AppToast.successToast('Invoice created successfully');
      return true;
    } catch (e) {
      state = AsyncData(current.copyWith(isSubmitting: false));
      AppToast.errorToast('Failed to create invoice');
      Dev.logError('Invoice submission error: $e');
      return false;
    }
  }
}
