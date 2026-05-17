
// enum StockLevel { high, medium, low }

class StockItem {
  const StockItem({
    required this.name,
    required this.sku,
    required this.stockLabel,
    // required this.stockLevel,
    required this.price,
    required this.imageUrl,
  });

  final String     name;
  final String     sku;
  final String     stockLabel;   // e.g. "45 cases"
  // final String stockLevel;
  final double     price;        // e.g. "$12.50"
  final String     imageUrl;
}