import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_response_model.freezed.dart';
part 'payment_response_model.g.dart';
@freezed
abstract class PaymentResponseModel with _$PaymentResponseModel {
  const factory PaymentResponseModel({
    required String paymentId,
    required String paymentType,
    required String party,
    required String partyName,
    required double paidAmount,
    required String currency,
    required String referenceDate,
    String? referenceNo,
    required int docStatus,
    required String createdBy,
    required String createdAt,
  }) = _PaymentResponseModel;

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseModelFromJson(json);
}