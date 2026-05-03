import '../../../van_stock/domain/model/product_model.dart';

enum OrderMode { newSale, returnItems }
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

  const SelectedItem({
    required this.product,
    required this.quantity,
    required this.unit,
  });

  SelectedItem copyWith({
    ProductModel? product,
    int? quantity,
    String? unit,
  }) {
    return SelectedItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
    );
  }
}