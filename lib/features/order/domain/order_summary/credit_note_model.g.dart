// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreditNoteModel _$CreditNoteModelFromJson(Map<String, dynamic> json) =>
    _CreditNoteModel(
      creditNoteId: json['creditNoteId'] as String,
      returnAgainst: json['returnAgainst'] as String?,
      postingDate: json['postingDate'] as String,
      currency: json['currency'] as String,
      grandTotal: json['grandTotal'] as num,
      outstandingAmount: json['outstandingAmount'] as num,
      status: json['status'] as String,
    );

Map<String, dynamic> _$CreditNoteModelToJson(_CreditNoteModel instance) =>
    <String, dynamic>{
      'creditNoteId': instance.creditNoteId,
      'returnAgainst': instance.returnAgainst,
      'postingDate': instance.postingDate,
      'currency': instance.currency,
      'grandTotal': instance.grandTotal,
      'outstandingAmount': instance.outstandingAmount,
      'status': instance.status,
    };
