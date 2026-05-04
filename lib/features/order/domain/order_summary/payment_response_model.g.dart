// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentResponseModel _$PaymentResponseModelFromJson(
        Map<String, dynamic> json) =>
    _PaymentResponseModel(
      paymentId: json['paymentId'] as String,
      paymentType: json['paymentType'] as String,
      party: json['party'] as String,
      partyName: json['partyName'] as String,
      modeOfPayment: json['modeOfPayment'] as String,
      paidAmount: (json['paidAmount'] as num).toDouble(),
      currency: json['currency'] as String,
      docStatus: (json['docStatus'] as num).toInt(),
    );

Map<String, dynamic> _$PaymentResponseModelToJson(
        _PaymentResponseModel instance) =>
    <String, dynamic>{
      'paymentId': instance.paymentId,
      'paymentType': instance.paymentType,
      'party': instance.party,
      'partyName': instance.partyName,
      'modeOfPayment': instance.modeOfPayment,
      'paidAmount': instance.paidAmount,
      'currency': instance.currency,
      'docStatus': instance.docStatus,
    };
