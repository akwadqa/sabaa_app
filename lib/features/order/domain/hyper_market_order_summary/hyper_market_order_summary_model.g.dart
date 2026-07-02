// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hyper_market_order_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HyperMarketOrdersSummaryResponse _$HyperMarketOrdersSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    _HyperMarketOrdersSummaryResponse(
      customer: json['customer'] as String,
      fromDate: json['fromDate'] as String,
      toDate: json['toDate'] as String,
      totalStock: (json['totalStock'] as num).toInt(),
      netSales: (json['netSales'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              HyperMarketStockItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HyperMarketOrdersSummaryResponseToJson(
        _HyperMarketOrdersSummaryResponse instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'totalStock': instance.totalStock,
      'netSales': instance.netSales,
      'items': instance.items,
    };

_HyperMarketStockItemModel _$HyperMarketStockItemModelFromJson(
        Map<String, dynamic> json) =>
    _HyperMarketStockItemModel(
      itemCode: json['itemCode'] as String,
      itemName: json['itemName'] as String,
      itemImage: json['itemImage'] as String?,
      totalQty: json['totalQty'] as String,
      availableUoms: (json['availableUoms'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$HyperMarketStockItemModelToJson(
        _HyperMarketStockItemModel instance) =>
    <String, dynamic>{
      'itemCode': instance.itemCode,
      'itemName': instance.itemName,
      'itemImage': instance.itemImage,
      'totalQty': instance.totalQty,
      'availableUoms': instance.availableUoms,
    };
