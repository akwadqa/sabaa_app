import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_stop_model.freezed.dart';
part 'customer_stop_model.g.dart';

@freezed
abstract class CustomerStopModel with _$CustomerStopModel {
  const factory CustomerStopModel({
    required String customerId,
    required String customerName,
    required String? deliveryNote,
  }) = _CustomerStopModel;

  factory CustomerStopModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerStopModelFromJson(json);
}