// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VisitSummaryModel _$VisitSummaryModelFromJson(Map<String, dynamic> json) =>
    _VisitSummaryModel(
      total: (json['total'] as num?)?.toInt() ?? 0,
      pending: (json['pending'] as num?)?.toInt() ?? 0,
      inProgress: (json['inProgress'] as num?)?.toInt() ?? 0,
      completed: (json['completed'] as num?)?.toInt() ?? 0,
      skipped: (json['skipped'] as num?)?.toInt() ?? 0,
      failed: (json['failed'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$VisitSummaryModelToJson(_VisitSummaryModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pending': instance.pending,
      'inProgress': instance.inProgress,
      'completed': instance.completed,
      'skipped': instance.skipped,
      'failed': instance.failed,
    };
