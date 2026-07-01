import 'package:freezed_annotation/freezed_annotation.dart';

import 'visit_summary_model.dart';
import 'customer_stop_model.dart';
import 'visit_model.dart';

part 'trip_model.freezed.dart';
part 'trip_model.g.dart';

@freezed
abstract class TripModel with _$TripModel {
  const factory TripModel({
    required String name,
    required String tripDate,
    required String tripType,
    required String status,
    required String? salesPerson,
    required String? driver,
    required String? warehouse,
    required VisitSummaryModel visitSummary,

    @Default([]) List<CustomerStopModel> customerStops,
    @Default([]) List<VisitModel> visits,

    String? vehicle,
    String? startTime,
    String? endTime,
    double? duration,
  }) = _TripModel;

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);
}