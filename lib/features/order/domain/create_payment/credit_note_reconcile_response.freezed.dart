// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_note_reconcile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreditNoteReconcileResponse {
  String get invoiceId;
  num get outstandingAmount;
  String get status;
  List<CreditNoteAllocation> get allocations;

  /// Create a copy of CreditNoteReconcileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreditNoteReconcileResponseCopyWith<CreditNoteReconcileResponse>
      get copyWith => _$CreditNoteReconcileResponseCopyWithImpl<
              CreditNoteReconcileResponse>(
          this as CreditNoteReconcileResponse, _$identity);

  /// Serializes this CreditNoteReconcileResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreditNoteReconcileResponse &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.outstandingAmount, outstandingAmount) ||
                other.outstandingAmount == outstandingAmount) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.allocations, allocations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, invoiceId, outstandingAmount,
      status, const DeepCollectionEquality().hash(allocations));

  @override
  String toString() {
    return 'CreditNoteReconcileResponse(invoiceId: $invoiceId, outstandingAmount: $outstandingAmount, status: $status, allocations: $allocations)';
  }
}

/// @nodoc
abstract mixin class $CreditNoteReconcileResponseCopyWith<$Res> {
  factory $CreditNoteReconcileResponseCopyWith(
          CreditNoteReconcileResponse value,
          $Res Function(CreditNoteReconcileResponse) _then) =
      _$CreditNoteReconcileResponseCopyWithImpl;
  @useResult
  $Res call(
      {String invoiceId,
      num outstandingAmount,
      String status,
      List<CreditNoteAllocation> allocations});
}

/// @nodoc
class _$CreditNoteReconcileResponseCopyWithImpl<$Res>
    implements $CreditNoteReconcileResponseCopyWith<$Res> {
  _$CreditNoteReconcileResponseCopyWithImpl(this._self, this._then);

  final CreditNoteReconcileResponse _self;
  final $Res Function(CreditNoteReconcileResponse) _then;

  /// Create a copy of CreditNoteReconcileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceId = null,
    Object? outstandingAmount = null,
    Object? status = null,
    Object? allocations = null,
  }) {
    return _then(_self.copyWith(
      invoiceId: null == invoiceId
          ? _self.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      outstandingAmount: null == outstandingAmount
          ? _self.outstandingAmount
          : outstandingAmount // ignore: cast_nullable_to_non_nullable
              as num,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      allocations: null == allocations
          ? _self.allocations
          : allocations // ignore: cast_nullable_to_non_nullable
              as List<CreditNoteAllocation>,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreditNoteReconcileResponse].
extension CreditNoteReconcileResponsePatterns on CreditNoteReconcileResponse {
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
    TResult Function(_CreditNoteReconcileResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreditNoteReconcileResponse() when $default != null:
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
    TResult Function(_CreditNoteReconcileResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreditNoteReconcileResponse():
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
    TResult? Function(_CreditNoteReconcileResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreditNoteReconcileResponse() when $default != null:
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
    TResult Function(String invoiceId, num outstandingAmount, String status,
            List<CreditNoteAllocation> allocations)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreditNoteReconcileResponse() when $default != null:
        return $default(_that.invoiceId, _that.outstandingAmount, _that.status,
            _that.allocations);
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
    TResult Function(String invoiceId, num outstandingAmount, String status,
            List<CreditNoteAllocation> allocations)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreditNoteReconcileResponse():
        return $default(_that.invoiceId, _that.outstandingAmount, _that.status,
            _that.allocations);
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
    TResult? Function(String invoiceId, num outstandingAmount, String status,
            List<CreditNoteAllocation> allocations)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreditNoteReconcileResponse() when $default != null:
        return $default(_that.invoiceId, _that.outstandingAmount, _that.status,
            _that.allocations);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreditNoteReconcileResponse implements CreditNoteReconcileResponse {
  const _CreditNoteReconcileResponse(
      {required this.invoiceId,
      required this.outstandingAmount,
      required this.status,
      required final List<CreditNoteAllocation> allocations})
      : _allocations = allocations;
  factory _CreditNoteReconcileResponse.fromJson(Map<String, dynamic> json) =>
      _$CreditNoteReconcileResponseFromJson(json);

  @override
  final String invoiceId;
  @override
  final num outstandingAmount;
  @override
  final String status;
  final List<CreditNoteAllocation> _allocations;
  @override
  List<CreditNoteAllocation> get allocations {
    if (_allocations is EqualUnmodifiableListView) return _allocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allocations);
  }

  /// Create a copy of CreditNoteReconcileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreditNoteReconcileResponseCopyWith<_CreditNoteReconcileResponse>
      get copyWith => __$CreditNoteReconcileResponseCopyWithImpl<
          _CreditNoteReconcileResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreditNoteReconcileResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreditNoteReconcileResponse &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.outstandingAmount, outstandingAmount) ||
                other.outstandingAmount == outstandingAmount) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._allocations, _allocations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, invoiceId, outstandingAmount,
      status, const DeepCollectionEquality().hash(_allocations));

  @override
  String toString() {
    return 'CreditNoteReconcileResponse(invoiceId: $invoiceId, outstandingAmount: $outstandingAmount, status: $status, allocations: $allocations)';
  }
}

/// @nodoc
abstract mixin class _$CreditNoteReconcileResponseCopyWith<$Res>
    implements $CreditNoteReconcileResponseCopyWith<$Res> {
  factory _$CreditNoteReconcileResponseCopyWith(
          _CreditNoteReconcileResponse value,
          $Res Function(_CreditNoteReconcileResponse) _then) =
      __$CreditNoteReconcileResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String invoiceId,
      num outstandingAmount,
      String status,
      List<CreditNoteAllocation> allocations});
}

