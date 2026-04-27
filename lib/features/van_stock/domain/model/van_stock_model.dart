import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_model.dart';
import 'stock_category_model.dart';
import 'stock_statistics_model.dart';

part 'van_stock_model.freezed.dart';
part 'van_stock_model.g.dart';

@freezed
abstract class VanStockModel with _$VanStockModel {
  const factory VanStockModel({
    required String? warehouse,
    required StockStatistics statistics,
    required List<ProductModel> products,
    required List<StockCategoryModel> categories,
  }) = _VanStockModel;

  factory VanStockModel.fromJson(Map<String, dynamic> json) =>
      _$VanStockModelFromJson(json);
}