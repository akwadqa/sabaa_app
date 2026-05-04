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
  String get modeOfPayment;
  double get paidAmount;
  String get currency;
  int get docStatus;

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
            (identical(other.modeOfPayment, modeOfPayment) ||
                other.modeOfPayment == modeOfPayment) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.docStatus, docStatus) ||
                other.docStatus == docStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, paymentId, paymentType, party,
      partyName, modeOfPayment, paidAmount, currency, docStatus);

  @override
  String toString() {
    return 'PaymentResponseModel(paymentId: $paymentId, paymentType: $paymentType, party: $party, partyName: $partyName, modeOfPayment: $modeOfPayment, paidAmount: $paidAmount, currency: $currency, docStatus: $docStatus)';
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
      String modeOfPayment,
      double paidAmount,
      String currency,
      int docStatus});
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
    Object? modeOfPayment = null,
    Object? paidAmount = null,
    Object? currency = null,
    Object? docStatus = null,
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
      modeOfPayment: null == modeOfPayment
          ? _self.modeOfPayment
          : modeOfPayment // ignore: cast_nullable_to_non_nullable
              as String,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      docStatus: null == docStatus
          ? _self.docStatus
          : docStatus // ignore: cast_nullable_to_non_nullable
              as int,
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
            String modeOfPayment,
            double paidAmount,
            String currency,
            int docStatus)?
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
            _that.modeOfPayment,
            _that.paidAmount,
            _that.currency,
            _that.docStatus);
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
            String modeOfPayment,
            double paidAmount,
            String currency,
            int docStatus)
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
            _that.modeOfPayment,
            _that.paidAmount,
            _that.currency,
            _that.docStatus);
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
            String modeOfPayment,
            double paidAmount,
            String currency,
            int docStatus)?
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
            _that.modeOfPayment,
            _that.paidAmount,
            _that.currency,
            _that.docStatus);
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
      required this.modeOfPayment,
      required this.paidAmount,
      required this.currency,
      required this.docStatus});
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
  final String modeOfPayment;
  @override
  final double paidAmount;
  @override
  final String currency;
  @override
  final int docStatus;

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
            (identical(other.modeOfPayment, modeOfPayment) ||
                other.modeOfPayment == modeOfPayment) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.docStatus, docStatus) ||
                other.docStatus == docStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, paymentId, paymentType, party,
      partyName, modeOfPayment, paidAmount, currency, docStatus);

  @override
  String toString() {
    return 'PaymentResponseModel(paymentId: $paymentId, paymentType: $paymentType, party: $party, partyName: $partyName, modeOfPayment: $modeOfPayment, paidAmount: $paidAmount, currency: $currency, docStatus: $docStatus)';
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
      String modeOfPayment,
      double paidAmount,
      String currency,
      int docStatus});
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
    Object? modeOfPayment = null,
    Object? paidAmount = null,
    Object? currency = null,
    Object? docStatus = null,
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
      modeOfPayment: null == modeOfPayment
          ? _self.modeOfPayment
          : modeOfPayment // ignore: cast_nullable_to_non_nullable
              as String,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      docStatus: null == docStatus
          ? _self.docStatus
          : docStatus // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
