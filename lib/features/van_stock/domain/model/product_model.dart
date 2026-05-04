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
    required String stockLevel,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}