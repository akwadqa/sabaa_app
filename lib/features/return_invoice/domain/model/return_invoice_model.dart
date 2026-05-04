import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_invoice_model.freezed.dart';
part 'return_invoice_model.g.dart';

@freezed
abstract class ReturnInvoiceModel with _$ReturnInvoiceModel {
  const factory ReturnInvoiceModel({
    required String invoiceId,
    required String customer,
    required String customerName,
    required String status,
    required String postingDate,
    required num grandTotal,
    required num totalTaxesAndCharges,
    required num outstandingAmount,
    required num paidAmount,
    required bool isReturn,
    String? returnAgainst,
    required List<InvoiceItemModel> items,
  }) = _ReturnInvoiceModel;

  factory ReturnInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnInvoiceModelFromJson(json);
}

@freezed
abstract class InvoiceItemModel with _$InvoiceItemModel {
  const factory InvoiceItemModel({
    required String itemCode,
    required String itemName,
    required int qty,
    required String uom,
    required num rate,
    required num amount,
    required num discountPercentage,
    required String warehouse,
  }) = _InvoiceItemModel;

  factory InvoiceItemModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceItemModelFromJson(json);
}