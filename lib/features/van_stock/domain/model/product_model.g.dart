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
      uoms: (json['uoms'] as List<dynamic>)
          .map((e) => UomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'uoms': instance.uoms,
    };

_UomModel _$UomModelFromJson(Map<String, dynamic> json) => _UomModel(
      uom: json['uom'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$UomModelToJson(_UomModel instance) => <String, dynamic>{
      'uom': instance.uom,
      'price': instance.price,
    };
