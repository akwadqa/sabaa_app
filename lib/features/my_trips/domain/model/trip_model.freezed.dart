// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TripModel {
  String get name;
  String get tripDate;
  String get tripType;
  String get status;
  String get salesPerson;
  String get warehouse;
  VisitSummaryModel get visitSummary;
  List<CustomerStopModel> get customerStops;
  List<VisitModel> get visits;
  String? get vehicle;
  String? get startTime;
  String? get endTime;
  double? get duration;

  /// Create a copy of TripModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripModelCopyWith<TripModel> get copyWith =>
      _$TripModelCopyWithImpl<TripModel>(this as TripModel, _$identity);

  /// Serializes this TripModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tripDate, tripDate) ||
                other.tripDate == tripDate) &&
            (identical(other.tripType, tripType) ||
                other.tripType == tripType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.salesPerson, salesPerson) ||
                other.salesPerson == salesPerson) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.visitSummary, visitSummary) ||
                other.visitSummary == visitSummary) &&
            const DeepCollectionEquality()
                .equals(other.customerStops, customerStops) &&
            const DeepCollectionEquality().equals(other.visits, visits) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      tripDate,
      tripType,
      status,
      salesPerson,
      warehouse,
      visitSummary,
      const DeepCollectionEquality().hash(customerStops),
      const DeepCollectionEquality().hash(visits),
      vehicle,
      startTime,
      endTime,
      duration);

  @override
  String toString() {
    return 'TripModel(name: $name, tripDate: $tripDate, tripType: $tripType, status: $status, salesPerson: $salesPerson, warehouse: $warehouse, visitSummary: $visitSummary, customerStops: $customerStops, visits: $visits, vehicle: $vehicle, startTime: $startTime, endTime: $endTime, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $TripModelCopyWith<$Res> {
  factory $TripModelCopyWith(TripModel value, $Res Function(TripModel) _then) =
      _$TripModelCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String tripDate,
      String tripType,
      String status,
      String salesPerson,
      String warehouse,
      VisitSummaryModel visitSummary,
      List<CustomerStopModel> customerStops,
      List<VisitModel> visits,
      String? vehicle,
      String? startTime,
      String? endTime,
      double? duration});

  $VisitSummaryModelCopyWith<$Res> get visitSummary;
}

/// @nodoc
class _$TripModelCopyWithImpl<$Res> implements $TripModelCopyWith<$Res> {
  _$TripModelCopyWithImpl(this._self, this._then);

  final TripModel _self;
  final $Res Function(TripModel) _then;

