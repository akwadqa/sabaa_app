// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'order_summary_model.freezed.dart';
// part 'order_summary_model.g.dart';

// @freezed
// abstract class OrderSummaryModel with _$OrderSummaryModel {
//   const factory OrderSummaryModel({
//     required String customerId,
//     required int totalSales,
//     required int totalReturnSales,
//     required double totalInvoicesAmount,
//     required double outstandingBalance,
//     required List<InvoiceModel> invoices,
//   }) = _OrderSummaryModel;

//   factory OrderSummaryModel.fromJson(Map<String, dynamic> json) =>
//       _$OrderSummaryModelFromJson(json);
// }

// @freezed
// abstract class InvoiceModel with _$InvoiceModel {
//   const factory InvoiceModel({
//     required String invoiceId,
//     required String postingDate,
//     required String status,
//     required double grandTotal,
//     required double outstandingAmount,
//     required double paidAmount,
//     required bool isReturn,
//     String? returnAgainst, // اختياري لأنه قد يأتي null
//   }) = _InvoiceModel;

//   factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
//       _$InvoiceModelFromJson(json);
// }


// order_summary_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_summary_model.freezed.dart';
part 'order_summary_model.g.dart';

@freezed
abstract class OrderSummaryModel with _$OrderSummaryModel {
  const factory OrderSummaryModel({
    required String customerId,
    required int totalSales,
    required int totalReturnSales,
    required double totalInvoicesAmount,
    required double outstandingBalance,
    required List<InvoiceModel> invoices,
  }) = _OrderSummaryModel;

  factory OrderSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderSummaryModelFromJson(json);
}

@freezed
abstract class InvoiceModel with _$InvoiceModel {
  const factory InvoiceModel({
    // ✅ Accept either invoiceId or returnId
    @JsonKey(readValue: _readInvoiceId) required String invoiceId,
    @Default('') String postingDate,
    @Default('') String status,
    // ✅ Accept either grandTotal or total
    @JsonKey(readValue: _readGrandTotal) @Default(0.0) double grandTotal,
    @Default(0.0) double outstandingAmount,
    @Default(0.0) double paidAmount,
    @Default(false) bool isReturn,
    String? returnAgainst,
  }) = _InvoiceModel;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);
}

// ── Custom field readers — handle both create_invoice and create_return_order responses ───

Object? _readInvoiceId(Map map, String key) {
  return map['invoiceId'] ?? map['returnId'] ?? '';
}

Object? _readGrandTotal(Map map, String key) {
  final value = map['grandTotal'] ?? map['total'] ?? 0;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString()) ?? 0.0;
}