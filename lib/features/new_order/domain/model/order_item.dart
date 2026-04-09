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