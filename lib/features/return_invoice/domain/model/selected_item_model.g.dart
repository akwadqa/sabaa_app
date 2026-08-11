// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SelectedItem _$SelectedItemFromJson(Map<String, dynamic> json) =>
    _SelectedItem(
      product:
          InvoiceItemModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      unit: json['unit'] as String,
      customRate: (json['customRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SelectedItemToJson(_SelectedItem instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'customRate': instance.customRate,
    };
