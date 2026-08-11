// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_note_reconcile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreditNoteReconcileResponse _$CreditNoteReconcileResponseFromJson(
        Map<String, dynamic> json) =>
    _CreditNoteReconcileResponse(
      invoiceId: json['invoiceId'] as String,
      outstandingAmount: json['outstandingAmount'] as num,
      status: json['status'] as String,
      allocations: (json['allocations'] as List<dynamic>)
          .map((e) => CreditNoteAllocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreditNoteReconcileResponseToJson(
        _CreditNoteReconcileResponse instance) =>
    <String, dynamic>{
      'invoiceId': instance.invoiceId,
      'outstandingAmount': instance.outstandingAmount,
      'status': instance.status,
      'allocations': instance.allocations,
    };

_CreditNoteAllocation _$CreditNoteAllocationFromJson(
        Map<String, dynamic> json) =>
    _CreditNoteAllocation(
      creditNoteId: json['creditNoteId'] as String,
      allocatedAmount: json['allocatedAmount'] as num,
    );

Map<String, dynamic> _$CreditNoteAllocationToJson(
        _CreditNoteAllocation instance) =>
    <String, dynamic>{
      'creditNoteId': instance.creditNoteId,
      'allocatedAmount': instance.allocatedAmount,
    };
