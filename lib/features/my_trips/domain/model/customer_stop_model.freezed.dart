// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_stop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerStopModel {
  String get customerId;
  String get customerName;

  /// Create a copy of CustomerStopModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerStopModelCopyWith<CustomerStopModel> get copyWith =>
      _$CustomerStopModelCopyWithImpl<CustomerStopModel>(
          this as CustomerStopModel, _$identity);

  /// Serializes this CustomerStopModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerStopModel &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customerId, customerName);

  @override
  String toString() {
    return 'CustomerStopModel(customerId: $customerId, customerName: $customerName)';
  }
}

/// @nodoc
abstract mixin class $CustomerStopModelCopyWith<$Res> {
  factory $CustomerStopModelCopyWith(
          CustomerStopModel value, $Res Function(CustomerStopModel) _then) =
      _$CustomerStopModelCopyWithImpl;
  @useResult
  $Res call({String customerId, String customerName});
}

/// @nodoc
class _$CustomerStopModelCopyWithImpl<$Res>
    implements $CustomerStopModelCopyWith<$Res> {
  _$CustomerStopModelCopyWithImpl(this._self, this._then);

  final CustomerStopModel _self;
  final $Res Function(CustomerStopModel) _then;

  /// Create a copy of CustomerStopModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? customerName = null,
  }) {
    return _then(_self.copyWith(
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomerStopModel].
extension CustomerStopModelPatterns on CustomerStopModel {
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
    TResult Function(_CustomerStopModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerStopModel() when $default != null:
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
    TResult Function(_CustomerStopModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerStopModel():
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
    TResult? Function(_CustomerStopModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerStopModel() when $default != null:
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
    TResult Function(String customerId, String customerName)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerStopModel() when $default != null:
        return $default(_that.customerId, _that.customerName);
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
    TResult Function(String customerId, String customerName) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerStopModel():
        return $default(_that.customerId, _that.customerName);
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
    TResult? Function(String customerId, String customerName)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerStopModel() when $default != null:
        return $default(_that.customerId, _that.customerName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerStopModel implements CustomerStopModel {
  const _CustomerStopModel(
      {required this.customerId, required this.customerName});
  factory _CustomerStopModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerStopModelFromJson(json);

  @override
  final String customerId;
  @override
  final String customerName;

  /// Create a copy of CustomerStopModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerStopModelCopyWith<_CustomerStopModel> get copyWith =>
      __$CustomerStopModelCopyWithImpl<_CustomerStopModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerStopModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerStopModel &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customerId, customerName);

  @override
  String toString() {
    return 'CustomerStopModel(customerId: $customerId, customerName: $customerName)';
  }
}

/// @nodoc
abstract mixin class _$CustomerStopModelCopyWith<$Res>
    implements $CustomerStopModelCopyWith<$Res> {
  factory _$CustomerStopModelCopyWith(
          _CustomerStopModel value, $Res Function(_CustomerStopModel) _then) =
      __$CustomerStopModelCopyWithImpl;
  @override
  @useResult
  $Res call({String customerId, String customerName});
}

/// @nodoc
class __$CustomerStopModelCopyWithImpl<$Res>
    implements _$CustomerStopModelCopyWith<$Res> {
  __$CustomerStopModelCopyWithImpl(this._self, this._then);

  final _CustomerStopModel _self;
  final $Res Function(_CustomerStopModel) _then;

  /// Create a copy of CustomerStopModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? customerId = null,
    Object? customerName = null,
  }) {
    return _then(_CustomerStopModel(
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
