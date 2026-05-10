// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatePaymentResponse _$CreatePaymentResponseFromJson(
        Map<String, dynamic> json) =>
    _CreatePaymentResponse(
      paymentId: json['paymentId'] as String,
      paymentType: json['paymentType'] as String,
      party: json['party'] as String,
      partyName: json['partyName'] as String,
      paidAmount: (json['paidAmount'] as num).toDouble(),
      currency: json['currency'] as String,
      referenceDate: json['referenceDate'] as String,
      referenceNo: json['referenceNo'] as String?,
      docStatus: (json['docStatus'] as num).toInt(),
      createdBy: json['createdBy'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$CreatePaymentResponseToJson(
        _CreatePaymentResponse instance) =>
    <String, dynamic>{
      'paymentId': instance.paymentId,
      'paymentType': instance.paymentType,
      'party': instance.party,
      'partyName': instance.partyName,
      'paidAmount': instance.paidAmount,
      'currency': instance.currency,
      'referenceDate': instance.referenceDate,
      'referenceNo': instance.referenceNo,
      'docStatus': instance.docStatus,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt,
    };
