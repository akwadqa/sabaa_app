import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_statistics_model.freezed.dart';
part 'stock_statistics_model.g.dart';

@freezed
abstract class StockStatistics with _$StockStatistics {
  const factory StockStatistics({
    required int totalStockItems,
    required double totalStockValue,
    required int lowStockItems,
  }) = _StockStatistics;

  factory StockStatistics.fromJson(Map<String, dynamic> json) =>
      _$StockStatisticsFromJson(json);
}