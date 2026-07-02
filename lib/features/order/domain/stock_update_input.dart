import 'package:easy_localization/easy_localization.dart';

class StockUpdateInput {
  String? selectedUnit;
  String item_code;
  String? expiryDate;
  int currentStock;

  StockUpdateInput({
    required this.item_code,
    this.selectedUnit,
    this.expiryDate,
    this.currentStock = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      "item_code": item_code,
      'uom': selectedUnit,
      'expiryDate': expiryDate,
      'qty': currentStock,
    };
  }
}
