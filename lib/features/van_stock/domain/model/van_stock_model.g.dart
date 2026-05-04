// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'van_stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VanStockModel _$VanStockModelFromJson(Map<String, dynamic> json) =>
    _VanStockModel(
      warehouse: json['warehouse'] as String?,
      statistics:
          StockStatistics.fromJson(json['statistics'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => StockCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VanStockModelToJson(_VanStockModel instance) =>
    <String, dynamic>{
      'warehouse': instance.warehouse,
      'statistics': instance.statistics,
      'products': instance.products,
      'categories': instance.categories,
    };
