// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VisitSummaryModel {
  int get total;
  int get pending;
  int get inProgress;
  int get completed;
  int get skipped;
  int get failed;

  /// Create a copy of VisitSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VisitSummaryModelCopyWith<VisitSummaryModel> get copyWith =>
      _$VisitSummaryModelCopyWithImpl<VisitSummaryModel>(
          this as VisitSummaryModel, _$identity);

  /// Serializes this VisitSummaryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VisitSummaryModel &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.pending, pending) || other.pending == pending) &&
            (identical(other.inProgress, inProgress) ||
                other.inProgress == inProgress) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.skipped, skipped) || other.skipped == skipped) &&
            (identical(other.failed, failed) || other.failed == failed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, pending, inProgress, completed, skipped, failed);

  @override
  String toString() {
    return 'VisitSummaryModel(total: $total, pending: $pending, inProgress: $inProgress, completed: $completed, skipped: $skipped, failed: $failed)';
  }
}

/// @nodoc
abstract mixin class $VisitSummaryModelCopyWith<$Res> {
  factory $VisitSummaryModelCopyWith(
          VisitSummaryModel value, $Res Function(VisitSummaryModel) _then) =
      _$VisitSummaryModelCopyWithImpl;
  @useResult
  $Res call(
      {int total,
      int pending,
      int inProgress,
      int completed,
      int skipped,
      int failed});
}

/// @nodoc
class _$VisitSummaryModelCopyWithImpl<$Res>
    implements $VisitSummaryModelCopyWith<$Res> {
  _$VisitSummaryModelCopyWithImpl(this._self, this._then);

  final VisitSummaryModel _self;
  final $Res Function(VisitSummaryModel) _then;

  /// Create a copy of VisitSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? pending = null,
    Object? inProgress = null,
    Object? completed = null,
    Object? skipped = null,
    Object? failed = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      pending: null == pending
          ? _self.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as int,
      inProgress: null == inProgress
          ? _self.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as int,
      completed: null == completed
          ? _self.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as int,
      skipped: null == skipped
          ? _self.skipped
          : skipped // ignore: cast_nullable_to_non_nullable
              as int,
      failed: null == failed
          ? _self.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [VisitSummaryModel].
extension VisitSummaryModelPatterns on VisitSummaryModel {
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
    TResult Function(_VisitSummaryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VisitSummaryModel() when $default != null:
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
    TResult Function(_VisitSummaryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitSummaryModel():
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
    TResult? Function(_VisitSummaryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitSummaryModel() when $default != null:
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
    TResult Function(int total, int pending, int inProgress, int completed,
            int skipped, int failed)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VisitSummaryModel() when $default != null:
        return $default(_that.total, _that.pending, _that.inProgress,
            _that.completed, _that.skipped, _that.failed);
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
    TResult Function(int total, int pending, int inProgress, int completed,
            int skipped, int failed)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitSummaryModel():
        return $default(_that.total, _that.pending, _that.inProgress,
            _that.completed, _that.skipped, _that.failed);
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
    TResult? Function(int total, int pending, int inProgress, int completed,
            int skipped, int failed)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitSummaryModel() when $default != null:
        return $default(_that.total, _that.pending, _that.inProgress,
            _that.completed, _that.skipped, _that.failed);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VisitSummaryModel implements VisitSummaryModel {
  const _VisitSummaryModel(
      {this.total = 0,
      this.pending = 0,
      this.inProgress = 0,
      this.completed = 0,
      this.skipped = 0,
      this.failed = 0});
  factory _VisitSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$VisitSummaryModelFromJson(json);

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int pending;
  @override
  @JsonKey()
  final int inProgress;
  @override
  @JsonKey()
  final int completed;
  @override
  @JsonKey()
  final int skipped;
  @override
  @JsonKey()
  final int failed;

  /// Create a copy of VisitSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VisitSummaryModelCopyWith<_VisitSummaryModel> get copyWith =>
      __$VisitSummaryModelCopyWithImpl<_VisitSummaryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VisitSummaryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VisitSummaryModel &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.pending, pending) || other.pending == pending) &&
            (identical(other.inProgress, inProgress) ||
                other.inProgress == inProgress) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.skipped, skipped) || other.skipped == skipped) &&
            (identical(other.failed, failed) || other.failed == failed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, pending, inProgress, completed, skipped, failed);

  @override
  String toString() {
    return 'VisitSummaryModel(total: $total, pending: $pending, inProgress: $inProgress, completed: $completed, skipped: $skipped, failed: $failed)';
  }
}

/// @nodoc
abstract mixin class _$VisitSummaryModelCopyWith<$Res>
    implements $VisitSummaryModelCopyWith<$Res> {
  factory _$VisitSummaryModelCopyWith(
          _VisitSummaryModel value, $Res Function(_VisitSummaryModel) _then) =
      __$VisitSummaryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int total,
      int pending,
      int inProgress,
      int completed,
      int skipped,
      int failed});
}

/// @nodoc
class __$VisitSummaryModelCopyWithImpl<$Res>
    implements _$VisitSummaryModelCopyWith<$Res> {
  __$VisitSummaryModelCopyWithImpl(this._self, this._then);

  final _VisitSummaryModel _self;
  final $Res Function(_VisitSummaryModel) _then;

  /// Create a copy of VisitSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? pending = null,
    Object? inProgress = null,
    Object? completed = null,
    Object? skipped = null,
    Object? failed = null,
  }) {
    return _then(_VisitSummaryModel(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      pending: null == pending
          ? _self.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as int,
      inProgress: null == inProgress
          ? _self.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as int,
      completed: null == completed
          ? _self.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as int,
      skipped: null == skipped
          ? _self.skipped
          : skipped // ignore: cast_nullable_to_non_nullable
              as int,
      failed: null == failed
          ? _self.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
