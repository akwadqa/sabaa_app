// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_note_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreditNoteModel {
  String get creditNoteId;
  String? get returnAgainst;
  String get postingDate;
  String get currency;
  num get grandTotal;
  num get outstandingAmount;
  String get status;

  /// Create a copy of CreditNoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreditNoteModelCopyWith<CreditNoteModel> get copyWith =>
      _$CreditNoteModelCopyWithImpl<CreditNoteModel>(
          this as CreditNoteModel, _$identity);

  /// Serializes this CreditNoteModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreditNoteModel &&
            (identical(other.creditNoteId, creditNoteId) ||
                other.creditNoteId == creditNoteId) &&
            (identical(other.returnAgainst, returnAgainst) ||
                other.returnAgainst == returnAgainst) &&
            (identical(other.postingDate, postingDate) ||
                other.postingDate == postingDate) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.outstandingAmount, outstandingAmount) ||
                other.outstandingAmount == outstandingAmount) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, creditNoteId, returnAgainst,
      postingDate, currency, grandTotal, outstandingAmount, status);

  @override
  String toString() {
    return 'CreditNoteModel(creditNoteId: $creditNoteId, returnAgainst: $returnAgainst, postingDate: $postingDate, currency: $currency, grandTotal: $grandTotal, outstandingAmount: $outstandingAmount, status: $status)';
  }
}

/// @nodoc
abstract mixin class $CreditNoteModelCopyWith<$Res> {
  factory $CreditNoteModelCopyWith(
          CreditNoteModel value, $Res Function(CreditNoteModel) _then) =
      _$CreditNoteModelCopyWithImpl;
  @useResult
  $Res call(
      {String creditNoteId,
      String? returnAgainst,
      String postingDate,
      String currency,
      num grandTotal,
      num outstandingAmount,
      String status});
}

/// @nodoc
class _$CreditNoteModelCopyWithImpl<$Res>
    implements $CreditNoteModelCopyWith<$Res> {
  _$CreditNoteModelCopyWithImpl(this._self, this._then);

  final CreditNoteModel _self;
  final $Res Function(CreditNoteModel) _then;

  /// Create a copy of CreditNoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditNoteId = null,
    Object? returnAgainst = freezed,
    Object? postingDate = null,
    Object? currency = null,
    Object? grandTotal = null,
    Object? outstandingAmount = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      creditNoteId: null == creditNoteId
          ? _self.creditNoteId
          : creditNoteId // ignore: cast_nullable_to_non_nullable
              as String,
      returnAgainst: freezed == returnAgainst
          ? _self.returnAgainst
          : returnAgainst // ignore: cast_nullable_to_non_nullable
              as String?,
      postingDate: null == postingDate
          ? _self.postingDate
          : postingDate // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      grandTotal: null == grandTotal
          ? _self.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as num,
      outstandingAmount: null == outstandingAmount
          ? _self.outstandingAmount
          : outstandingAmount // ignore: cast_nullable_to_non_nullable
              as num,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreditNoteModel].
