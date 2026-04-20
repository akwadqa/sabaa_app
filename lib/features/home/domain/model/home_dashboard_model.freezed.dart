// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeDashboardModel {
  DateModel get date;
  DailyPerformanceModel get dailyPerformance;
  HomeTripModel get trip;

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeDashboardModelCopyWith<HomeDashboardModel> get copyWith =>
      _$HomeDashboardModelCopyWithImpl<HomeDashboardModel>(
          this as HomeDashboardModel, _$identity);

  /// Serializes this HomeDashboardModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeDashboardModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dailyPerformance, dailyPerformance) ||
                other.dailyPerformance == dailyPerformance) &&
            (identical(other.trip, trip) || other.trip == trip));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, dailyPerformance, trip);

  @override
  String toString() {
    return 'HomeDashboardModel(date: $date, dailyPerformance: $dailyPerformance, trip: $trip)';
  }
}

/// @nodoc
abstract mixin class $HomeDashboardModelCopyWith<$Res> {
  factory $HomeDashboardModelCopyWith(
          HomeDashboardModel value, $Res Function(HomeDashboardModel) _then) =
      _$HomeDashboardModelCopyWithImpl;
  @useResult
  $Res call(
      {DateModel date,
      DailyPerformanceModel dailyPerformance,
      HomeTripModel trip});

  $DateModelCopyWith<$Res> get date;
  $DailyPerformanceModelCopyWith<$Res> get dailyPerformance;
  $HomeTripModelCopyWith<$Res> get trip;
}

/// @nodoc
class _$HomeDashboardModelCopyWithImpl<$Res>
    implements $HomeDashboardModelCopyWith<$Res> {
  _$HomeDashboardModelCopyWithImpl(this._self, this._then);

  final HomeDashboardModel _self;
  final $Res Function(HomeDashboardModel) _then;

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dailyPerformance = null,
    Object? trip = null,
  }) {
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateModel,
      dailyPerformance: null == dailyPerformance
          ? _self.dailyPerformance
          : dailyPerformance // ignore: cast_nullable_to_non_nullable
              as DailyPerformanceModel,
      trip: null == trip
          ? _self.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as HomeTripModel,
    ));
  }

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DateModelCopyWith<$Res> get date {
    return $DateModelCopyWith<$Res>(_self.date, (value) {
      return _then(_self.copyWith(date: value));
    });
  }

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyPerformanceModelCopyWith<$Res> get dailyPerformance {
    return $DailyPerformanceModelCopyWith<$Res>(_self.dailyPerformance,
        (value) {
      return _then(_self.copyWith(dailyPerformance: value));
    });
  }

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeTripModelCopyWith<$Res> get trip {
    return $HomeTripModelCopyWith<$Res>(_self.trip, (value) {
      return _then(_self.copyWith(trip: value));
    });
  }
}

/// Adds pattern-matching-related methods to [HomeDashboardModel].
extension HomeDashboardModelPatterns on HomeDashboardModel {
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
    TResult Function(_HomeDashboardModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel() when $default != null:
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
    TResult Function(_HomeDashboardModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel():
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
    TResult? Function(_HomeDashboardModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel() when $default != null:
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
    TResult Function(DateModel date, DailyPerformanceModel dailyPerformance,
            HomeTripModel trip)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel() when $default != null:
        return $default(_that.date, _that.dailyPerformance, _that.trip);
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
    TResult Function(DateModel date, DailyPerformanceModel dailyPerformance,
            HomeTripModel trip)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel():
        return $default(_that.date, _that.dailyPerformance, _that.trip);
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
    TResult? Function(DateModel date, DailyPerformanceModel dailyPerformance,
            HomeTripModel trip)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel() when $default != null:
        return $default(_that.date, _that.dailyPerformance, _that.trip);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HomeDashboardModel implements HomeDashboardModel {
  const _HomeDashboardModel(
      {required this.date, required this.dailyPerformance, required this.trip});
  factory _HomeDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDashboardModelFromJson(json);

  @override
  final DateModel date;
  @override
  final DailyPerformanceModel dailyPerformance;
  @override
  final HomeTripModel trip;

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeDashboardModelCopyWith<_HomeDashboardModel> get copyWith =>
      __$HomeDashboardModelCopyWithImpl<_HomeDashboardModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HomeDashboardModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeDashboardModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dailyPerformance, dailyPerformance) ||
                other.dailyPerformance == dailyPerformance) &&
            (identical(other.trip, trip) || other.trip == trip));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, dailyPerformance, trip);

  @override
  String toString() {
    return 'HomeDashboardModel(date: $date, dailyPerformance: $dailyPerformance, trip: $trip)';
  }
}

/// @nodoc
abstract mixin class _$HomeDashboardModelCopyWith<$Res>
    implements $HomeDashboardModelCopyWith<$Res> {
  factory _$HomeDashboardModelCopyWith(
          _HomeDashboardModel value, $Res Function(_HomeDashboardModel) _then) =
      __$HomeDashboardModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateModel date,
      DailyPerformanceModel dailyPerformance,
      HomeTripModel trip});

  @override
  $DateModelCopyWith<$Res> get date;
  @override
  $DailyPerformanceModelCopyWith<$Res> get dailyPerformance;
  @override
  $HomeTripModelCopyWith<$Res> get trip;
}

