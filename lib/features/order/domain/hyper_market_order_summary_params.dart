class HyperMarketOrderSummaryParams {
  final String? item;
  final String customer;
  final String? from_date;
  final String? to_date;

  HyperMarketOrderSummaryParams(
      { this.item,
      required this.customer,
       this.from_date,
       this.to_date});


      
}