extension CreditNoteModelPatterns on CreditNoteModel {
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
    TResult Function(_CreditNoteModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreditNoteModel() when $default != null:
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
    TResult Function(_CreditNoteModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreditNoteModel():
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
    TResult? Function(_CreditNoteModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreditNoteModel() when $default != null:
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
            String creditNoteId,
            String? returnAgainst,
            String postingDate,
            String currency,
            num grandTotal,
            num outstandingAmount,
            String status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreditNoteModel() when $default != null:
        return $default(
            _that.creditNoteId,
            _that.returnAgainst,
            _that.postingDate,
            _that.currency,
            _that.grandTotal,
            _that.outstandingAmount,
            _that.status);
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
            String creditNoteId,
            String? returnAgainst,
            String postingDate,
            String currency,
            num grandTotal,
            num outstandingAmount,
            String status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreditNoteModel():
        return $default(
            _that.creditNoteId,
            _that.returnAgainst,
            _that.postingDate,
            _that.currency,
            _that.grandTotal,
            _that.outstandingAmount,
            _that.status);
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
            String creditNoteId,
            String? returnAgainst,
            String postingDate,
            String currency,
            num grandTotal,
            num outstandingAmount,
            String status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreditNoteModel() when $default != null:
        return $default(
            _that.creditNoteId,
            _that.returnAgainst,
            _that.postingDate,
            _that.currency,
            _that.grandTotal,
            _that.outstandingAmount,
            _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreditNoteModel implements CreditNoteModel {
  const _CreditNoteModel(
      {required this.creditNoteId,
      this.returnAgainst,
      required this.postingDate,
      required this.currency,
      required this.grandTotal,
      required this.outstandingAmount,
      required this.status});
  factory _CreditNoteModel.fromJson(Map<String, dynamic> json) =>
      _$CreditNoteModelFromJson(json);

  @override
  final String creditNoteId;
  @override
  final String? returnAgainst;
  @override
  final String postingDate;
  @override
  final String currency;
  @override
  final num grandTotal;
  @override
  final num outstandingAmount;
  @override
  final String status;

  /// Create a copy of CreditNoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreditNoteModelCopyWith<_CreditNoteModel> get copyWith =>
      __$CreditNoteModelCopyWithImpl<_CreditNoteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreditNoteModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreditNoteModel &&
            (identical(other.creditNoteId, creditNoteId) ||
                other.creditNoteId == creditNoteId) &&
            (identical(other.returnAgainst, returnAgainst) ||
                other.returnAgainst == returnAgainst) &&
            (identical(other.postingDate, postingDate) ||
                other.postingDate == postingDate) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.outstandingAmount, outstandingAmount) ||
                other.outstandingAmount == outstandingAmount) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, creditNoteId, returnAgainst,
      postingDate, currency, grandTotal, outstandingAmount, status);

  @override
  String toString() {
    return 'CreditNoteModel(creditNoteId: $creditNoteId, returnAgainst: $returnAgainst, postingDate: $postingDate, currency: $currency, grandTotal: $grandTotal, outstandingAmount: $outstandingAmount, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$CreditNoteModelCopyWith<$Res>
    implements $CreditNoteModelCopyWith<$Res> {
  factory _$CreditNoteModelCopyWith(
          _CreditNoteModel value, $Res Function(_CreditNoteModel) _then) =
      __$CreditNoteModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String creditNoteId,
      String? returnAgainst,
      String postingDate,
      String currency,
      num grandTotal,
      num outstandingAmount,
      String status});
}

/// @nodoc
class __$CreditNoteModelCopyWithImpl<$Res>
    implements _$CreditNoteModelCopyWith<$Res> {
  __$CreditNoteModelCopyWithImpl(this._self, this._then);

  final _CreditNoteModel _self;
  final $Res Function(_CreditNoteModel) _then;

  /// Create a copy of CreditNoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? creditNoteId = null,
    Object? returnAgainst = freezed,
    Object? postingDate = null,
    Object? currency = null,
    Object? grandTotal = null,
    Object? outstandingAmount = null,
    Object? status = null,
  }) {
    return _then(_CreditNoteModel(
      creditNoteId: null == creditNoteId
          ? _self.creditNoteId
          : creditNoteId // ignore: cast_nullable_to_non_nullable
              as String,
      returnAgainst: freezed == returnAgainst
          ? _self.returnAgainst
          : returnAgainst // ignore: cast_nullable_to_non_nullable
              as String?,
      postingDate: null == postingDate
          ? _self.postingDate
          : postingDate // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      grandTotal: null == grandTotal
          ? _self.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as num,
      outstandingAmount: null == outstandingAmount
          ? _self.outstandingAmount
          : outstandingAmount // ignore: cast_nullable_to_non_nullable
              as num,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
