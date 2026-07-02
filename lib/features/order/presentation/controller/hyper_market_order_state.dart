import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/order/domain/hyper_market_order_summary/hyper_market_order_summary_model.dart';
import 'package:sabaa/features/order/domain/stock_update_input.dart';

class HyperMarketOrderState {
  final String? productName;
  final DateTime? filterFromDate;
  final DateTime? filterToDate;
  final List<StockUpdateInput> stockUpdateInputs;
  final AsyncValue<void>? updateStock;
  final AsyncValue<HyperMarketOrdersSummaryResponse>
      hyperMarketOrdersSummaryResponse;

  HyperMarketOrderState({
    this.productName,
    this.filterFromDate,
    required this.stockUpdateInputs,
    this.filterToDate,
    required this.hyperMarketOrdersSummaryResponse,  this.updateStock,
  });
  factory HyperMarketOrderState.initial() {
    return HyperMarketOrderState(
      productName: null,
      updateStock: null,
      stockUpdateInputs: [],
      filterFromDate: null,
      filterToDate: null,
      hyperMarketOrdersSummaryResponse: AsyncLoading(),
    );
  }

  HyperMarketOrderState copyWith({
    String? productName,
    DateTime? filterFromDate,
    DateTime? filterToDate,
    List<StockUpdateInput>? stockUpdateInputs,
    AsyncValue<HyperMarketOrdersSummaryResponse>?
        hyperMarketOrdersSummaryResponse,
    AsyncValue<void>? updateStock,
  }) {
    return HyperMarketOrderState(
      productName: productName ?? this.productName,
      stockUpdateInputs: stockUpdateInputs ?? this.stockUpdateInputs,
      filterFromDate: filterFromDate ?? this.filterFromDate,
      filterToDate: filterToDate ?? this.filterToDate,
      hyperMarketOrdersSummaryResponse: hyperMarketOrdersSummaryResponse ??
          this.hyperMarketOrdersSummaryResponse,
      updateStock: updateStock ?? this.updateStock,
    );
  }
}
