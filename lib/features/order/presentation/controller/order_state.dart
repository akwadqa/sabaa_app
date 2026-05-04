import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/order/domain/create_payment/create_payment_response.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';

import '../../domain/order_summary/payment_response_model.dart';

class OrderState {
  final String ordersTypeFilter;
  final AsyncValue<OrderSummaryModel>? orderSummary;
  final bool isPaying;
  final PaymentResponseModel? paymentData;

  OrderState({
    required this.ordersTypeFilter,
    required this.orderSummary,
    required this.isPaying, this.paymentData,
  });

  factory OrderState.init() {
    return OrderState(
      
      ordersTypeFilter: 'all',
      orderSummary: AsyncLoading(),
      isPaying: false,
      paymentData: null,
    );
  }
  OrderState copyWith({
    String? ordersTypeFilter,
    String? paymentMethod,
    AsyncValue<OrderSummaryModel>? orderSummary,
    bool? isPaying,
    PaymentResponseModel? paymentData,
  }) {
    return OrderState(
      ordersTypeFilter: ordersTypeFilter ?? this.ordersTypeFilter,
      orderSummary: orderSummary ?? this.orderSummary,
      isPaying: isPaying ?? this.isPaying,
      paymentData: paymentData ?? this.paymentData,
    );
  }
}
