class StockSummary {
  const StockSummary({
    required this.totalSkuKey,
    required this.totalSkuValue,
    required this.lowStockKey,
    required this.lowStockValue,
    required this.valueKey,
    required this.valueAmount,
  });
  const StockSummary.empty()
      : totalSkuKey   = 'total_sku',
        totalSkuValue = '0',
        lowStockKey   = 'low_stock',
        lowStockValue = '0',
        valueKey      = 'stock_value',
        valueAmount   = '0';

  final String totalSkuKey;    // translation key
  final String totalSkuValue;  // "145"
  final String lowStockKey;    // translation key
  final String lowStockValue;  // "3"
  final String valueKey;       // translation key
  final String valueAmount;    // "$2.4k"
}