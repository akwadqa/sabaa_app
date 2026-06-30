// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderSummaryModel _$OrderSummaryModelFromJson(Map<String, dynamic> json) =>
    _OrderSummaryModel(
      customerId: json['customerId'] as String,
      totalSales: (json['totalSales'] as num).toInt(),
      totalReturnSales: (json['totalReturnSales'] as num).toInt(),
      totalInvoicesAmount: (json['totalInvoicesAmount'] as num).toDouble(),
      outstandingBalance: (json['outstandingBalance'] as num).toDouble(),
      invoices: (json['invoices'] as List<dynamic>)
          .map((e) => InvoiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderSummaryModelToJson(_OrderSummaryModel instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'totalSales': instance.totalSales,
      'totalReturnSales': instance.totalReturnSales,
      'totalInvoicesAmount': instance.totalInvoicesAmount,
      'outstandingBalance': instance.outstandingBalance,
      'invoices': instance.invoices,
    };

_InvoiceModel _$InvoiceModelFromJson(Map<String, dynamic> json) =>
    _InvoiceModel(
      invoiceId: _readInvoiceId(json, 'invoiceId') as String,
      postingDate: json['postingDate'] as String? ?? '',
      status: json['status'] as String? ?? '',
      grandTotal:
          (_readGrandTotal(json, 'grandTotal') as num?)?.toDouble() ?? 0.0,
      outstandingAmount: (json['outstandingAmount'] as num?)?.toDouble() ?? 0.0,
      paidAmount: (json['paidAmount'] as num?)?.toDouble() ?? 0.0,
      isReturn: json['isReturn'] as bool? ?? false,
      returnAgainst: json['returnAgainst'] as String?,
    );

Map<String, dynamic> _$InvoiceModelToJson(_InvoiceModel instance) =>
    <String, dynamic>{
      'invoiceId': instance.invoiceId,
      'postingDate': instance.postingDate,
      'status': instance.status,
      'grandTotal': instance.grandTotal,
      'outstandingAmount': instance.outstandingAmount,
      'paidAmount': instance.paidAmount,
      'isReturn': instance.isReturn,
      'returnAgainst': instance.returnAgainst,
    };
