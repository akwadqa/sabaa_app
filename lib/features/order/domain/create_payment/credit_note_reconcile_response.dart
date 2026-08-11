// lib/features/order/domain/credit_note/credit_note_reconcile_response.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_note_reconcile_response.freezed.dart';
part 'credit_note_reconcile_response.g.dart';

@freezed
abstract class CreditNoteReconcileResponse with _$CreditNoteReconcileResponse {
  const factory CreditNoteReconcileResponse({
    required String invoiceId,
    required num outstandingAmount,
    required String status,
    required List<CreditNoteAllocation> allocations,
  }) = _CreditNoteReconcileResponse;

  factory CreditNoteReconcileResponse.fromJson(Map<String, dynamic> json) =>
      _$CreditNoteReconcileResponseFromJson(json);
}

@freezed
abstract class CreditNoteAllocation with _$CreditNoteAllocation {
  const factory CreditNoteAllocation({
    required String creditNoteId,
    required num allocatedAmount,
  }) = _CreditNoteAllocation;

  factory CreditNoteAllocation.fromJson(Map<String, dynamic> json) =>
      _$CreditNoteAllocationFromJson(json);
}