/// @nodoc
class __$CreditNoteReconcileResponseCopyWithImpl<$Res>
    implements _$CreditNoteReconcileResponseCopyWith<$Res> {
  __$CreditNoteReconcileResponseCopyWithImpl(this._self, this._then);

  final _CreditNoteReconcileResponse _self;
  final $Res Function(_CreditNoteReconcileResponse) _then;

  /// Create a copy of CreditNoteReconcileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? invoiceId = null,
    Object? outstandingAmount = null,
    Object? status = null,
    Object? allocations = null,
  }) {
    return _then(_CreditNoteReconcileResponse(
      invoiceId: null == invoiceId
          ? _self.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      outstandingAmount: null == outstandingAmount
          ? _self.outstandingAmount
          : outstandingAmount // ignore: cast_nullable_to_non_nullable
              as num,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      allocations: null == allocations
          ? _self._allocations
          : allocations // ignore: cast_nullable_to_non_nullable
              as List<CreditNoteAllocation>,
    ));
  }
}

/// @nodoc
mixin _$CreditNoteAllocation {
  String get creditNoteId;
  num get allocatedAmount;

  /// Create a copy of CreditNoteAllocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreditNoteAllocationCopyWith<CreditNoteAllocation> get copyWith =>
      _$CreditNoteAllocationCopyWithImpl<CreditNoteAllocation>(
          this as CreditNoteAllocation, _$identity);

  /// Serializes this CreditNoteAllocation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreditNoteAllocation &&
            (identical(other.creditNoteId, creditNoteId) ||
                other.creditNoteId == creditNoteId) &&
            (identical(other.allocatedAmount, allocatedAmount) ||
                other.allocatedAmount == allocatedAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, creditNoteId, allocatedAmount);

  @override
  String toString() {
    return 'CreditNoteAllocation(creditNoteId: $creditNoteId, allocatedAmount: $allocatedAmount)';
  }
}

/// @nodoc
abstract mixin class $CreditNoteAllocationCopyWith<$Res> {
  factory $CreditNoteAllocationCopyWith(CreditNoteAllocation value,
          $Res Function(CreditNoteAllocation) _then) =
      _$CreditNoteAllocationCopyWithImpl;
  @useResult
  $Res call({String creditNoteId, num allocatedAmount});
}

