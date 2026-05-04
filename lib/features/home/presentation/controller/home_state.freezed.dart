// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeState {
  List<PerformanceMetric> get metrics;
  List<QuickAction> get quickActions;
  String get userName;
  String
      get todayDate; // ── Trip ──────────────────────────────────────────────────────────────
  HomeTripModel? get trip; // null → no trip assigned today
  bool get tripStarted; // true after startTrip succeeds
// ── Async states ──────────────────────────────────────────────────────
  AsyncValue<void>? get pageState; // main load / refresh
  AsyncValue<void>? get tripActionState;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeStateCopyWith<HomeState> get copyWith =>
      _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeState &&
            const DeepCollectionEquality().equals(other.metrics, metrics) &&
            const DeepCollectionEquality()
                .equals(other.quickActions, quickActions) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.todayDate, todayDate) ||
                other.todayDate == todayDate) &&
            (identical(other.trip, trip) || other.trip == trip) &&
            (identical(other.tripStarted, tripStarted) ||
                other.tripStarted == tripStarted) &&
            (identical(other.pageState, pageState) ||
                other.pageState == pageState) &&
            (identical(other.tripActionState, tripActionState) ||
                other.tripActionState == tripActionState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(metrics),
      const DeepCollectionEquality().hash(quickActions),
      userName,
      todayDate,
      trip,
      tripStarted,
      pageState,
      tripActionState);

  @override
  String toString() {
    return 'HomeState(metrics: $metrics, quickActions: $quickActions, userName: $userName, todayDate: $todayDate, trip: $trip, tripStarted: $tripStarted, pageState: $pageState, tripActionState: $tripActionState)';
  }
}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) =
      _$HomeStateCopyWithImpl;
  @useResult
  $Res call(
      {List<PerformanceMetric> metrics,
      List<QuickAction> quickActions,
      String userName,
      String todayDate,
      HomeTripModel? trip,
      bool tripStarted,
      AsyncValue<void>? pageState,
      AsyncValue<void>? tripActionState});

  $HomeTripModelCopyWith<$Res>? get trip;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metrics = null,
    Object? quickActions = null,
    Object? userName = null,
    Object? todayDate = null,
    Object? trip = freezed,
    Object? tripStarted = null,
    Object? pageState = freezed,
    Object? tripActionState = freezed,
  }) {
    return _then(_self.copyWith(
      metrics: null == metrics
          ? _self.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as List<PerformanceMetric>,
      quickActions: null == quickActions
          ? _self.quickActions
          : quickActions // ignore: cast_nullable_to_non_nullable
              as List<QuickAction>,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      todayDate: null == todayDate
          ? _self.todayDate
          : todayDate // ignore: cast_nullable_to_non_nullable
              as String,
      trip: freezed == trip
          ? _self.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as HomeTripModel?,
      tripStarted: null == tripStarted
          ? _self.tripStarted
          : tripStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      pageState: freezed == pageState
          ? _self.pageState
          : pageState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>?,
      tripActionState: freezed == tripActionState
          ? _self.tripActionState
          : tripActionState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>?,
    ));
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeTripModelCopyWith<$Res>? get trip {
    if (_self.trip == null) {
      return null;
    }

    return $HomeTripModelCopyWith<$Res>(_self.trip!, (value) {
      return _then(_self.copyWith(trip: value));
    });
  }
}

