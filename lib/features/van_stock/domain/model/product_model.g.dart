// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      itemCode: json['itemCode'] as String,
      productName: json['productName'] as String,
      productImage: json['productImage'] as String?,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      availableStock: (json['availableStock'] as num).toDouble(),
      stockLevel: json['stockLevel'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'itemCode': instance.itemCode,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'category': instance.category,
      'price': instance.price,
      'availableStock': instance.availableStock,
      'stockLevel': instance.stockLevel,
    };
