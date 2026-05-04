import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_order_model.freezed.dart';
part 'new_order_model.g.dart';

@freezed
abstract class NewOrderModel with _$NewOrderModel {
  const factory NewOrderModel({
    required List<OrderProductModel> products,
    required List<OrderCategoryModel> categories,
  }) = _NewOrderModel;

  factory NewOrderModel.fromJson(Map<String, dynamic> json) =>
      _$NewOrderModelFromJson(json);
}

@freezed
abstract class OrderProductModel with _$OrderProductModel {
  const factory OrderProductModel({
    required String itemCode,
    required String productName,
    String? productImage,
    required String category,
    required double price,
    required double availableStock,
  }) = _OrderProductModel;

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$OrderProductModelFromJson(json);
}

@freezed
abstract class OrderCategoryModel with _$OrderCategoryModel {
  const factory OrderCategoryModel({
    required String id,
    required String name,
  }) = _OrderCategoryModel;

  factory OrderCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderCategoryModelFromJson(json);
}