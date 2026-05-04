import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sabaa/features/return_invoice/domain/model/return_invoice_model.dart';
import 'package:sabaa/features/van_stock/domain/model/product_model.dart';

part 'selected_item_model.freezed.dart';
part 'selected_item_model.g.dart';

@freezed
abstract class SelectedItem with _$SelectedItem {
  const factory SelectedItem({
    required InvoiceItemModel product,
    required int quantity,
    required String unit,
  }) = _SelectedItem;

  factory SelectedItem.fromJson(Map<String, dynamic> json) =>
      _$SelectedItemFromJson(json);
}