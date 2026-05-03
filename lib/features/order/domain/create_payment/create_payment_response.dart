import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_payment_response.freezed.dart';
part 'create_payment_response.g.dart';

@freezed
abstract class CreatePaymentResponse with _$CreatePaymentResponse {
  const factory CreatePaymentResponse({
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
  }) = _CreatePaymentResponse;

  factory CreatePaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentResponseFromJson(json);
}