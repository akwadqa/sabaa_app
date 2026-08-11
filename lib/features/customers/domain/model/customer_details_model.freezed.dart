// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerDetailsModel {
  String get customerId;
  String get name;
  String? get phone;
  String get status;
  bool get isActive;
  num get outstandingBalance;
  num get totalSales;
  String? get location;
  List<CreditNoteModel> get creditNotes;

  /// Create a copy of CustomerDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerDetailsModelCopyWith<CustomerDetailsModel> get copyWith =>
      _$CustomerDetailsModelCopyWithImpl<CustomerDetailsModel>(
          this as CustomerDetailsModel, _$identity);

  /// Serializes this CustomerDetailsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerDetailsModel &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.outstandingBalance, outstandingBalance) ||
                other.outstandingBalance == outstandingBalance) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other.creditNotes, creditNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerId,
      name,
      phone,
      status,
      isActive,
      outstandingBalance,
      totalSales,
      location,
      const DeepCollectionEquality().hash(creditNotes));

  @override
  String toString() {
    return 'CustomerDetailsModel(customerId: $customerId, name: $name, phone: $phone, status: $status, isActive: $isActive, outstandingBalance: $outstandingBalance, totalSales: $totalSales, location: $location, creditNotes: $creditNotes)';
  }
}

/// @nodoc
abstract mixin class $CustomerDetailsModelCopyWith<$Res> {
  factory $CustomerDetailsModelCopyWith(CustomerDetailsModel value,
          $Res Function(CustomerDetailsModel) _then) =
      _$CustomerDetailsModelCopyWithImpl;
  @useResult
  $Res call(
      {String customerId,
      String name,
      String? phone,
      String status,
      bool isActive,
      num outstandingBalance,
      num totalSales,
      String? location,
      List<CreditNoteModel> creditNotes});
}

