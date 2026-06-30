// new_order_datasource.dart


// ✅ Add response model
class ReturnOrderResponse {
  final String returnId;
  final String customer;
  final String customerName;
  final String status;
  final String postingDate;
  final String? returnAgainst;
  final double grandTotal;
  final double total;
  final num totalQty;
  final String? remarks;
  final List<ReturnOrderItem> items;

  const ReturnOrderResponse({
    required this.returnId,
    required this.customer,
    required this.customerName,
    required this.status,
    required this.postingDate,
    required this.grandTotal,
    required this.total,
    required this.totalQty,
    required this.returnAgainst,
    required this.remarks,
    required this.items,
  });

  factory ReturnOrderResponse.fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List? ?? [])
        .map((e) => ReturnOrderItem.fromJson(e as Map<String, dynamic>))
        .toList();

    return ReturnOrderResponse(
      returnId: json['returnId'] ?? '',
      customer: json['customer'] ?? '',
      customerName: json['customerName'] ?? '',
      status: json['status'] ?? 'Return',
      postingDate: json['postingDate'] ?? '',
      returnAgainst: json['returnAgainst'],
      grandTotal: (json['grandTotal'] ?? 0).toDouble(),
      total: (json['total'] ?? 0).toDouble(),
      totalQty: json['totalQty'] ?? 0,
      remarks: json['remarks'],
      items: items,
    );
  }
}

class ReturnOrderItem {
  final String itemCode;
  final String itemName;
  final double qty;
  final double rate;
  final double amount;
  final String uom;
  final String stockUom;

  const ReturnOrderItem({
    required this.itemCode,
    required this.itemName,
    required this.qty,
    required this.rate,
    required this.amount,
    required this.uom,
    required this.stockUom,
  });

  factory ReturnOrderItem.fromJson(Map<String, dynamic> json) {
    return ReturnOrderItem(
      itemCode: json['itemCode'] ?? '',
      itemName: json['itemName'] ?? '',
      qty: (json['qty'] ?? 0).toDouble(),
      rate: (json['rate'] ?? 0).toDouble(),
      amount: (json['amount'] ?? 0).toDouble(),
      uom: json['uom'] ?? '',
      stockUom: json['stockUom'] ?? '',
    );
  }
}