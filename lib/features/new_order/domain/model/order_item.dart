import '../../../van_stock/domain/model/product_model.dart';
import 'package:uuid/uuid.dart';
enum OrderMode { newOrder, returnItems }
class SelectedItemLine {
  final String lineId;       // unique id per line
  final ProductModel product;
  final int quantity;
  final String unit;
  final double? customRate;
  final bool isAllFree;
  final bool isFocEnabled;
  final String? focUom;
  final int focQuantity;

  const SelectedItemLine({
    required this.lineId,
    required this.product,
    required this.quantity,
    required this.unit,
    this.customRate,
    this.isAllFree = false,
    this.isFocEnabled = false,
    this.focUom,
    this.focQuantity = 0,
  });

  SelectedItemLine copyWith({
    int? quantity,
    String? unit,
    double? customRate,
    bool clearCustomRate = false,
    bool? isAllFree,
    bool? isFocEnabled,
    String? focUom,
    bool clearFocUom = false,
    int? focQuantity,
  }) {
    return SelectedItemLine(
      lineId: lineId,
      product: product,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      customRate: clearCustomRate ? null : (customRate ?? this.customRate),
      isAllFree: isAllFree ?? this.isAllFree,
      isFocEnabled: isFocEnabled ?? this.isFocEnabled,
      focUom: clearFocUom ? null : (focUom ?? this.focUom),
      focQuantity: focQuantity ?? this.focQuantity,
    );
  }

  /// Factory to create a fresh line for a product
  factory SelectedItemLine.create(ProductModel product) {
    final defaultUom = product.uoms.isNotEmpty
        ? product.uoms.first.uom
        : (product.defaultUom ?? 'Pcs');

    return SelectedItemLine(
      lineId: const Uuid().v4(),
      product: product,
      quantity: 1,
      unit: defaultUom,
    );
  }
}
class UomLine {
  final String uom;
  final int quantity;

  const UomLine({
    required this.uom,
    required this.quantity,
  });

  UomLine copyWith({String? uom, int? quantity}) {
    return UomLine(
      uom: uom ?? this.uom,
      quantity: quantity ?? this.quantity,
    );
  }

  // ── Serialization ──────────────────────────────────────
  Map<String, dynamic> toMap() => {
        'uom': uom,
        'qty': quantity,
      };
}

class OrderItem {
  const OrderItem({
    required this.id,
    required this.name,
    required this.sku,
    required this.price,
    required this.isReturn,
    this.imageUrl,
  });

  final String id;
  final String name;
  final String sku;
  final String price;
  final bool isReturn;
  final String? imageUrl;
}

class SelectedItem {
  final ProductModel product;
  final int quantity;
  final String unit;
  final double? customRate;
  final int freeQuantity;
  final bool isAllFree;
  // FOC Fields (replacing simple freeQuantity)
  final bool isFocEnabled;
  final String? focUom; // Can be different from main unit (e.g., Pcs vs Ctn)
  final int focQuantity;
  final List<UomLine> extraUomLines;
  const SelectedItem({
    required this.product,
    required this.quantity,
    required this.unit,
    this.customRate,
    this.isFocEnabled = false,
    this.freeQuantity = 0,
    this.isAllFree = false,
    this.focUom,
    this.focQuantity = 0,
    this.extraUomLines = const [],
  });

  SelectedItem copyWith({
    ProductModel? product,
    int? quantity,
    String? unit,
    double? customRate,
    int? freeQuantity,
    bool? isAllFree,
    bool? isFocEnabled,
    String? focUom,
    bool clearFocUom = false,
    int? focQuantity,
    bool clearCustomRate = false,
    List<UomLine>? extraUomLines, // ✅ NEW
  }) {
    return SelectedItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      customRate: clearCustomRate ? null : (customRate ?? this.customRate),
      isFocEnabled: isFocEnabled ?? this.isFocEnabled,
      focUom: clearFocUom ? null : (focUom ?? this.focUom),
      focQuantity: focQuantity ?? this.focQuantity,
      freeQuantity: freeQuantity ?? this.freeQuantity,
      isAllFree: isAllFree ?? this.isAllFree,
      extraUomLines: extraUomLines ?? this.extraUomLines, // ✅ NEW
    );
  }
}