/// @nodoc
class _$CustomerDetailsModelCopyWithImpl<$Res>
    implements $CustomerDetailsModelCopyWith<$Res> {
  _$CustomerDetailsModelCopyWithImpl(this._self, this._then);

  final CustomerDetailsModel _self;
  final $Res Function(CustomerDetailsModel) _then;

  /// Create a copy of CustomerDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? name = null,
    Object? phone = freezed,
    Object? status = null,
    Object? isActive = null,
    Object? outstandingBalance = null,
    Object? totalSales = null,
    Object? location = freezed,
    Object? creditNotes = null,
  }) {
    return _then(_self.copyWith(
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      outstandingBalance: null == outstandingBalance
          ? _self.outstandingBalance
          : outstandingBalance // ignore: cast_nullable_to_non_nullable
              as num,
      totalSales: null == totalSales
          ? _self.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as num,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      creditNotes: null == creditNotes
          ? _self.creditNotes
          : creditNotes // ignore: cast_nullable_to_non_nullable
              as List<CreditNoteModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomerDetailsModel].
extension CustomerDetailsModelPatterns on CustomerDetailsModel {
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
    TResult Function(_CustomerDetailsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerDetailsModel() when $default != null:
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
    TResult Function(_CustomerDetailsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerDetailsModel():
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
    TResult? Function(_CustomerDetailsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerDetailsModel() when $default != null:
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
            String customerId,
            String name,
            String? phone,
            String status,
            bool isActive,
            num outstandingBalance,
            num totalSales,
            String? location,
            List<CreditNoteModel> creditNotes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerDetailsModel() when $default != null:
        return $default(
            _that.customerId,
            _that.name,
            _that.phone,
            _that.status,
            _that.isActive,
            _that.outstandingBalance,
            _that.totalSales,
            _that.location,
            _that.creditNotes);
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
            String customerId,
            String name,
            String? phone,
            String status,
            bool isActive,
            num outstandingBalance,
            num totalSales,
            String? location,
            List<CreditNoteModel> creditNotes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerDetailsModel():
        return $default(
            _that.customerId,
            _that.name,
            _that.phone,
            _that.status,
            _that.isActive,
            _that.outstandingBalance,
            _that.totalSales,
            _that.location,
            _that.creditNotes);
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
            String customerId,
            String name,
            String? phone,
            String status,
            bool isActive,
            num outstandingBalance,
            num totalSales,
            String? location,
            List<CreditNoteModel> creditNotes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerDetailsModel() when $default != null:
        return $default(
            _that.customerId,
            _that.name,
            _that.phone,
            _that.status,
            _that.isActive,
            _that.outstandingBalance,
            _that.totalSales,
            _that.location,
            _that.creditNotes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerDetailsModel implements CustomerDetailsModel {
  const _CustomerDetailsModel(
      {required this.customerId,
      required this.name,
      this.phone,
      required this.status,
      required this.isActive,
      required this.outstandingBalance,
      required this.totalSales,
      this.location,
      final List<CreditNoteModel> creditNotes = const []})
      : _creditNotes = creditNotes;
  factory _CustomerDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailsModelFromJson(json);

  @override
  final String customerId;
  @override
  final String name;
  @override
  final String? phone;
  @override
  final String status;
  @override
  final bool isActive;
  @override
  final num outstandingBalance;
  @override
  final num totalSales;
  @override
  final String? location;
  final List<CreditNoteModel> _creditNotes;
  @override
  @JsonKey()
  List<CreditNoteModel> get creditNotes {
    if (_creditNotes is EqualUnmodifiableListView) return _creditNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_creditNotes);
  }

  /// Create a copy of CustomerDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerDetailsModelCopyWith<_CustomerDetailsModel> get copyWith =>
      __$CustomerDetailsModelCopyWithImpl<_CustomerDetailsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerDetailsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerDetailsModel &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.outstandingBalance, outstandingBalance) ||
                other.outstandingBalance == outstandingBalance) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other._creditNotes, _creditNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerId,
      name,
      phone,
      status,
      isActive,
      outstandingBalance,
      totalSales,
      location,
      const DeepCollectionEquality().hash(_creditNotes));

  @override
  String toString() {
    return 'CustomerDetailsModel(customerId: $customerId, name: $name, phone: $phone, status: $status, isActive: $isActive, outstandingBalance: $outstandingBalance, totalSales: $totalSales, location: $location, creditNotes: $creditNotes)';
  }
}

/// @nodoc
abstract mixin class _$CustomerDetailsModelCopyWith<$Res>
    implements $CustomerDetailsModelCopyWith<$Res> {
  factory _$CustomerDetailsModelCopyWith(_CustomerDetailsModel value,
          $Res Function(_CustomerDetailsModel) _then) =
      __$CustomerDetailsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String customerId,
      String name,
      String? phone,
      String status,
      bool isActive,
      num outstandingBalance,
      num totalSales,
      String? location,
      List<CreditNoteModel> creditNotes});
}

/// @nodoc
class __$CustomerDetailsModelCopyWithImpl<$Res>
    implements _$CustomerDetailsModelCopyWith<$Res> {
  __$CustomerDetailsModelCopyWithImpl(this._self, this._then);

  final _CustomerDetailsModel _self;
  final $Res Function(_CustomerDetailsModel) _then;

  /// Create a copy of CustomerDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? customerId = null,
    Object? name = null,
    Object? phone = freezed,
    Object? status = null,
    Object? isActive = null,
    Object? outstandingBalance = null,
    Object? totalSales = null,
    Object? location = freezed,
    Object? creditNotes = null,
  }) {
    return _then(_CustomerDetailsModel(
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      outstandingBalance: null == outstandingBalance
          ? _self.outstandingBalance
          : outstandingBalance // ignore: cast_nullable_to_non_nullable
              as num,
      totalSales: null == totalSales
          ? _self.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as num,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      creditNotes: null == creditNotes
          ? _self._creditNotes
          : creditNotes // ignore: cast_nullable_to_non_nullable
              as List<CreditNoteModel>,
    ));
  }
}

// dart format on
