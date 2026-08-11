import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/order/domain/create_payment/create_payment_response.dart';
import 'package:sabaa/features/order/domain/create_payment/credit_note_reconcile_response.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/domain/upload_capture/upload_capture_response.dart';

import '../../domain/order_summary/payment_response_model.dart';

class OrderState {
  final String ordersTypeFilter;
  final AsyncValue<OrderSummaryModel>? orderSummary;
  final AsyncValue<UploadCaptureResponse>? uploadCaptureResponse;
  final bool isPaying;
  final PaymentResponseModel? paymentData;
  final bool filterLoading;
  final List<String>? images;
  final String selectedAction;
  final String? summaryAction;
  final CreditNoteReconcileResponse? creditNoteResult;
  OrderState({
    this.uploadCaptureResponse,
    required this.ordersTypeFilter,
    required this.orderSummary,
    required this.isPaying,
    this.paymentData,
    required this.filterLoading,
    this.images,
    this.selectedAction = 'invoice',
    this.summaryAction,
    this.creditNoteResult,
  });

  factory OrderState.init() {
    return OrderState(
      ordersTypeFilter: 'all',
      orderSummary: AsyncLoading(),
      isPaying: false,
      paymentData: null,
      images: [],
      filterLoading: false,
      selectedAction: 'invoice',
    );
  }
  // const _noValue = Object();

  OrderState copyWith({
    String? ordersTypeFilter,
    String? paymentMethod,
    AsyncValue<OrderSummaryModel>? orderSummary,
    AsyncValue<UploadCaptureResponse>? uploadCaptureResponse,
    bool? isPaying,
    PaymentResponseModel? paymentData,
    bool? filterLoading,
    List<String>? images,
    String? selectedAction,
    String? summaryAction,
    CreditNoteReconcileResponse? creditNoteResult,
  }) {
    return OrderState(
      ordersTypeFilter: ordersTypeFilter ?? this.ordersTypeFilter,
      orderSummary: orderSummary ?? this.orderSummary,
      uploadCaptureResponse:
          uploadCaptureResponse ?? this.uploadCaptureResponse,
      isPaying: isPaying ?? this.isPaying,
      paymentData: paymentData ?? this.paymentData,
      filterLoading: filterLoading ?? this.filterLoading,
      images: images ?? this.images,
      selectedAction: selectedAction ?? this.selectedAction,
      summaryAction: summaryAction ?? this.summaryAction,
      creditNoteResult: creditNoteResult ?? this.creditNoteResult,
    );
  }
}
