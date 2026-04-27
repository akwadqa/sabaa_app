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
    required String invoiceId,
    required String postingDate,
    required String status,
    required double grandTotal,
    required double outstandingAmount,
    required double paidAmount,
    required bool isReturn,
    String? returnAgainst, // اختياري لأنه قد يأتي null
  }) = _InvoiceModel;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);
}