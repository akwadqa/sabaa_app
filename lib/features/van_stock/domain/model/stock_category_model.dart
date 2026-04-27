import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_category_model.freezed.dart';
part 'stock_category_model.g.dart';

@freezed
abstract class StockCategoryModel with _$StockCategoryModel {
  const factory StockCategoryModel({
    required String id,
    required String name,
  }) = _StockCategoryModel;

  factory StockCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$StockCategoryModelFromJson(json);
}