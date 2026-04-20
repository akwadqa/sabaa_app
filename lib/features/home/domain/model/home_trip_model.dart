import 'package:freezed_annotation/freezed_annotation.dart';


part 'home_trip_model.freezed.dart';
part 'home_trip_model.g.dart'; 

@freezed
abstract class HomeTripModel with _$HomeTripModel {
  const factory HomeTripModel({
    required String tripName,
    required String status,
    required int totalVisitsPlanned,
    required int completedVisits,
    required int remainingVisits,
    required int progressPercentage,
  }) = _HomeTripModel;

  factory HomeTripModel.fromJson(Map<String, dynamic> json) =>
      _$HomeTripModelFromJson(json);
}