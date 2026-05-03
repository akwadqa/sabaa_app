// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentResponseModel {
  String get paymentId;
  String get paymentType;
  String get party;
  String get partyName;
  double get paidAmount;
  String get currency;
  String get referenceDate;
  String? get referenceNo;
  int get docStatus;
  String get createdBy;
  String get createdAt;

  /// Create a copy of PaymentResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentResponseModelCopyWith<PaymentResponseModel> get copyWith =>
      _$PaymentResponseModelCopyWithImpl<PaymentResponseModel>(
          this as PaymentResponseModel, _$identity);

  /// Serializes this PaymentResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentResponseModel &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.party, party) || other.party == party) &&
            (identical(other.partyName, partyName) ||
                other.partyName == partyName) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.referenceDate, referenceDate) ||
                other.referenceDate == referenceDate) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.docStatus, docStatus) ||
                other.docStatus == docStatus) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentId,
      paymentType,
      party,
      partyName,
      paidAmount,
      currency,
      referenceDate,
      referenceNo,
      docStatus,
      createdBy,
      createdAt);

  @override
  String toString() {
    return 'PaymentResponseModel(paymentId: $paymentId, paymentType: $paymentType, party: $party, partyName: $partyName, paidAmount: $paidAmount, currency: $currency, referenceDate: $referenceDate, referenceNo: $referenceNo, docStatus: $docStatus, createdBy: $createdBy, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $PaymentResponseModelCopyWith<$Res> {
  factory $PaymentResponseModelCopyWith(PaymentResponseModel value,
          $Res Function(PaymentResponseModel) _then) =
      _$PaymentResponseModelCopyWithImpl;
  @useResult
  $Res call(
      {String paymentId,
      String paymentType,
      String party,
      String partyName,
      double paidAmount,
      String currency,
      String referenceDate,
      String? referenceNo,
      int docStatus,
      String createdBy,
      String createdAt});
}

