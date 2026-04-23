// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VisitModel {
  String get name;
  String get customerId;
  String get customerName;
  String get customerPhone;
  String? get location;
  String get visitDate;
  RouteStopStatus get status;
  String? get checkInTime;
  String? get checkOutTime;
  double? get duration;
  String? get remark;

  /// Create a copy of VisitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VisitModelCopyWith<VisitModel> get copyWith =>
      _$VisitModelCopyWithImpl<VisitModel>(this as VisitModel, _$identity);

  /// Serializes this VisitModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VisitModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.visitDate, visitDate) ||
                other.visitDate == visitDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.checkInTime, checkInTime) ||
                other.checkInTime == checkInTime) &&
            (identical(other.checkOutTime, checkOutTime) ||
                other.checkOutTime == checkOutTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.remark, remark) || other.remark == remark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      customerId,
      customerName,
      customerPhone,
      location,
      visitDate,
      status,
      checkInTime,
      checkOutTime,
      duration,
      remark);

  @override
  String toString() {
    return 'VisitModel(name: $name, customerId: $customerId, customerName: $customerName, customerPhone: $customerPhone, location: $location, visitDate: $visitDate, status: $status, checkInTime: $checkInTime, checkOutTime: $checkOutTime, duration: $duration, remark: $remark)';
  }
}

/// @nodoc
abstract mixin class $VisitModelCopyWith<$Res> {
  factory $VisitModelCopyWith(
          VisitModel value, $Res Function(VisitModel) _then) =
      _$VisitModelCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String customerId,
      String customerName,
      String customerPhone,
      String? location,
      String visitDate,
      RouteStopStatus status,
      String? checkInTime,
      String? checkOutTime,
      double? duration,
      String? remark});
}

/// @nodoc
class _$VisitModelCopyWithImpl<$Res> implements $VisitModelCopyWith<$Res> {
  _$VisitModelCopyWithImpl(this._self, this._then);

  final VisitModel _self;
  final $Res Function(VisitModel) _then;

  /// Create a copy of VisitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? customerPhone = null,
    Object? location = freezed,
    Object? visitDate = null,
    Object? status = null,
    Object? checkInTime = freezed,
    Object? checkOutTime = freezed,
    Object? duration = freezed,
    Object? remark = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _self.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      visitDate: null == visitDate
          ? _self.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteStopStatus,
      checkInTime: freezed == checkInTime
          ? _self.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      checkOutTime: freezed == checkOutTime
          ? _self.checkOutTime
          : checkOutTime // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      remark: freezed == remark
          ? _self.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [VisitModel].
extension VisitModelPatterns on VisitModel {
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
    TResult Function(_VisitModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VisitModel() when $default != null:
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
    TResult Function(_VisitModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitModel():
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
    TResult? Function(_VisitModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitModel() when $default != null:
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
            String customerId,
            String customerName,
            String customerPhone,
            String? location,
            String visitDate,
            RouteStopStatus status,
            String? checkInTime,
            String? checkOutTime,
            double? duration,
            String? remark)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VisitModel() when $default != null:
        return $default(
            _that.name,
            _that.customerId,
            _that.customerName,
            _that.customerPhone,
            _that.location,
            _that.visitDate,
            _that.status,
            _that.checkInTime,
            _that.checkOutTime,
            _that.duration,
            _that.remark);
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
            String customerId,
            String customerName,
            String customerPhone,
            String? location,
            String visitDate,
            RouteStopStatus status,
            String? checkInTime,
            String? checkOutTime,
            double? duration,
            String? remark)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitModel():
        return $default(
            _that.name,
            _that.customerId,
            _that.customerName,
            _that.customerPhone,
            _that.location,
            _that.visitDate,
            _that.status,
            _that.checkInTime,
            _that.checkOutTime,
            _that.duration,
            _that.remark);
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
            String customerId,
            String customerName,
            String customerPhone,
            String? location,
            String visitDate,
            RouteStopStatus status,
            String? checkInTime,
            String? checkOutTime,
            double? duration,
            String? remark)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitModel() when $default != null:
        return $default(
            _that.name,
            _that.customerId,
            _that.customerName,
            _that.customerPhone,
            _that.location,
            _that.visitDate,
            _that.status,
            _that.checkInTime,
            _that.checkOutTime,
            _that.duration,
            _that.remark);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VisitModel implements VisitModel {
  const _VisitModel(
      {required this.name,
      required this.customerId,
      required this.customerName,
      required this.customerPhone,
      required this.location,
      required this.visitDate,
      required this.status,
      this.checkInTime,
      this.checkOutTime,
      this.duration,
      this.remark});
  factory _VisitModel.fromJson(Map<String, dynamic> json) =>
      _$VisitModelFromJson(json);

  @override
  final String name;
  @override
  final String customerId;
  @override
  final String customerName;
  @override
  final String customerPhone;
  @override
  final String? location;
  @override
  final String visitDate;
  @override
  final RouteStopStatus status;
  @override
  final String? checkInTime;
  @override
  final String? checkOutTime;
  @override
  final double? duration;
  @override
  final String? remark;

  /// Create a copy of VisitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VisitModelCopyWith<_VisitModel> get copyWith =>
      __$VisitModelCopyWithImpl<_VisitModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VisitModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VisitModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.visitDate, visitDate) ||
                other.visitDate == visitDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.checkInTime, checkInTime) ||
                other.checkInTime == checkInTime) &&
            (identical(other.checkOutTime, checkOutTime) ||
                other.checkOutTime == checkOutTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.remark, remark) || other.remark == remark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      customerId,
      customerName,
      customerPhone,
      location,
      visitDate,
      status,
      checkInTime,
      checkOutTime,
      duration,
      remark);

  @override
  String toString() {
    return 'VisitModel(name: $name, customerId: $customerId, customerName: $customerName, customerPhone: $customerPhone, location: $location, visitDate: $visitDate, status: $status, checkInTime: $checkInTime, checkOutTime: $checkOutTime, duration: $duration, remark: $remark)';
  }
}

/// @nodoc
abstract mixin class _$VisitModelCopyWith<$Res>
    implements $VisitModelCopyWith<$Res> {
  factory _$VisitModelCopyWith(
          _VisitModel value, $Res Function(_VisitModel) _then) =
      __$VisitModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String customerId,
      String customerName,
      String customerPhone,
      String? location,
      String visitDate,
      RouteStopStatus status,
      String? checkInTime,
      String? checkOutTime,
      double? duration,
      String? remark});
}

/// @nodoc
class __$VisitModelCopyWithImpl<$Res> implements _$VisitModelCopyWith<$Res> {
  __$VisitModelCopyWithImpl(this._self, this._then);

  final _VisitModel _self;
  final $Res Function(_VisitModel) _then;

  /// Create a copy of VisitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? customerPhone = null,
    Object? location = freezed,
    Object? visitDate = null,
    Object? status = null,
    Object? checkInTime = freezed,
    Object? checkOutTime = freezed,
    Object? duration = freezed,
    Object? remark = freezed,
  }) {
    return _then(_VisitModel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _self.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      visitDate: null == visitDate
          ? _self.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteStopStatus,
      checkInTime: freezed == checkInTime
          ? _self.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      checkOutTime: freezed == checkOutTime
          ? _self.checkOutTime
          : checkOutTime // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      remark: freezed == remark
          ? _self.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