  /// Create a copy of TripModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? tripDate = null,
    Object? tripType = null,
    Object? status = null,
    Object? salesPerson = null,
    Object? warehouse = null,
    Object? visitSummary = null,
    Object? customerStops = null,
    Object? visits = null,
    Object? vehicle = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? duration = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tripDate: null == tripDate
          ? _self.tripDate
          : tripDate // ignore: cast_nullable_to_non_nullable
              as String,
      tripType: null == tripType
          ? _self.tripType
          : tripType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      salesPerson: null == salesPerson
          ? _self.salesPerson
          : salesPerson // ignore: cast_nullable_to_non_nullable
              as String,
      warehouse: null == warehouse
          ? _self.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String,
      visitSummary: null == visitSummary
          ? _self.visitSummary
          : visitSummary // ignore: cast_nullable_to_non_nullable
              as VisitSummaryModel,
      customerStops: null == customerStops
          ? _self.customerStops
          : customerStops // ignore: cast_nullable_to_non_nullable
              as List<CustomerStopModel>,
      visits: null == visits
          ? _self.visits
          : visits // ignore: cast_nullable_to_non_nullable
              as List<VisitModel>,
      vehicle: freezed == vehicle
          ? _self.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of TripModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VisitSummaryModelCopyWith<$Res> get visitSummary {
    return $VisitSummaryModelCopyWith<$Res>(_self.visitSummary, (value) {
      return _then(_self.copyWith(visitSummary: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TripModel].
extension TripModelPatterns on TripModel {
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
    TResult Function(_TripModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripModel() when $default != null:
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
    TResult Function(_TripModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripModel():
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
    TResult? Function(_TripModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripModel() when $default != null:
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
            String name,
            String tripDate,
            String tripType,
            String status,
            String salesPerson,
            String warehouse,
            VisitSummaryModel visitSummary,
            List<CustomerStopModel> customerStops,
            List<VisitModel> visits,
            String? vehicle,
            String? startTime,
            String? endTime,
            double? duration)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripModel() when $default != null:
        return $default(
            _that.name,
            _that.tripDate,
            _that.tripType,
            _that.status,
            _that.salesPerson,
            _that.warehouse,
            _that.visitSummary,
            _that.customerStops,
            _that.visits,
            _that.vehicle,
            _that.startTime,
            _that.endTime,
            _that.duration);
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
            String name,
            String tripDate,
            String tripType,
            String status,
            String salesPerson,
            String warehouse,
            VisitSummaryModel visitSummary,
            List<CustomerStopModel> customerStops,
            List<VisitModel> visits,
            String? vehicle,
            String? startTime,
            String? endTime,
            double? duration)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripModel():
        return $default(
            _that.name,
            _that.tripDate,
            _that.tripType,
            _that.status,
            _that.salesPerson,
            _that.warehouse,
            _that.visitSummary,
            _that.customerStops,
            _that.visits,
            _that.vehicle,
            _that.startTime,
            _that.endTime,
            _that.duration);
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
            String name,
            String tripDate,
            String tripType,
            String status,
            String salesPerson,
            String warehouse,
            VisitSummaryModel visitSummary,
            List<CustomerStopModel> customerStops,
            List<VisitModel> visits,
            String? vehicle,
            String? startTime,
            String? endTime,
            double? duration)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripModel() when $default != null:
        return $default(
            _that.name,
            _that.tripDate,
            _that.tripType,
            _that.status,
            _that.salesPerson,
            _that.warehouse,
            _that.visitSummary,
            _that.customerStops,
            _that.visits,
            _that.vehicle,
            _that.startTime,
            _that.endTime,
            _that.duration);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TripModel implements TripModel {
  const _TripModel(
      {required this.name,
      required this.tripDate,
      required this.tripType,
      required this.status,
      required this.salesPerson,
      required this.warehouse,
      required this.visitSummary,
      final List<CustomerStopModel> customerStops = const [],
      final List<VisitModel> visits = const [],
      this.vehicle,
      this.startTime,
      this.endTime,
      this.duration})
      : _customerStops = customerStops,
        _visits = visits;
  factory _TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);

  @override
  final String name;
  @override
  final String tripDate;
  @override
  final String tripType;
  @override
  final String status;
  @override
  final String salesPerson;
  @override
  final String warehouse;
  @override
  final VisitSummaryModel visitSummary;
  final List<CustomerStopModel> _customerStops;
  @override
  @JsonKey()
  List<CustomerStopModel> get customerStops {
    if (_customerStops is EqualUnmodifiableListView) return _customerStops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customerStops);
  }

  final List<VisitModel> _visits;
  @override
  @JsonKey()
  List<VisitModel> get visits {
    if (_visits is EqualUnmodifiableListView) return _visits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visits);
  }

  @override
  final String? vehicle;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final double? duration;

  /// Create a copy of TripModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TripModelCopyWith<_TripModel> get copyWith =>
      __$TripModelCopyWithImpl<_TripModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TripModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TripModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tripDate, tripDate) ||
                other.tripDate == tripDate) &&
            (identical(other.tripType, tripType) ||
                other.tripType == tripType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.salesPerson, salesPerson) ||
                other.salesPerson == salesPerson) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.visitSummary, visitSummary) ||
                other.visitSummary == visitSummary) &&
            const DeepCollectionEquality()
                .equals(other._customerStops, _customerStops) &&
            const DeepCollectionEquality().equals(other._visits, _visits) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      tripDate,
      tripType,
      status,
      salesPerson,
      warehouse,
      visitSummary,
      const DeepCollectionEquality().hash(_customerStops),
      const DeepCollectionEquality().hash(_visits),
      vehicle,
      startTime,
      endTime,
      duration);

  @override
  String toString() {
    return 'TripModel(name: $name, tripDate: $tripDate, tripType: $tripType, status: $status, salesPerson: $salesPerson, warehouse: $warehouse, visitSummary: $visitSummary, customerStops: $customerStops, visits: $visits, vehicle: $vehicle, startTime: $startTime, endTime: $endTime, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class _$TripModelCopyWith<$Res>
    implements $TripModelCopyWith<$Res> {
  factory _$TripModelCopyWith(
          _TripModel value, $Res Function(_TripModel) _then) =
      __$TripModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String tripDate,
      String tripType,
      String status,
      String salesPerson,
      String warehouse,
      VisitSummaryModel visitSummary,
      List<CustomerStopModel> customerStops,
      List<VisitModel> visits,
      String? vehicle,
      String? startTime,
      String? endTime,
      double? duration});

  @override
  $VisitSummaryModelCopyWith<$Res> get visitSummary;
}

/// @nodoc
class __$TripModelCopyWithImpl<$Res> implements _$TripModelCopyWith<$Res> {
  __$TripModelCopyWithImpl(this._self, this._then);

  final _TripModel _self;
  final $Res Function(_TripModel) _then;

  /// Create a copy of TripModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? tripDate = null,
    Object? tripType = null,
    Object? status = null,
    Object? salesPerson = null,
    Object? warehouse = null,
    Object? visitSummary = null,
    Object? customerStops = null,
    Object? visits = null,
    Object? vehicle = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? duration = freezed,
  }) {
    return _then(_TripModel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tripDate: null == tripDate
          ? _self.tripDate
          : tripDate // ignore: cast_nullable_to_non_nullable
              as String,
      tripType: null == tripType
          ? _self.tripType
          : tripType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      salesPerson: null == salesPerson
          ? _self.salesPerson
          : salesPerson // ignore: cast_nullable_to_non_nullable
              as String,
      warehouse: null == warehouse
          ? _self.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String,
      visitSummary: null == visitSummary
          ? _self.visitSummary
          : visitSummary // ignore: cast_nullable_to_non_nullable
              as VisitSummaryModel,
      customerStops: null == customerStops
          ? _self._customerStops
          : customerStops // ignore: cast_nullable_to_non_nullable
              as List<CustomerStopModel>,
      visits: null == visits
          ? _self._visits
          : visits // ignore: cast_nullable_to_non_nullable
              as List<VisitModel>,
      vehicle: freezed == vehicle
          ? _self.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of TripModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VisitSummaryModelCopyWith<$Res> get visitSummary {
    return $VisitSummaryModelCopyWith<$Res>(_self.visitSummary, (value) {
      return _then(_self.copyWith(visitSummary: value));
    });
  }
}

// dart format on
