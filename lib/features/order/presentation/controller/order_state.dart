import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';

class OrderState {
  final String ordersTypeFilter;
  final AsyncValue<OrderSummaryModel>? orderSummary;

  OrderState({
    required this.ordersTypeFilter,
    required this.orderSummary,
  });

  factory OrderState.init() {
    return OrderState(
      ordersTypeFilter: 'all',
      orderSummary: AsyncLoading(),
    );
  }
  OrderState copyWith({
    String? ordersTypeFilter,
    AsyncValue<OrderSummaryModel>? orderSummary,
  }) {
    return OrderState(
      ordersTypeFilter: ordersTypeFilter ?? this.ordersTypeFilter,
      orderSummary: orderSummary ?? this.orderSummary,
    );
  }
}
