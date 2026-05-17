import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';
@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String itemCode,
    required String productName,
    String? productImage,
    required String category,
    required double price,
    required double availableStock,
    // required String stockLevel,
    required List<UomModel> uoms,

  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
@freezed
 abstract class UomModel with _$UomModel {
  const factory UomModel({
    required String uom,
    required double price,
  }) = _UomModel;

  factory UomModel.fromJson(Map<String, dynamic> json) =>
      _$UomModelFromJson(json);
}