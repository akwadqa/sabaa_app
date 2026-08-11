// lib/features/order/domain/customer_details/customer_details_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../order/domain/order_summary/credit_note_model.dart';

part 'customer_details_model.freezed.dart';
part 'customer_details_model.g.dart';

@freezed
abstract class CustomerDetailsModel with _$CustomerDetailsModel {
  const factory CustomerDetailsModel({
    required String customerId,
    required String name,
    String? phone,
    required String status,
    required bool isActive,
    required num outstandingBalance,
    required num totalSales,
    String? location,
    @Default([]) List<CreditNoteModel> creditNotes,
  }) = _CustomerDetailsModel;

  factory CustomerDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailsModelFromJson(json);
}

