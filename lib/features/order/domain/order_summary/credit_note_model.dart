// lib/features/order/domain/credit_note/credit_note_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_note_model.freezed.dart';
part 'credit_note_model.g.dart';

@freezed
abstract class CreditNoteModel with _$CreditNoteModel {
  const factory CreditNoteModel({
    required String creditNoteId,
    String? returnAgainst,
    required String postingDate,
    required String currency,
    required num grandTotal,
    required num outstandingAmount,
    required String status,
  }) = _CreditNoteModel;

  factory CreditNoteModel.fromJson(Map<String, dynamic> json) =>
      _$CreditNoteModelFromJson(json);
}