import '../../../van_stock/domain/model/product_model.dart';

enum OrderMode { newOrder, returnItems }
class OrderItem {
  const OrderItem({
    required this.id,
    required this.name,
    required this.sku,
    required this.price,      // e.g. "48 QAR / Box"
    required this.isReturn,   // true → orange accent, negative price
    this.imageUrl,
  });

  final String  id;
  final String  name;
  final String  sku;
  final String  price;
  final bool    isReturn;
  final String? imageUrl;
}
class SelectedItem {
  final ProductModel product;
  final int quantity;
  final String unit;
  final double? customRate;  // ✅ NEW — null = use default price

  const SelectedItem({
    required this.product,
    required this.quantity,
    required this.unit,
    this.customRate,  // ✅ NEW
  });

 SelectedItem copyWith({
    ProductModel? product,
    int? quantity,
    String? unit,
    double? customRate,
    bool clearCustomRate = false,  // ✅ allow null reset
  }) {
    return SelectedItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      customRate: clearCustomRate ? null : (customRate ?? this.customRate),
    );
  }
}