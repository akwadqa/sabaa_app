import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_customer_response.freezed.dart';
part 'create_customer_response.g.dart';

@freezed
abstract class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    String? customerId,
    String? name,
    String? address,
    String? phone,
    String? status,
    bool? isActive,
    @Default(0) num outstandingBalance,
    @Default(0) num totalSales,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}