/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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
    TResult Function(_HomeState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeState() when $default != null:
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
    TResult Function(_HomeState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeState():
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
    TResult? Function(_HomeState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeState() when $default != null:
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
            List<PerformanceMetric> metrics,
            List<QuickAction> quickActions,
            String userName,
            String todayDate,
            HomeTripModel? trip,
            bool tripStarted,
            AsyncValue<void>? pageState,
            AsyncValue<void>? tripActionState)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeState() when $default != null:
        return $default(
            _that.metrics,
            _that.quickActions,
            _that.userName,
            _that.todayDate,
            _that.trip,
            _that.tripStarted,
            _that.pageState,
            _that.tripActionState);
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
            List<PerformanceMetric> metrics,
            List<QuickAction> quickActions,
            String userName,
            String todayDate,
            HomeTripModel? trip,
            bool tripStarted,
            AsyncValue<void>? pageState,
            AsyncValue<void>? tripActionState)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeState():
        return $default(
            _that.metrics,
            _that.quickActions,
            _that.userName,
            _that.todayDate,
            _that.trip,
            _that.tripStarted,
            _that.pageState,
            _that.tripActionState);
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
            List<PerformanceMetric> metrics,
            List<QuickAction> quickActions,
            String userName,
            String todayDate,
            HomeTripModel? trip,
            bool tripStarted,
            AsyncValue<void>? pageState,
            AsyncValue<void>? tripActionState)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeState() when $default != null:
        return $default(
            _that.metrics,
            _that.quickActions,
            _that.userName,
            _that.todayDate,
            _that.trip,
            _that.tripStarted,
            _that.pageState,
            _that.tripActionState);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HomeState implements HomeState {
  const _HomeState(
      {final List<PerformanceMetric> metrics = const [],
      final List<QuickAction> quickActions = const [],
      this.userName = '',
      this.todayDate = '',
      this.trip,
      this.tripStarted = false,
      this.pageState,
      this.tripActionState})
      : _metrics = metrics,
        _quickActions = quickActions;

  final List<PerformanceMetric> _metrics;
  @override
  @JsonKey()
  List<PerformanceMetric> get metrics {
    if (_metrics is EqualUnmodifiableListView) return _metrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_metrics);
  }

  final List<QuickAction> _quickActions;
  @override
  @JsonKey()
  List<QuickAction> get quickActions {
    if (_quickActions is EqualUnmodifiableListView) return _quickActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quickActions);
  }

  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String todayDate;
// ── Trip ──────────────────────────────────────────────────────────────
  @override
  final HomeTripModel? trip;
// null → no trip assigned today
  @override
  @JsonKey()
  final bool tripStarted;
// true after startTrip succeeds
// ── Async states ──────────────────────────────────────────────────────
  @override
  final AsyncValue<void>? pageState;
// main load / refresh
  @override
  final AsyncValue<void>? tripActionState;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            const DeepCollectionEquality().equals(other._metrics, _metrics) &&
            const DeepCollectionEquality()
                .equals(other._quickActions, _quickActions) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.todayDate, todayDate) ||
                other.todayDate == todayDate) &&
            (identical(other.trip, trip) || other.trip == trip) &&
            (identical(other.tripStarted, tripStarted) ||
                other.tripStarted == tripStarted) &&
            (identical(other.pageState, pageState) ||
                other.pageState == pageState) &&
            (identical(other.tripActionState, tripActionState) ||
                other.tripActionState == tripActionState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_metrics),
      const DeepCollectionEquality().hash(_quickActions),
      userName,
      todayDate,
      trip,
      tripStarted,
      pageState,
      tripActionState);

  @override
  String toString() {
    return 'HomeState(metrics: $metrics, quickActions: $quickActions, userName: $userName, todayDate: $todayDate, trip: $trip, tripStarted: $tripStarted, pageState: $pageState, tripActionState: $tripActionState)';
  }
}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) _then) =
      __$HomeStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<PerformanceMetric> metrics,
      List<QuickAction> quickActions,
      String userName,
      String todayDate,
      HomeTripModel? trip,
      bool tripStarted,
      AsyncValue<void>? pageState,
      AsyncValue<void>? tripActionState});

  @override
  $HomeTripModelCopyWith<$Res>? get trip;
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? metrics = null,
    Object? quickActions = null,
    Object? userName = null,
    Object? todayDate = null,
    Object? trip = freezed,
    Object? tripStarted = null,
    Object? pageState = freezed,
    Object? tripActionState = freezed,
  }) {
    return _then(_HomeState(
      metrics: null == metrics
          ? _self._metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as List<PerformanceMetric>,
      quickActions: null == quickActions
          ? _self._quickActions
          : quickActions // ignore: cast_nullable_to_non_nullable
              as List<QuickAction>,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      todayDate: null == todayDate
          ? _self.todayDate
          : todayDate // ignore: cast_nullable_to_non_nullable
              as String,
      trip: freezed == trip
          ? _self.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as HomeTripModel?,
      tripStarted: null == tripStarted
          ? _self.tripStarted
          : tripStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      pageState: freezed == pageState
          ? _self.pageState
          : pageState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>?,
      tripActionState: freezed == tripActionState
          ? _self.tripActionState
          : tripActionState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>?,
    ));
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeTripModelCopyWith<$Res>? get trip {
    if (_self.trip == null) {
      return null;
    }

    return $HomeTripModelCopyWith<$Res>(_self.trip!, (value) {
      return _then(_self.copyWith(trip: value));
    });
  }
}

// dart format on
