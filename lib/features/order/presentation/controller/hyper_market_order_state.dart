import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/order/domain/hyper_market_order_summary/hyper_market_order_summary_model.dart';

class HyperMarketOrderState {
  final String? productName;
  final DateTime? filterFromDate;
  final DateTime? filterToDate;
  final AsyncValue<HyperMarketOrdersSummaryResponse>
      hyperMarketOrdersSummaryResponse;

  HyperMarketOrderState({
    this.productName,
    this.filterFromDate,
    this.filterToDate,
    required this.hyperMarketOrdersSummaryResponse,
  });
  factory HyperMarketOrderState.initial() {
    return HyperMarketOrderState(
      productName: null,
      filterFromDate: null,
      filterToDate: null,
      hyperMarketOrdersSummaryResponse: AsyncLoading(),
    );
  }

  HyperMarketOrderState copyWith({
    String? productName,
    DateTime? filterFromDate,
    DateTime? filterToDate,
    AsyncValue<HyperMarketOrdersSummaryResponse>?
        hyperMarketOrdersSummaryResponse,
  }) {
    return HyperMarketOrderState(
      productName: productName ?? this.productName,
      filterFromDate: filterFromDate ?? this.filterFromDate,
      filterToDate: filterToDate ?? this.filterToDate,
      hyperMarketOrdersSummaryResponse: hyperMarketOrdersSummaryResponse ??
          this.hyperMarketOrdersSummaryResponse,
    );
  }
}
