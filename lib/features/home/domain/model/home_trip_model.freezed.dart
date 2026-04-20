// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_trip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeTripModel {
  String get tripName;
  String get status;
  int get totalVisitsPlanned;
  int get completedVisits;
  int get remainingVisits;
  int get progressPercentage;

  /// Create a copy of HomeTripModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeTripModelCopyWith<HomeTripModel> get copyWith =>
      _$HomeTripModelCopyWithImpl<HomeTripModel>(
          this as HomeTripModel, _$identity);

  /// Serializes this HomeTripModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeTripModel &&
            (identical(other.tripName, tripName) ||
                other.tripName == tripName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalVisitsPlanned, totalVisitsPlanned) ||
                other.totalVisitsPlanned == totalVisitsPlanned) &&
            (identical(other.completedVisits, completedVisits) ||
                other.completedVisits == completedVisits) &&
            (identical(other.remainingVisits, remainingVisits) ||
                other.remainingVisits == remainingVisits) &&
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tripName, status,
      totalVisitsPlanned, completedVisits, remainingVisits, progressPercentage);

  @override
  String toString() {
    return 'HomeTripModel(tripName: $tripName, status: $status, totalVisitsPlanned: $totalVisitsPlanned, completedVisits: $completedVisits, remainingVisits: $remainingVisits, progressPercentage: $progressPercentage)';
  }
}

/// @nodoc
abstract mixin class $HomeTripModelCopyWith<$Res> {
  factory $HomeTripModelCopyWith(
          HomeTripModel value, $Res Function(HomeTripModel) _then) =
      _$HomeTripModelCopyWithImpl;
  @useResult
  $Res call(
      {String tripName,
      String status,
      int totalVisitsPlanned,
      int completedVisits,
      int remainingVisits,
      int progressPercentage});
}

/// @nodoc
class _$HomeTripModelCopyWithImpl<$Res>
    implements $HomeTripModelCopyWith<$Res> {
  _$HomeTripModelCopyWithImpl(this._self, this._then);

  final HomeTripModel _self;
  final $Res Function(HomeTripModel) _then;

  /// Create a copy of HomeTripModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripName = null,
    Object? status = null,
    Object? totalVisitsPlanned = null,
    Object? completedVisits = null,
    Object? remainingVisits = null,
    Object? progressPercentage = null,
  }) {
    return _then(_self.copyWith(
      tripName: null == tripName
          ? _self.tripName
          : tripName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalVisitsPlanned: null == totalVisitsPlanned
          ? _self.totalVisitsPlanned
          : totalVisitsPlanned // ignore: cast_nullable_to_non_nullable
              as int,
      completedVisits: null == completedVisits
          ? _self.completedVisits
          : completedVisits // ignore: cast_nullable_to_non_nullable
              as int,
      remainingVisits: null == remainingVisits
          ? _self.remainingVisits
          : remainingVisits // ignore: cast_nullable_to_non_nullable
              as int,
      progressPercentage: null == progressPercentage
          ? _self.progressPercentage
          : progressPercentage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [HomeTripModel].
extension HomeTripModelPatterns on HomeTripModel {
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
    TResult Function(_HomeTripModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeTripModel() when $default != null:
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
    TResult Function(_HomeTripModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeTripModel():
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
    TResult? Function(_HomeTripModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeTripModel() when $default != null:
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
    TResult Function(String tripName, String status, int totalVisitsPlanned,
            int completedVisits, int remainingVisits, int progressPercentage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeTripModel() when $default != null:
        return $default(
            _that.tripName,
            _that.status,
            _that.totalVisitsPlanned,
            _that.completedVisits,
            _that.remainingVisits,
            _that.progressPercentage);
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
    TResult Function(String tripName, String status, int totalVisitsPlanned,
            int completedVisits, int remainingVisits, int progressPercentage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeTripModel():
        return $default(
            _that.tripName,
            _that.status,
            _that.totalVisitsPlanned,
            _that.completedVisits,
            _that.remainingVisits,
            _that.progressPercentage);
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
    TResult? Function(String tripName, String status, int totalVisitsPlanned,
            int completedVisits, int remainingVisits, int progressPercentage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeTripModel() when $default != null:
        return $default(
            _that.tripName,
            _that.status,
            _that.totalVisitsPlanned,
            _that.completedVisits,
            _that.remainingVisits,
            _that.progressPercentage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HomeTripModel implements HomeTripModel {
  const _HomeTripModel(
      {required this.tripName,
      required this.status,
      required this.totalVisitsPlanned,
      required this.completedVisits,
      required this.remainingVisits,
      required this.progressPercentage});
  factory _HomeTripModel.fromJson(Map<String, dynamic> json) =>
      _$HomeTripModelFromJson(json);

  @override
  final String tripName;
  @override
  final String status;
  @override
  final int totalVisitsPlanned;
  @override
  final int completedVisits;
  @override
  final int remainingVisits;
  @override
  final int progressPercentage;

  /// Create a copy of HomeTripModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeTripModelCopyWith<_HomeTripModel> get copyWith =>
      __$HomeTripModelCopyWithImpl<_HomeTripModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HomeTripModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeTripModel &&
            (identical(other.tripName, tripName) ||
                other.tripName == tripName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalVisitsPlanned, totalVisitsPlanned) ||
                other.totalVisitsPlanned == totalVisitsPlanned) &&
            (identical(other.completedVisits, completedVisits) ||
                other.completedVisits == completedVisits) &&
            (identical(other.remainingVisits, remainingVisits) ||
                other.remainingVisits == remainingVisits) &&
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tripName, status,
      totalVisitsPlanned, completedVisits, remainingVisits, progressPercentage);

  @override
  String toString() {
    return 'HomeTripModel(tripName: $tripName, status: $status, totalVisitsPlanned: $totalVisitsPlanned, completedVisits: $completedVisits, remainingVisits: $remainingVisits, progressPercentage: $progressPercentage)';
  }
}

/// @nodoc
abstract mixin class _$HomeTripModelCopyWith<$Res>
    implements $HomeTripModelCopyWith<$Res> {
  factory _$HomeTripModelCopyWith(
          _HomeTripModel value, $Res Function(_HomeTripModel) _then) =
      __$HomeTripModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String tripName,
      String status,
      int totalVisitsPlanned,
      int completedVisits,
      int remainingVisits,
      int progressPercentage});
}

/// @nodoc
class __$HomeTripModelCopyWithImpl<$Res>
    implements _$HomeTripModelCopyWith<$Res> {
  __$HomeTripModelCopyWithImpl(this._self, this._then);

  final _HomeTripModel _self;
  final $Res Function(_HomeTripModel) _then;

  /// Create a copy of HomeTripModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tripName = null,
    Object? status = null,
    Object? totalVisitsPlanned = null,
    Object? completedVisits = null,
    Object? remainingVisits = null,
    Object? progressPercentage = null,
  }) {
    return _then(_HomeTripModel(
      tripName: null == tripName
          ? _self.tripName
          : tripName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalVisitsPlanned: null == totalVisitsPlanned
          ? _self.totalVisitsPlanned
          : totalVisitsPlanned // ignore: cast_nullable_to_non_nullable
              as int,
      completedVisits: null == completedVisits
          ? _self.completedVisits
          : completedVisits // ignore: cast_nullable_to_non_nullable
              as int,
      remainingVisits: null == remainingVisits
          ? _self.remainingVisits
          : remainingVisits // ignore: cast_nullable_to_non_nullable
              as int,
      progressPercentage: null == progressPercentage
          ? _self.progressPercentage
          : progressPercentage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
