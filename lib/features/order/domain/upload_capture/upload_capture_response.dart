import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_capture_response.freezed.dart';
part 'upload_capture_response.g.dart';

@freezed
abstract class UploadCaptureResponse with _$UploadCaptureResponse {
  const factory UploadCaptureResponse({
    String? visitId,
    String? captureNote,
    // قمنا بوضع الموديل الفرعي هنا داخل القائمة
    List<VisitFileModel>? files,
  }) = _UploadCaptureResponse;

  factory UploadCaptureResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadCaptureResponseFromJson(json);
}

@freezed
abstract class VisitFileModel with _$VisitFileModel {
  const factory VisitFileModel({
    String? fileId,
    String? fileName,
    String? fileUrl,
  }) = _VisitFileModel;

  factory VisitFileModel.fromJson(Map<String, dynamic> json) =>
      _$VisitFileModelFromJson(json);
}