/// @nodoc
class _$CreditNoteAllocationCopyWithImpl<$Res>
    implements $CreditNoteAllocationCopyWith<$Res> {
  _$CreditNoteAllocationCopyWithImpl(this._self, this._then);

  final CreditNoteAllocation _self;
  final $Res Function(CreditNoteAllocation) _then;

  /// Create a copy of CreditNoteAllocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditNoteId = null,
    Object? allocatedAmount = null,
  }) {
    return _then(_self.copyWith(
      creditNoteId: null == creditNoteId
          ? _self.creditNoteId
          : creditNoteId // ignore: cast_nullable_to_non_nullable
              as String,
      allocatedAmount: null == allocatedAmount
          ? _self.allocatedAmount
          : allocatedAmount // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreditNoteAllocation].
extension CreditNoteAllocationPatterns on CreditNoteAllocation {
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
    TResult Function(_CreditNoteAllocation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreditNoteAllocation() when $default != null:
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
    TResult Function(_CreditNoteAllocation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreditNoteAllocation():
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
    TResult? Function(_CreditNoteAllocation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreditNoteAllocation() when $default != null:
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
    TResult Function(String creditNoteId, num allocatedAmount)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreditNoteAllocation() when $default != null:
        return $default(_that.creditNoteId, _that.allocatedAmount);
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
    TResult Function(String creditNoteId, num allocatedAmount) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreditNoteAllocation():
        return $default(_that.creditNoteId, _that.allocatedAmount);
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
    TResult? Function(String creditNoteId, num allocatedAmount)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreditNoteAllocation() when $default != null:
        return $default(_that.creditNoteId, _that.allocatedAmount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreditNoteAllocation implements CreditNoteAllocation {
  const _CreditNoteAllocation(
      {required this.creditNoteId, required this.allocatedAmount});
  factory _CreditNoteAllocation.fromJson(Map<String, dynamic> json) =>
      _$CreditNoteAllocationFromJson(json);

  @override
  final String creditNoteId;
  @override
  final num allocatedAmount;

  /// Create a copy of CreditNoteAllocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreditNoteAllocationCopyWith<_CreditNoteAllocation> get copyWith =>
      __$CreditNoteAllocationCopyWithImpl<_CreditNoteAllocation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreditNoteAllocationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreditNoteAllocation &&
            (identical(other.creditNoteId, creditNoteId) ||
                other.creditNoteId == creditNoteId) &&
            (identical(other.allocatedAmount, allocatedAmount) ||
                other.allocatedAmount == allocatedAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, creditNoteId, allocatedAmount);

  @override
  String toString() {
    return 'CreditNoteAllocation(creditNoteId: $creditNoteId, allocatedAmount: $allocatedAmount)';
  }
}

/// @nodoc
abstract mixin class _$CreditNoteAllocationCopyWith<$Res>
    implements $CreditNoteAllocationCopyWith<$Res> {
  factory _$CreditNoteAllocationCopyWith(_CreditNoteAllocation value,
          $Res Function(_CreditNoteAllocation) _then) =
      __$CreditNoteAllocationCopyWithImpl;
  @override
  @useResult
  $Res call({String creditNoteId, num allocatedAmount});
}

/// @nodoc
class __$CreditNoteAllocationCopyWithImpl<$Res>
    implements _$CreditNoteAllocationCopyWith<$Res> {
  __$CreditNoteAllocationCopyWithImpl(this._self, this._then);

  final _CreditNoteAllocation _self;
  final $Res Function(_CreditNoteAllocation) _then;

  /// Create a copy of CreditNoteAllocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? creditNoteId = null,
    Object? allocatedAmount = null,
  }) {
    return _then(_CreditNoteAllocation(
      creditNoteId: null == creditNoteId
          ? _self.creditNoteId
          : creditNoteId // ignore: cast_nullable_to_non_nullable
              as String,
      allocatedAmount: null == allocatedAmount
          ? _self.allocatedAmount
          : allocatedAmount // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

// dart format on
