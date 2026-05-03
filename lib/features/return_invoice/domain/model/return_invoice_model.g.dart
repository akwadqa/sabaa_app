// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReturnInvoiceModel _$ReturnInvoiceModelFromJson(Map<String, dynamic> json) =>
    _ReturnInvoiceModel(
      invoiceId: json['invoiceId'] as String,
      customer: json['customer'] as String,
      customerName: json['customerName'] as String,
      status: json['status'] as String,
      postingDate: json['postingDate'] as String,
      grandTotal: json['grandTotal'] as num,
      totalTaxesAndCharges: json['totalTaxesAndCharges'] as num,
      outstandingAmount: json['outstandingAmount'] as num,
      paidAmount: json['paidAmount'] as num,
      isReturn: json['isReturn'] as bool,
      returnAgainst: json['returnAgainst'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => InvoiceItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReturnInvoiceModelToJson(_ReturnInvoiceModel instance) =>
    <String, dynamic>{
      'invoiceId': instance.invoiceId,
      'customer': instance.customer,
      'customerName': instance.customerName,
      'status': instance.status,
      'postingDate': instance.postingDate,
      'grandTotal': instance.grandTotal,
      'totalTaxesAndCharges': instance.totalTaxesAndCharges,
      'outstandingAmount': instance.outstandingAmount,
      'paidAmount': instance.paidAmount,
      'isReturn': instance.isReturn,
      'returnAgainst': instance.returnAgainst,
      'items': instance.items,
    };

_InvoiceItemModel _$InvoiceItemModelFromJson(Map<String, dynamic> json) =>
    _InvoiceItemModel(
      itemCode: json['itemCode'] as String,
      itemName: json['itemName'] as String,
      qty: (json['qty'] as num).toInt(),
      uom: json['uom'] as String,
      rate: json['rate'] as num,
      amount: json['amount'] as num,
      discountPercentage: json['discountPercentage'] as num,
      warehouse: json['warehouse'] as String,
    );

Map<String, dynamic> _$InvoiceItemModelToJson(_InvoiceItemModel instance) =>
    <String, dynamic>{
      'itemCode': instance.itemCode,
      'itemName': instance.itemName,
      'qty': instance.qty,
      'uom': instance.uom,
      'rate': instance.rate,
      'amount': instance.amount,
      'discountPercentage': instance.discountPercentage,
      'warehouse': instance.warehouse,
    };
