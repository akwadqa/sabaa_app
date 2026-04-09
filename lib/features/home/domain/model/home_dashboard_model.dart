import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_dashboard_model.freezed.dart';
part 'home_dashboard_model.g.dart';

@freezed
abstract class HomeDashboardModel with _$HomeDashboardModel {
  const factory HomeDashboardModel({
    @Default('') String userName,
    @Default('') String todayDate,
    @Default('') String salesVolume,
    @Default(0)  int    todaysVisits,
  }) = _HomeDashboardModel;

  factory HomeDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDashboardModelFromJson(json);
}