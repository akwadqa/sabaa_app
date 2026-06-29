// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_capture_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UploadCaptureResponse {
  String? get visitId;
  String? get captureNote; // قمنا بوضع الموديل الفرعي هنا داخل القائمة
  List<VisitFileModel>? get files;

  /// Create a copy of UploadCaptureResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UploadCaptureResponseCopyWith<UploadCaptureResponse> get copyWith =>
      _$UploadCaptureResponseCopyWithImpl<UploadCaptureResponse>(
          this as UploadCaptureResponse, _$identity);

  /// Serializes this UploadCaptureResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UploadCaptureResponse &&
            (identical(other.visitId, visitId) || other.visitId == visitId) &&
            (identical(other.captureNote, captureNote) ||
                other.captureNote == captureNote) &&
            const DeepCollectionEquality().equals(other.files, files));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, visitId, captureNote,
      const DeepCollectionEquality().hash(files));

  @override
  String toString() {
    return 'UploadCaptureResponse(visitId: $visitId, captureNote: $captureNote, files: $files)';
  }
}

/// @nodoc
abstract mixin class $UploadCaptureResponseCopyWith<$Res> {
  factory $UploadCaptureResponseCopyWith(UploadCaptureResponse value,
          $Res Function(UploadCaptureResponse) _then) =
      _$UploadCaptureResponseCopyWithImpl;
  @useResult
  $Res call(
      {String? visitId, String? captureNote, List<VisitFileModel>? files});
}

/// @nodoc
class _$UploadCaptureResponseCopyWithImpl<$Res>
    implements $UploadCaptureResponseCopyWith<$Res> {
  _$UploadCaptureResponseCopyWithImpl(this._self, this._then);

  final UploadCaptureResponse _self;
  final $Res Function(UploadCaptureResponse) _then;

  /// Create a copy of UploadCaptureResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitId = freezed,
    Object? captureNote = freezed,
    Object? files = freezed,
  }) {
    return _then(_self.copyWith(
      visitId: freezed == visitId
          ? _self.visitId
          : visitId // ignore: cast_nullable_to_non_nullable
              as String?,
      captureNote: freezed == captureNote
          ? _self.captureNote
          : captureNote // ignore: cast_nullable_to_non_nullable
              as String?,
      files: freezed == files
          ? _self.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<VisitFileModel>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UploadCaptureResponse].
extension UploadCaptureResponsePatterns on UploadCaptureResponse {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UploadCaptureResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UploadCaptureResponse() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UploadCaptureResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadCaptureResponse():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UploadCaptureResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadCaptureResponse() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? visitId, String? captureNote, List<VisitFileModel>? files)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UploadCaptureResponse() when $default != null:
        return $default(_that.visitId, _that.captureNote, _that.files);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? visitId, String? captureNote, List<VisitFileModel>? files)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadCaptureResponse():
        return $default(_that.visitId, _that.captureNote, _that.files);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? visitId, String? captureNote, List<VisitFileModel>? files)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadCaptureResponse() when $default != null:
        return $default(_that.visitId, _that.captureNote, _that.files);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UploadCaptureResponse implements UploadCaptureResponse {
  const _UploadCaptureResponse(
      {this.visitId, this.captureNote, final List<VisitFileModel>? files})
      : _files = files;
  factory _UploadCaptureResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadCaptureResponseFromJson(json);

  @override
  final String? visitId;
  @override
  final String? captureNote;
// قمنا بوضع الموديل الفرعي هنا داخل القائمة
  final List<VisitFileModel>? _files;
// قمنا بوضع الموديل الفرعي هنا داخل القائمة
  @override
  List<VisitFileModel>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of UploadCaptureResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UploadCaptureResponseCopyWith<_UploadCaptureResponse> get copyWith =>
      __$UploadCaptureResponseCopyWithImpl<_UploadCaptureResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UploadCaptureResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UploadCaptureResponse &&
            (identical(other.visitId, visitId) || other.visitId == visitId) &&
            (identical(other.captureNote, captureNote) ||
                other.captureNote == captureNote) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, visitId, captureNote,
      const DeepCollectionEquality().hash(_files));

  @override
  String toString() {
    return 'UploadCaptureResponse(visitId: $visitId, captureNote: $captureNote, files: $files)';
  }
}

/// @nodoc
abstract mixin class _$UploadCaptureResponseCopyWith<$Res>
    implements $UploadCaptureResponseCopyWith<$Res> {
  factory _$UploadCaptureResponseCopyWith(_UploadCaptureResponse value,
          $Res Function(_UploadCaptureResponse) _then) =
      __$UploadCaptureResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? visitId, String? captureNote, List<VisitFileModel>? files});
}

