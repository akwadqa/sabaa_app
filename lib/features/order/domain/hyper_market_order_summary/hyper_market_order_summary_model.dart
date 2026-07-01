import 'package:freezed_annotation/freezed_annotation.dart';

part 'hyper_market_order_summary_model.freezed.dart';
part 'hyper_market_order_summary_model.g.dart';

@freezed
abstract class HyperMarketOrdersSummaryResponse with _$HyperMarketOrdersSummaryResponse {
  const factory HyperMarketOrdersSummaryResponse({
    required String customer,
    required String fromDate,
    required String toDate,
    required int totalStock,
    required int netSales,
    required List<HyperMarketStockItemModel> items,
  }) = _HyperMarketOrdersSummaryResponse;

  factory HyperMarketOrdersSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$HyperMarketOrdersSummaryResponseFromJson(json);
}

@freezed
abstract class HyperMarketStockItemModel with _$HyperMarketStockItemModel {
  const factory HyperMarketStockItemModel({
    required String itemCode,
    required String itemName,
    required String itemImage,
    required String totalQty,
    required List<String> availableUoms,
  }) = _HyperMarketStockItemModel;

  factory HyperMarketStockItemModel.fromJson(Map<String, dynamic> json) =>
      _$HyperMarketStockItemModelFromJson(json);
}