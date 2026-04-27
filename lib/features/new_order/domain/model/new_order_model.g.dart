// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewOrderModel _$NewOrderModelFromJson(Map<String, dynamic> json) =>
    _NewOrderModel(
      products: (json['products'] as List<dynamic>)
          .map((e) => OrderProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => OrderCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewOrderModelToJson(_NewOrderModel instance) =>
    <String, dynamic>{
      'products': instance.products,
      'categories': instance.categories,
    };

_OrderProductModel _$OrderProductModelFromJson(Map<String, dynamic> json) =>
    _OrderProductModel(
      itemCode: json['itemCode'] as String,
      productName: json['productName'] as String,
      productImage: json['productImage'] as String?,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      availableStock: (json['availableStock'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderProductModelToJson(_OrderProductModel instance) =>
    <String, dynamic>{
      'itemCode': instance.itemCode,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'category': instance.category,
      'price': instance.price,
      'availableStock': instance.availableStock,
    };

_OrderCategoryModel _$OrderCategoryModelFromJson(Map<String, dynamic> json) =>
    _OrderCategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$OrderCategoryModelToJson(_OrderCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