/// @nodoc
class __$UploadCaptureResponseCopyWithImpl<$Res>
    implements _$UploadCaptureResponseCopyWith<$Res> {
  __$UploadCaptureResponseCopyWithImpl(this._self, this._then);

  final _UploadCaptureResponse _self;
  final $Res Function(_UploadCaptureResponse) _then;

  /// Create a copy of UploadCaptureResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? visitId = freezed,
    Object? captureNote = freezed,
    Object? files = freezed,
  }) {
    return _then(_UploadCaptureResponse(
      visitId: freezed == visitId
          ? _self.visitId
          : visitId // ignore: cast_nullable_to_non_nullable
              as String?,
      captureNote: freezed == captureNote
          ? _self.captureNote
          : captureNote // ignore: cast_nullable_to_non_nullable
              as String?,
      files: freezed == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<VisitFileModel>?,
    ));
  }
}

/// @nodoc
mixin _$VisitFileModel {
  String? get fileId;
  String? get fileName;
  String? get fileUrl;

  /// Create a copy of VisitFileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VisitFileModelCopyWith<VisitFileModel> get copyWith =>
      _$VisitFileModelCopyWithImpl<VisitFileModel>(
          this as VisitFileModel, _$identity);

  /// Serializes this VisitFileModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VisitFileModel &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fileId, fileName, fileUrl);

  @override
  String toString() {
    return 'VisitFileModel(fileId: $fileId, fileName: $fileName, fileUrl: $fileUrl)';
  }
}

/// @nodoc
abstract mixin class $VisitFileModelCopyWith<$Res> {
  factory $VisitFileModelCopyWith(
          VisitFileModel value, $Res Function(VisitFileModel) _then) =
      _$VisitFileModelCopyWithImpl;
  @useResult
  $Res call({String? fileId, String? fileName, String? fileUrl});
}

/// @nodoc
class _$VisitFileModelCopyWithImpl<$Res>
    implements $VisitFileModelCopyWith<$Res> {
  _$VisitFileModelCopyWithImpl(this._self, this._then);

  final VisitFileModel _self;
  final $Res Function(VisitFileModel) _then;

  /// Create a copy of VisitFileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = freezed,
    Object? fileName = freezed,
    Object? fileUrl = freezed,
  }) {
    return _then(_self.copyWith(
      fileId: freezed == fileId
          ? _self.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String?,
      fileName: freezed == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      fileUrl: freezed == fileUrl
          ? _self.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [VisitFileModel].
extension VisitFileModelPatterns on VisitFileModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VisitFileModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VisitFileModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VisitFileModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitFileModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VisitFileModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitFileModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? fileId, String? fileName, String? fileUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VisitFileModel() when $default != null:
        return $default(_that.fileId, _that.fileName, _that.fileUrl);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? fileId, String? fileName, String? fileUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitFileModel():
        return $default(_that.fileId, _that.fileName, _that.fileUrl);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? fileId, String? fileName, String? fileUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitFileModel() when $default != null:
        return $default(_that.fileId, _that.fileName, _that.fileUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VisitFileModel implements VisitFileModel {
  const _VisitFileModel({this.fileId, this.fileName, this.fileUrl});
  factory _VisitFileModel.fromJson(Map<String, dynamic> json) =>
      _$VisitFileModelFromJson(json);

  @override
  final String? fileId;
  @override
  final String? fileName;
  @override
  final String? fileUrl;

  /// Create a copy of VisitFileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VisitFileModelCopyWith<_VisitFileModel> get copyWith =>
      __$VisitFileModelCopyWithImpl<_VisitFileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VisitFileModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VisitFileModel &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fileId, fileName, fileUrl);

  @override
  String toString() {
    return 'VisitFileModel(fileId: $fileId, fileName: $fileName, fileUrl: $fileUrl)';
  }
}

/// @nodoc
abstract mixin class _$VisitFileModelCopyWith<$Res>
    implements $VisitFileModelCopyWith<$Res> {
  factory _$VisitFileModelCopyWith(
          _VisitFileModel value, $Res Function(_VisitFileModel) _then) =
      __$VisitFileModelCopyWithImpl;
  @override
  @useResult
  $Res call({String? fileId, String? fileName, String? fileUrl});
}

/// @nodoc
class __$VisitFileModelCopyWithImpl<$Res>
    implements _$VisitFileModelCopyWith<$Res> {
  __$VisitFileModelCopyWithImpl(this._self, this._then);

  final _VisitFileModel _self;
  final $Res Function(_VisitFileModel) _then;

  /// Create a copy of VisitFileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fileId = freezed,
    Object? fileName = freezed,
    Object? fileUrl = freezed,
  }) {
    return _then(_VisitFileModel(
      fileId: freezed == fileId
          ? _self.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String?,
      fileName: freezed == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      fileUrl: freezed == fileUrl
          ? _self.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
