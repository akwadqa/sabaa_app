import 'package:freezed_annotation/freezed_annotation.dart';
import 'route_stop_model.dart';

part 'visit_model.freezed.dart';
part 'visit_model.g.dart';

@freezed
abstract class VisitModel with _$VisitModel {
  const factory VisitModel({
    required String name,
    required String customerId,
    required String customerName,
    required String customerPhone,
    required String? location,
    required String visitDate,
    required RouteStopStatus status,
    String? checkInTime,
    String? checkOutTime,
    double? duration,
    String? remark,
  }) = _VisitModel;

  factory VisitModel.fromJson(Map<String, dynamic> json) =>
      _$VisitModelFromJson(json);
}