/// @nodoc
class __$HomeDashboardModelCopyWithImpl<$Res>
    implements _$HomeDashboardModelCopyWith<$Res> {
  __$HomeDashboardModelCopyWithImpl(this._self, this._then);

  final _HomeDashboardModel _self;
  final $Res Function(_HomeDashboardModel) _then;

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? dailyPerformance = null,
    Object? trip = null,
  }) {
    return _then(_HomeDashboardModel(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateModel,
      dailyPerformance: null == dailyPerformance
          ? _self.dailyPerformance
          : dailyPerformance // ignore: cast_nullable_to_non_nullable
              as DailyPerformanceModel,
      trip: null == trip
          ? _self.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as HomeTripModel,
    ));
  }

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DateModelCopyWith<$Res> get date {
    return $DateModelCopyWith<$Res>(_self.date, (value) {
      return _then(_self.copyWith(date: value));
    });
  }

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyPerformanceModelCopyWith<$Res> get dailyPerformance {
    return $DailyPerformanceModelCopyWith<$Res>(_self.dailyPerformance,
        (value) {
      return _then(_self.copyWith(dailyPerformance: value));
    });
  }

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeTripModelCopyWith<$Res> get trip {
    return $HomeTripModelCopyWith<$Res>(_self.trip, (value) {
      return _then(_self.copyWith(trip: value));
    });
  }
}

/// @nodoc
mixin _$DateModel {
  String get today;
  String get formattedDate;

  /// Create a copy of DateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DateModelCopyWith<DateModel> get copyWith =>
      _$DateModelCopyWithImpl<DateModel>(this as DateModel, _$identity);

  /// Serializes this DateModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DateModel &&
            (identical(other.today, today) || other.today == today) &&
            (identical(other.formattedDate, formattedDate) ||
                other.formattedDate == formattedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, today, formattedDate);

  @override
  String toString() {
    return 'DateModel(today: $today, formattedDate: $formattedDate)';
  }
}

/// @nodoc
abstract mixin class $DateModelCopyWith<$Res> {
  factory $DateModelCopyWith(DateModel value, $Res Function(DateModel) _then) =
      _$DateModelCopyWithImpl;
  @useResult
  $Res call({String today, String formattedDate});
}

/// @nodoc
class _$DateModelCopyWithImpl<$Res> implements $DateModelCopyWith<$Res> {
  _$DateModelCopyWithImpl(this._self, this._then);

  final DateModel _self;
  final $Res Function(DateModel) _then;

  /// Create a copy of DateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = null,
    Object? formattedDate = null,
  }) {
    return _then(_self.copyWith(
      today: null == today
          ? _self.today
          : today // ignore: cast_nullable_to_non_nullable
              as String,
      formattedDate: null == formattedDate
          ? _self.formattedDate
          : formattedDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [DateModel].
extension DateModelPatterns on DateModel {
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
    TResult Function(_DateModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DateModel() when $default != null:
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
    TResult Function(_DateModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DateModel():
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
    TResult? Function(_DateModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DateModel() when $default != null:
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
    TResult Function(String today, String formattedDate)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DateModel() when $default != null:
        return $default(_that.today, _that.formattedDate);
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
    TResult Function(String today, String formattedDate) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DateModel():
        return $default(_that.today, _that.formattedDate);
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
    TResult? Function(String today, String formattedDate)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DateModel() when $default != null:
        return $default(_that.today, _that.formattedDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DateModel implements DateModel {
  const _DateModel({required this.today, required this.formattedDate});
  factory _DateModel.fromJson(Map<String, dynamic> json) =>
      _$DateModelFromJson(json);

  @override
  final String today;
  @override
  final String formattedDate;

  /// Create a copy of DateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DateModelCopyWith<_DateModel> get copyWith =>
      __$DateModelCopyWithImpl<_DateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DateModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DateModel &&
            (identical(other.today, today) || other.today == today) &&
            (identical(other.formattedDate, formattedDate) ||
                other.formattedDate == formattedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, today, formattedDate);

  @override
  String toString() {
    return 'DateModel(today: $today, formattedDate: $formattedDate)';
  }
}

/// @nodoc
abstract mixin class _$DateModelCopyWith<$Res>
    implements $DateModelCopyWith<$Res> {
  factory _$DateModelCopyWith(
          _DateModel value, $Res Function(_DateModel) _then) =
      __$DateModelCopyWithImpl;
  @override
  @useResult
  $Res call({String today, String formattedDate});
}

/// @nodoc
class __$DateModelCopyWithImpl<$Res> implements _$DateModelCopyWith<$Res> {
  __$DateModelCopyWithImpl(this._self, this._then);

  final _DateModel _self;
  final $Res Function(_DateModel) _then;

  /// Create a copy of DateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? today = null,
    Object? formattedDate = null,
  }) {
    return _then(_DateModel(
      today: null == today
          ? _self.today
          : today // ignore: cast_nullable_to_non_nullable
              as String,
      formattedDate: null == formattedDate
          ? _self.formattedDate
          : formattedDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
