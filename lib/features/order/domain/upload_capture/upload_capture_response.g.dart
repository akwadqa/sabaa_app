// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_capture_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UploadCaptureResponse _$UploadCaptureResponseFromJson(
        Map<String, dynamic> json) =>
    _UploadCaptureResponse(
      visitId: json['visitId'] as String?,
      captureNote: json['captureNote'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => VisitFileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UploadCaptureResponseToJson(
        _UploadCaptureResponse instance) =>
    <String, dynamic>{
      'visitId': instance.visitId,
      'captureNote': instance.captureNote,
      'files': instance.files,
    };

_VisitFileModel _$VisitFileModelFromJson(Map<String, dynamic> json) =>
    _VisitFileModel(
      fileId: json['fileId'] as String?,
      fileName: json['fileName'] as String?,
      fileUrl: json['fileUrl'] as String?,
    );

Map<String, dynamic> _$VisitFileModelToJson(_VisitFileModel instance) =>
    <String, dynamic>{
      'fileId': instance.fileId,
      'fileName': instance.fileName,
      'fileUrl': instance.fileUrl,
    };
