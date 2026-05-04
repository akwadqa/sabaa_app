import 'package:freezed_annotation/freezed_annotation.dart';

part 'visit_summary_model.freezed.dart';
part 'visit_summary_model.g.dart';

@freezed
abstract class VisitSummaryModel with _$VisitSummaryModel {
  const factory VisitSummaryModel({
    @Default(0) int total,
    @Default(0) int pending,
    @Default(0) int inProgress,
    @Default(0) int completed,
    @Default(0) int skipped,
    @Default(0) int failed,
  }) = _VisitSummaryModel;

  factory VisitSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$VisitSummaryModelFromJson(json);
}