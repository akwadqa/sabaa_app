// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_performance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyPerformanceModel {
  int get totalSales;
  int get totalVisitsCompleted;
  int get totalOrdersCreated;
  int get totalPaymentsCollected;

  /// Create a copy of DailyPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DailyPerformanceModelCopyWith<DailyPerformanceModel> get copyWith =>
      _$DailyPerformanceModelCopyWithImpl<DailyPerformanceModel>(
          this as DailyPerformanceModel, _$identity);

  /// Serializes this DailyPerformanceModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyPerformanceModel &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.totalVisitsCompleted, totalVisitsCompleted) ||
                other.totalVisitsCompleted == totalVisitsCompleted) &&
            (identical(other.totalOrdersCreated, totalOrdersCreated) ||
                other.totalOrdersCreated == totalOrdersCreated) &&
            (identical(other.totalPaymentsCollected, totalPaymentsCollected) ||
                other.totalPaymentsCollected == totalPaymentsCollected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalSales, totalVisitsCompleted,
      totalOrdersCreated, totalPaymentsCollected);

  @override
  String toString() {
    return 'DailyPerformanceModel(totalSales: $totalSales, totalVisitsCompleted: $totalVisitsCompleted, totalOrdersCreated: $totalOrdersCreated, totalPaymentsCollected: $totalPaymentsCollected)';
  }
}

/// @nodoc
abstract mixin class $DailyPerformanceModelCopyWith<$Res> {
  factory $DailyPerformanceModelCopyWith(DailyPerformanceModel value,
          $Res Function(DailyPerformanceModel) _then) =
      _$DailyPerformanceModelCopyWithImpl;
  @useResult
  $Res call(
      {int totalSales,
      int totalVisitsCompleted,
      int totalOrdersCreated,
      int totalPaymentsCollected});
}

/// @nodoc
class _$DailyPerformanceModelCopyWithImpl<$Res>
    implements $DailyPerformanceModelCopyWith<$Res> {
  _$DailyPerformanceModelCopyWithImpl(this._self, this._then);

  final DailyPerformanceModel _self;
  final $Res Function(DailyPerformanceModel) _then;

  /// Create a copy of DailyPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSales = null,
    Object? totalVisitsCompleted = null,
    Object? totalOrdersCreated = null,
    Object? totalPaymentsCollected = null,
  }) {
    return _then(_self.copyWith(
      totalSales: null == totalSales
          ? _self.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int,
      totalVisitsCompleted: null == totalVisitsCompleted
          ? _self.totalVisitsCompleted
          : totalVisitsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrdersCreated: null == totalOrdersCreated
          ? _self.totalOrdersCreated
          : totalOrdersCreated // ignore: cast_nullable_to_non_nullable
              as int,
      totalPaymentsCollected: null == totalPaymentsCollected
          ? _self.totalPaymentsCollected
          : totalPaymentsCollected // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [DailyPerformanceModel].
extension DailyPerformanceModelPatterns on DailyPerformanceModel {
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
    TResult Function(_DailyPerformanceModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailyPerformanceModel() when $default != null:
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
    TResult Function(_DailyPerformanceModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyPerformanceModel():
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
    TResult? Function(_DailyPerformanceModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyPerformanceModel() when $default != null:
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
    TResult Function(int totalSales, int totalVisitsCompleted,
            int totalOrdersCreated, int totalPaymentsCollected)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailyPerformanceModel() when $default != null:
        return $default(_that.totalSales, _that.totalVisitsCompleted,
            _that.totalOrdersCreated, _that.totalPaymentsCollected);
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
    TResult Function(int totalSales, int totalVisitsCompleted,
            int totalOrdersCreated, int totalPaymentsCollected)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyPerformanceModel():
        return $default(_that.totalSales, _that.totalVisitsCompleted,
            _that.totalOrdersCreated, _that.totalPaymentsCollected);
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
    TResult? Function(int totalSales, int totalVisitsCompleted,
            int totalOrdersCreated, int totalPaymentsCollected)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyPerformanceModel() when $default != null:
        return $default(_that.totalSales, _that.totalVisitsCompleted,
            _that.totalOrdersCreated, _that.totalPaymentsCollected);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DailyPerformanceModel implements DailyPerformanceModel {
  const _DailyPerformanceModel(
      {required this.totalSales,
      required this.totalVisitsCompleted,
      required this.totalOrdersCreated,
      required this.totalPaymentsCollected});
  factory _DailyPerformanceModel.fromJson(Map<String, dynamic> json) =>
      _$DailyPerformanceModelFromJson(json);

  @override
  final int totalSales;
  @override
  final int totalVisitsCompleted;
  @override
  final int totalOrdersCreated;
  @override
  final int totalPaymentsCollected;

  /// Create a copy of DailyPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DailyPerformanceModelCopyWith<_DailyPerformanceModel> get copyWith =>
      __$DailyPerformanceModelCopyWithImpl<_DailyPerformanceModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DailyPerformanceModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyPerformanceModel &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.totalVisitsCompleted, totalVisitsCompleted) ||
                other.totalVisitsCompleted == totalVisitsCompleted) &&
            (identical(other.totalOrdersCreated, totalOrdersCreated) ||
                other.totalOrdersCreated == totalOrdersCreated) &&
            (identical(other.totalPaymentsCollected, totalPaymentsCollected) ||
                other.totalPaymentsCollected == totalPaymentsCollected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalSales, totalVisitsCompleted,
      totalOrdersCreated, totalPaymentsCollected);

  @override
  String toString() {
    return 'DailyPerformanceModel(totalSales: $totalSales, totalVisitsCompleted: $totalVisitsCompleted, totalOrdersCreated: $totalOrdersCreated, totalPaymentsCollected: $totalPaymentsCollected)';
  }
}

/// @nodoc
abstract mixin class _$DailyPerformanceModelCopyWith<$Res>
    implements $DailyPerformanceModelCopyWith<$Res> {
  factory _$DailyPerformanceModelCopyWith(_DailyPerformanceModel value,
          $Res Function(_DailyPerformanceModel) _then) =
      __$DailyPerformanceModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalSales,
      int totalVisitsCompleted,
      int totalOrdersCreated,
      int totalPaymentsCollected});
}

/// @nodoc
class __$DailyPerformanceModelCopyWithImpl<$Res>
    implements _$DailyPerformanceModelCopyWith<$Res> {
  __$DailyPerformanceModelCopyWithImpl(this._self, this._then);

  final _DailyPerformanceModel _self;
  final $Res Function(_DailyPerformanceModel) _then;

  /// Create a copy of DailyPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalSales = null,
    Object? totalVisitsCompleted = null,
    Object? totalOrdersCreated = null,
    Object? totalPaymentsCollected = null,
  }) {
    return _then(_DailyPerformanceModel(
      totalSales: null == totalSales
          ? _self.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int,
      totalVisitsCompleted: null == totalVisitsCompleted
          ? _self.totalVisitsCompleted
          : totalVisitsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrdersCreated: null == totalOrdersCreated
          ? _self.totalOrdersCreated
          : totalOrdersCreated // ignore: cast_nullable_to_non_nullable
              as int,
      totalPaymentsCollected: null == totalPaymentsCollected
          ? _self.totalPaymentsCollected
          : totalPaymentsCollected // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