/// @nodoc
class _$PaymentResponseModelCopyWithImpl<$Res>
    implements $PaymentResponseModelCopyWith<$Res> {
  _$PaymentResponseModelCopyWithImpl(this._self, this._then);

  final PaymentResponseModel _self;
  final $Res Function(PaymentResponseModel) _then;

  /// Create a copy of PaymentResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = null,
    Object? paymentType = null,
    Object? party = null,
    Object? partyName = null,
    Object? paidAmount = null,
    Object? currency = null,
    Object? referenceDate = null,
    Object? referenceNo = freezed,
    Object? docStatus = null,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      paymentId: null == paymentId
          ? _self.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: null == paymentType
          ? _self.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      party: null == party
          ? _self.party
          : party // ignore: cast_nullable_to_non_nullable
              as String,
      partyName: null == partyName
          ? _self.partyName
          : partyName // ignore: cast_nullable_to_non_nullable
              as String,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      referenceDate: null == referenceDate
          ? _self.referenceDate
          : referenceDate // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNo: freezed == referenceNo
          ? _self.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      docStatus: null == docStatus
          ? _self.docStatus
          : docStatus // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: null == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaymentResponseModel].
extension PaymentResponseModelPatterns on PaymentResponseModel {
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
    TResult Function(_PaymentResponseModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentResponseModel() when $default != null:
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
    TResult Function(_PaymentResponseModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentResponseModel():
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
    TResult? Function(_PaymentResponseModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentResponseModel() when $default != null:
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
            String paymentId,
            String paymentType,
            String party,
            String partyName,
            double paidAmount,
            String currency,
            String referenceDate,
            String? referenceNo,
            int docStatus,
            String createdBy,
            String createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentResponseModel() when $default != null:
        return $default(
            _that.paymentId,
            _that.paymentType,
            _that.party,
            _that.partyName,
            _that.paidAmount,
            _that.currency,
            _that.referenceDate,
            _that.referenceNo,
            _that.docStatus,
            _that.createdBy,
            _that.createdAt);
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
            String paymentId,
            String paymentType,
            String party,
            String partyName,
            double paidAmount,
            String currency,
            String referenceDate,
            String? referenceNo,
            int docStatus,
            String createdBy,
            String createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentResponseModel():
        return $default(
            _that.paymentId,
            _that.paymentType,
            _that.party,
            _that.partyName,
            _that.paidAmount,
            _that.currency,
            _that.referenceDate,
            _that.referenceNo,
            _that.docStatus,
            _that.createdBy,
            _that.createdAt);
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
            String paymentId,
            String paymentType,
            String party,
            String partyName,
            double paidAmount,
            String currency,
            String referenceDate,
            String? referenceNo,
            int docStatus,
            String createdBy,
            String createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentResponseModel() when $default != null:
        return $default(
            _that.paymentId,
            _that.paymentType,
            _that.party,
            _that.partyName,
            _that.paidAmount,
            _that.currency,
            _that.referenceDate,
            _that.referenceNo,
            _that.docStatus,
            _that.createdBy,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PaymentResponseModel implements PaymentResponseModel {
  const _PaymentResponseModel(
      {required this.paymentId,
      required this.paymentType,
      required this.party,
      required this.partyName,
      required this.paidAmount,
      required this.currency,
      required this.referenceDate,
      this.referenceNo,
      required this.docStatus,
      required this.createdBy,
      required this.createdAt});
  factory _PaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseModelFromJson(json);

  @override
  final String paymentId;
  @override
  final String paymentType;
  @override
  final String party;
  @override
  final String partyName;
  @override
  final double paidAmount;
  @override
  final String currency;
  @override
  final String referenceDate;
  @override
  final String? referenceNo;
  @override
  final int docStatus;
  @override
  final String createdBy;
  @override
  final String createdAt;

  /// Create a copy of PaymentResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentResponseModelCopyWith<_PaymentResponseModel> get copyWith =>
      __$PaymentResponseModelCopyWithImpl<_PaymentResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentResponseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentResponseModel &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.party, party) || other.party == party) &&
            (identical(other.partyName, partyName) ||
                other.partyName == partyName) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.referenceDate, referenceDate) ||
                other.referenceDate == referenceDate) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.docStatus, docStatus) ||
                other.docStatus == docStatus) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentId,
      paymentType,
      party,
      partyName,
      paidAmount,
      currency,
      referenceDate,
      referenceNo,
      docStatus,
      createdBy,
      createdAt);

  @override
  String toString() {
    return 'PaymentResponseModel(paymentId: $paymentId, paymentType: $paymentType, party: $party, partyName: $partyName, paidAmount: $paidAmount, currency: $currency, referenceDate: $referenceDate, referenceNo: $referenceNo, docStatus: $docStatus, createdBy: $createdBy, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$PaymentResponseModelCopyWith<$Res>
    implements $PaymentResponseModelCopyWith<$Res> {
  factory _$PaymentResponseModelCopyWith(_PaymentResponseModel value,
          $Res Function(_PaymentResponseModel) _then) =
      __$PaymentResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String paymentId,
      String paymentType,
      String party,
      String partyName,
      double paidAmount,
      String currency,
      String referenceDate,
      String? referenceNo,
      int docStatus,
      String createdBy,
      String createdAt});
}

/// @nodoc
class __$PaymentResponseModelCopyWithImpl<$Res>
    implements _$PaymentResponseModelCopyWith<$Res> {
  __$PaymentResponseModelCopyWithImpl(this._self, this._then);

  final _PaymentResponseModel _self;
  final $Res Function(_PaymentResponseModel) _then;

  /// Create a copy of PaymentResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paymentId = null,
    Object? paymentType = null,
    Object? party = null,
    Object? partyName = null,
    Object? paidAmount = null,
    Object? currency = null,
    Object? referenceDate = null,
    Object? referenceNo = freezed,
    Object? docStatus = null,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(_PaymentResponseModel(
      paymentId: null == paymentId
          ? _self.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: null == paymentType
          ? _self.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      party: null == party
          ? _self.party
          : party // ignore: cast_nullable_to_non_nullable
              as String,
      partyName: null == partyName
          ? _self.partyName
          : partyName // ignore: cast_nullable_to_non_nullable
              as String,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      referenceDate: null == referenceDate
          ? _self.referenceDate
          : referenceDate // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNo: freezed == referenceNo
          ? _self.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      docStatus: null == docStatus
          ? _self.docStatus
          : docStatus // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: null == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
