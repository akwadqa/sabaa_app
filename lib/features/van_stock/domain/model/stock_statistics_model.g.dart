// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockStatistics _$StockStatisticsFromJson(Map<String, dynamic> json) =>
    _StockStatistics(
      totalStockItems: (json['totalStockItems'] as num).toInt(),
      totalStockValue: (json['totalStockValue'] as num).toDouble(),
      lowStockItems: (json['lowStockItems'] as num).toInt(),
    );

Map<String, dynamic> _$StockStatisticsToJson(_StockStatistics instance) =>
    <String, dynamic>{
      'totalStockItems': instance.totalStockItems,
      'totalStockValue': instance.totalStockValue,
      'lowStockItems': instance.lowStockItems,
    };
