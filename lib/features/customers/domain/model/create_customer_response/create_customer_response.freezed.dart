// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_customer_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerModel {
  String? get customerId;
  String? get name;
  String? get address;
  String? get phone;
  String? get status;
  bool? get isActive;
  num get outstandingBalance;
  num get totalSales;

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerModelCopyWith<CustomerModel> get copyWith =>
      _$CustomerModelCopyWithImpl<CustomerModel>(
          this as CustomerModel, _$identity);

  /// Serializes this CustomerModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerModel &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.outstandingBalance, outstandingBalance) ||
                other.outstandingBalance == outstandingBalance) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customerId, name, address, phone,
      status, isActive, outstandingBalance, totalSales);

  @override
  String toString() {
    return 'CustomerModel(customerId: $customerId, name: $name, address: $address, phone: $phone, status: $status, isActive: $isActive, outstandingBalance: $outstandingBalance, totalSales: $totalSales)';
  }
}

/// @nodoc
abstract mixin class $CustomerModelCopyWith<$Res> {
  factory $CustomerModelCopyWith(
          CustomerModel value, $Res Function(CustomerModel) _then) =
      _$CustomerModelCopyWithImpl;
  @useResult
  $Res call(
      {String? customerId,
      String? name,
      String? address,
      String? phone,
      String? status,
      bool? isActive,
      num outstandingBalance,
      num totalSales});
}

/// @nodoc
class _$CustomerModelCopyWithImpl<$Res>
    implements $CustomerModelCopyWith<$Res> {
  _$CustomerModelCopyWithImpl(this._self, this._then);

  final CustomerModel _self;
  final $Res Function(CustomerModel) _then;

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? status = freezed,
    Object? isActive = freezed,
    Object? outstandingBalance = null,
    Object? totalSales = null,
  }) {
    return _then(_self.copyWith(
      customerId: freezed == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      outstandingBalance: null == outstandingBalance
          ? _self.outstandingBalance
          : outstandingBalance // ignore: cast_nullable_to_non_nullable
              as num,
      totalSales: null == totalSales
          ? _self.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomerModel].
extension CustomerModelPatterns on CustomerModel {
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
    TResult Function(_CustomerModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerModel() when $default != null:
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
    TResult Function(_CustomerModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerModel():
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
    TResult? Function(_CustomerModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerModel() when $default != null:
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
            String? customerId,
            String? name,
            String? address,
            String? phone,
            String? status,
            bool? isActive,
            num outstandingBalance,
            num totalSales)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerModel() when $default != null:
        return $default(
            _that.customerId,
            _that.name,
            _that.address,
            _that.phone,
            _that.status,
            _that.isActive,
            _that.outstandingBalance,
            _that.totalSales);
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
            String? customerId,
            String? name,
            String? address,
            String? phone,
            String? status,
            bool? isActive,
            num outstandingBalance,
            num totalSales)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerModel():
        return $default(
            _that.customerId,
            _that.name,
            _that.address,
            _that.phone,
            _that.status,
            _that.isActive,
            _that.outstandingBalance,
            _that.totalSales);
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
            String? customerId,
            String? name,
            String? address,
            String? phone,
            String? status,
            bool? isActive,
            num outstandingBalance,
            num totalSales)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerModel() when $default != null:
        return $default(
            _that.customerId,
            _that.name,
            _that.address,
            _that.phone,
            _that.status,
            _that.isActive,
            _that.outstandingBalance,
            _that.totalSales);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerModel implements CustomerModel {
  const _CustomerModel(
      {this.customerId,
      this.name,
      this.address,
      this.phone,
      this.status,
      this.isActive,
      this.outstandingBalance = 0,
      this.totalSales = 0});
  factory _CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  @override
  final String? customerId;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? phone;
  @override
  final String? status;
  @override
  final bool? isActive;
  @override
  @JsonKey()
  final num outstandingBalance;
  @override
  @JsonKey()
  final num totalSales;

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerModelCopyWith<_CustomerModel> get copyWith =>
      __$CustomerModelCopyWithImpl<_CustomerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerModel &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.outstandingBalance, outstandingBalance) ||
                other.outstandingBalance == outstandingBalance) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customerId, name, address, phone,
      status, isActive, outstandingBalance, totalSales);

  @override
  String toString() {
    return 'CustomerModel(customerId: $customerId, name: $name, address: $address, phone: $phone, status: $status, isActive: $isActive, outstandingBalance: $outstandingBalance, totalSales: $totalSales)';
  }
}

/// @nodoc
abstract mixin class _$CustomerModelCopyWith<$Res>
    implements $CustomerModelCopyWith<$Res> {
  factory _$CustomerModelCopyWith(
          _CustomerModel value, $Res Function(_CustomerModel) _then) =
      __$CustomerModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? customerId,
      String? name,
      String? address,
      String? phone,
      String? status,
      bool? isActive,
      num outstandingBalance,
      num totalSales});
}

/// @nodoc
class __$CustomerModelCopyWithImpl<$Res>
    implements _$CustomerModelCopyWith<$Res> {
  __$CustomerModelCopyWithImpl(this._self, this._then);

  final _CustomerModel _self;
  final $Res Function(_CustomerModel) _then;

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? customerId = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? status = freezed,
    Object? isActive = freezed,
    Object? outstandingBalance = null,
    Object? totalSales = null,
  }) {
    return _then(_CustomerModel(
      customerId: freezed == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      outstandingBalance: null == outstandingBalance
          ? _self.outstandingBalance
          : outstandingBalance // ignore: cast_nullable_to_non_nullable
              as num,
      totalSales: null == totalSales
          ? _self.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

// dart format on
