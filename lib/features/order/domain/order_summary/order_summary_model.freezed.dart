// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderSummaryModel {
  String get customerId;
  int get totalSales;
  int get totalReturnSales;
  double get totalInvoicesAmount;
  double get outstandingBalance;
  List<InvoiceModel> get invoices;

  /// Create a copy of OrderSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderSummaryModelCopyWith<OrderSummaryModel> get copyWith =>
      _$OrderSummaryModelCopyWithImpl<OrderSummaryModel>(
          this as OrderSummaryModel, _$identity);

  /// Serializes this OrderSummaryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderSummaryModel &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.totalReturnSales, totalReturnSales) ||
                other.totalReturnSales == totalReturnSales) &&
            (identical(other.totalInvoicesAmount, totalInvoicesAmount) ||
                other.totalInvoicesAmount == totalInvoicesAmount) &&
            (identical(other.outstandingBalance, outstandingBalance) ||
                other.outstandingBalance == outstandingBalance) &&
            const DeepCollectionEquality().equals(other.invoices, invoices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerId,
      totalSales,
      totalReturnSales,
      totalInvoicesAmount,
      outstandingBalance,
      const DeepCollectionEquality().hash(invoices));

  @override
  String toString() {
    return 'OrderSummaryModel(customerId: $customerId, totalSales: $totalSales, totalReturnSales: $totalReturnSales, totalInvoicesAmount: $totalInvoicesAmount, outstandingBalance: $outstandingBalance, invoices: $invoices)';
  }
}

/// @nodoc
abstract mixin class $OrderSummaryModelCopyWith<$Res> {
  factory $OrderSummaryModelCopyWith(
          OrderSummaryModel value, $Res Function(OrderSummaryModel) _then) =
      _$OrderSummaryModelCopyWithImpl;
  @useResult
  $Res call(
      {String customerId,
      int totalSales,
      int totalReturnSales,
      double totalInvoicesAmount,
      double outstandingBalance,
      List<InvoiceModel> invoices});
}

/// @nodoc
class _$OrderSummaryModelCopyWithImpl<$Res>
    implements $OrderSummaryModelCopyWith<$Res> {
  _$OrderSummaryModelCopyWithImpl(this._self, this._then);

  final OrderSummaryModel _self;
  final $Res Function(OrderSummaryModel) _then;

  /// Create a copy of OrderSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? totalSales = null,
    Object? totalReturnSales = null,
    Object? totalInvoicesAmount = null,
    Object? outstandingBalance = null,
    Object? invoices = null,
  }) {
    return _then(_self.copyWith(
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      totalSales: null == totalSales
          ? _self.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int,
      totalReturnSales: null == totalReturnSales
          ? _self.totalReturnSales
          : totalReturnSales // ignore: cast_nullable_to_non_nullable
              as int,
      totalInvoicesAmount: null == totalInvoicesAmount
          ? _self.totalInvoicesAmount
          : totalInvoicesAmount // ignore: cast_nullable_to_non_nullable
              as double,
      outstandingBalance: null == outstandingBalance
          ? _self.outstandingBalance
          : outstandingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      invoices: null == invoices
          ? _self.invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<InvoiceModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrderSummaryModel].
extension OrderSummaryModelPatterns on OrderSummaryModel {
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
    TResult Function(_OrderSummaryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderSummaryModel() when $default != null:
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
    TResult Function(_OrderSummaryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderSummaryModel():
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
    TResult? Function(_OrderSummaryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderSummaryModel() when $default != null:
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
            int totalSales,
            int totalReturnSales,
            double totalInvoicesAmount,
            double outstandingBalance,
            List<InvoiceModel> invoices)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderSummaryModel() when $default != null:
        return $default(
            _that.customerId,
            _that.totalSales,
            _that.totalReturnSales,
            _that.totalInvoicesAmount,
            _that.outstandingBalance,
            _that.invoices);
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
            int totalSales,
            int totalReturnSales,
            double totalInvoicesAmount,
            double outstandingBalance,
            List<InvoiceModel> invoices)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderSummaryModel():
        return $default(
            _that.customerId,
            _that.totalSales,
            _that.totalReturnSales,
            _that.totalInvoicesAmount,
            _that.outstandingBalance,
            _that.invoices);
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
            int totalSales,
            int totalReturnSales,
            double totalInvoicesAmount,
            double outstandingBalance,
            List<InvoiceModel> invoices)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderSummaryModel() when $default != null:
        return $default(
            _that.customerId,
            _that.totalSales,
            _that.totalReturnSales,
            _that.totalInvoicesAmount,
            _that.outstandingBalance,
            _that.invoices);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OrderSummaryModel implements OrderSummaryModel {
  const _OrderSummaryModel(
      {required this.customerId,
      required this.totalSales,
      required this.totalReturnSales,
      required this.totalInvoicesAmount,
      required this.outstandingBalance,
      required final List<InvoiceModel> invoices})
      : _invoices = invoices;
  factory _OrderSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderSummaryModelFromJson(json);

  @override
  final String customerId;
  @override
  final int totalSales;
  @override
  final int totalReturnSales;
  @override
  final double totalInvoicesAmount;
  @override
  final double outstandingBalance;
  final List<InvoiceModel> _invoices;
  @override
  List<InvoiceModel> get invoices {
    if (_invoices is EqualUnmodifiableListView) return _invoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoices);
  }

  /// Create a copy of OrderSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderSummaryModelCopyWith<_OrderSummaryModel> get copyWith =>
      __$OrderSummaryModelCopyWithImpl<_OrderSummaryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrderSummaryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderSummaryModel &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.totalReturnSales, totalReturnSales) ||
                other.totalReturnSales == totalReturnSales) &&
            (identical(other.totalInvoicesAmount, totalInvoicesAmount) ||
                other.totalInvoicesAmount == totalInvoicesAmount) &&
            (identical(other.outstandingBalance, outstandingBalance) ||
                other.outstandingBalance == outstandingBalance) &&
            const DeepCollectionEquality().equals(other._invoices, _invoices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerId,
      totalSales,
      totalReturnSales,
      totalInvoicesAmount,
      outstandingBalance,
      const DeepCollectionEquality().hash(_invoices));

  @override
  String toString() {
    return 'OrderSummaryModel(customerId: $customerId, totalSales: $totalSales, totalReturnSales: $totalReturnSales, totalInvoicesAmount: $totalInvoicesAmount, outstandingBalance: $outstandingBalance, invoices: $invoices)';
  }
}

/// @nodoc
abstract mixin class _$OrderSummaryModelCopyWith<$Res>
    implements $OrderSummaryModelCopyWith<$Res> {
  factory _$OrderSummaryModelCopyWith(
          _OrderSummaryModel value, $Res Function(_OrderSummaryModel) _then) =
      __$OrderSummaryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String customerId,
      int totalSales,
      int totalReturnSales,
      double totalInvoicesAmount,
      double outstandingBalance,
      List<InvoiceModel> invoices});
}

/// @nodoc
class __$OrderSummaryModelCopyWithImpl<$Res>
    implements _$OrderSummaryModelCopyWith<$Res> {
  __$OrderSummaryModelCopyWithImpl(this._self, this._then);

  final _OrderSummaryModel _self;
  final $Res Function(_OrderSummaryModel) _then;

  /// Create a copy of OrderSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? customerId = null,
    Object? totalSales = null,
    Object? totalReturnSales = null,
    Object? totalInvoicesAmount = null,
    Object? outstandingBalance = null,
    Object? invoices = null,
  }) {
    return _then(_OrderSummaryModel(
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      totalSales: null == totalSales
          ? _self.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int,
      totalReturnSales: null == totalReturnSales
          ? _self.totalReturnSales
          : totalReturnSales // ignore: cast_nullable_to_non_nullable
              as int,
      totalInvoicesAmount: null == totalInvoicesAmount
          ? _self.totalInvoicesAmount
          : totalInvoicesAmount // ignore: cast_nullable_to_non_nullable
              as double,
      outstandingBalance: null == outstandingBalance
          ? _self.outstandingBalance
          : outstandingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      invoices: null == invoices
          ? _self._invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<InvoiceModel>,
    ));
  }
}

/// @nodoc
mixin _$InvoiceModel {
// ✅ Accept either invoiceId or returnId
  @JsonKey(readValue: _readInvoiceId)
  String get invoiceId;
  String get postingDate;
  String get status; // ✅ Accept either grandTotal or total
  @JsonKey(readValue: _readGrandTotal)
  double get grandTotal;
  double get outstandingAmount;
  double get paidAmount;
  bool get isReturn;
  String? get returnAgainst;

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceModelCopyWith<InvoiceModel> get copyWith =>
      _$InvoiceModelCopyWithImpl<InvoiceModel>(
          this as InvoiceModel, _$identity);

  /// Serializes this InvoiceModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceModel &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.postingDate, postingDate) ||
                other.postingDate == postingDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.outstandingAmount, outstandingAmount) ||
                other.outstandingAmount == outstandingAmount) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.isReturn, isReturn) ||
                other.isReturn == isReturn) &&
            (identical(other.returnAgainst, returnAgainst) ||
                other.returnAgainst == returnAgainst));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, invoiceId, postingDate, status,
      grandTotal, outstandingAmount, paidAmount, isReturn, returnAgainst);

  @override
  String toString() {
    return 'InvoiceModel(invoiceId: $invoiceId, postingDate: $postingDate, status: $status, grandTotal: $grandTotal, outstandingAmount: $outstandingAmount, paidAmount: $paidAmount, isReturn: $isReturn, returnAgainst: $returnAgainst)';
  }
}

/// @nodoc
abstract mixin class $InvoiceModelCopyWith<$Res> {
  factory $InvoiceModelCopyWith(
          InvoiceModel value, $Res Function(InvoiceModel) _then) =
      _$InvoiceModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(readValue: _readInvoiceId) String invoiceId,
      String postingDate,
      String status,
      @JsonKey(readValue: _readGrandTotal) double grandTotal,
      double outstandingAmount,
      double paidAmount,
      bool isReturn,
      String? returnAgainst});
}

/// @nodoc
class _$InvoiceModelCopyWithImpl<$Res> implements $InvoiceModelCopyWith<$Res> {
  _$InvoiceModelCopyWithImpl(this._self, this._then);

  final InvoiceModel _self;
  final $Res Function(InvoiceModel) _then;

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceId = null,
    Object? postingDate = null,
    Object? status = null,
    Object? grandTotal = null,
    Object? outstandingAmount = null,
    Object? paidAmount = null,
    Object? isReturn = null,
    Object? returnAgainst = freezed,
  }) {
    return _then(_self.copyWith(
      invoiceId: null == invoiceId
          ? _self.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      postingDate: null == postingDate
          ? _self.postingDate
          : postingDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      grandTotal: null == grandTotal
          ? _self.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      outstandingAmount: null == outstandingAmount
          ? _self.outstandingAmount
          : outstandingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      isReturn: null == isReturn
          ? _self.isReturn
          : isReturn // ignore: cast_nullable_to_non_nullable
              as bool,
      returnAgainst: freezed == returnAgainst
          ? _self.returnAgainst
          : returnAgainst // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [InvoiceModel].
extension InvoiceModelPatterns on InvoiceModel {
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
    TResult Function(_InvoiceModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceModel() when $default != null:
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
    TResult Function(_InvoiceModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceModel():
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
    TResult? Function(_InvoiceModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceModel() when $default != null:
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
            @JsonKey(readValue: _readInvoiceId) String invoiceId,
            String postingDate,
            String status,
            @JsonKey(readValue: _readGrandTotal) double grandTotal,
            double outstandingAmount,
            double paidAmount,
            bool isReturn,
            String? returnAgainst)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceModel() when $default != null:
        return $default(
            _that.invoiceId,
            _that.postingDate,
            _that.status,
            _that.grandTotal,
            _that.outstandingAmount,
            _that.paidAmount,
            _that.isReturn,
            _that.returnAgainst);
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
            @JsonKey(readValue: _readInvoiceId) String invoiceId,
            String postingDate,
            String status,
            @JsonKey(readValue: _readGrandTotal) double grandTotal,
            double outstandingAmount,
            double paidAmount,
            bool isReturn,
            String? returnAgainst)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceModel():
        return $default(
            _that.invoiceId,
            _that.postingDate,
            _that.status,
            _that.grandTotal,
            _that.outstandingAmount,
            _that.paidAmount,
            _that.isReturn,
            _that.returnAgainst);
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
            @JsonKey(readValue: _readInvoiceId) String invoiceId,
            String postingDate,
            String status,
            @JsonKey(readValue: _readGrandTotal) double grandTotal,
            double outstandingAmount,
            double paidAmount,
            bool isReturn,
            String? returnAgainst)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceModel() when $default != null:
        return $default(
            _that.invoiceId,
            _that.postingDate,
            _that.status,
            _that.grandTotal,
            _that.outstandingAmount,
            _that.paidAmount,
            _that.isReturn,
            _that.returnAgainst);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InvoiceModel implements InvoiceModel {
  const _InvoiceModel(
      {@JsonKey(readValue: _readInvoiceId) required this.invoiceId,
      this.postingDate = '',
      this.status = '',
      @JsonKey(readValue: _readGrandTotal) this.grandTotal = 0.0,
      this.outstandingAmount = 0.0,
      this.paidAmount = 0.0,
      this.isReturn = false,
      this.returnAgainst});
  factory _InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);

// ✅ Accept either invoiceId or returnId
  @override
  @JsonKey(readValue: _readInvoiceId)
  final String invoiceId;
  @override
  @JsonKey()
  final String postingDate;
  @override
  @JsonKey()
  final String status;
// ✅ Accept either grandTotal or total
  @override
  @JsonKey(readValue: _readGrandTotal)
  final double grandTotal;
  @override
  @JsonKey()
  final double outstandingAmount;
  @override
  @JsonKey()
  final double paidAmount;
  @override
  @JsonKey()
  final bool isReturn;
  @override
  final String? returnAgainst;

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceModelCopyWith<_InvoiceModel> get copyWith =>
      __$InvoiceModelCopyWithImpl<_InvoiceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InvoiceModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceModel &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.postingDate, postingDate) ||
                other.postingDate == postingDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.outstandingAmount, outstandingAmount) ||
                other.outstandingAmount == outstandingAmount) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.isReturn, isReturn) ||
                other.isReturn == isReturn) &&
            (identical(other.returnAgainst, returnAgainst) ||
                other.returnAgainst == returnAgainst));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, invoiceId, postingDate, status,
      grandTotal, outstandingAmount, paidAmount, isReturn, returnAgainst);

  @override
  String toString() {
    return 'InvoiceModel(invoiceId: $invoiceId, postingDate: $postingDate, status: $status, grandTotal: $grandTotal, outstandingAmount: $outstandingAmount, paidAmount: $paidAmount, isReturn: $isReturn, returnAgainst: $returnAgainst)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceModelCopyWith<$Res>
    implements $InvoiceModelCopyWith<$Res> {
  factory _$InvoiceModelCopyWith(
          _InvoiceModel value, $Res Function(_InvoiceModel) _then) =
      __$InvoiceModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _readInvoiceId) String invoiceId,
      String postingDate,
      String status,
      @JsonKey(readValue: _readGrandTotal) double grandTotal,
      double outstandingAmount,
      double paidAmount,
      bool isReturn,
      String? returnAgainst});
}

/// @nodoc
class __$InvoiceModelCopyWithImpl<$Res>
    implements _$InvoiceModelCopyWith<$Res> {
  __$InvoiceModelCopyWithImpl(this._self, this._then);

  final _InvoiceModel _self;
  final $Res Function(_InvoiceModel) _then;

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? invoiceId = null,
    Object? postingDate = null,
    Object? status = null,
    Object? grandTotal = null,
    Object? outstandingAmount = null,
    Object? paidAmount = null,
    Object? isReturn = null,
    Object? returnAgainst = freezed,
  }) {
    return _then(_InvoiceModel(
      invoiceId: null == invoiceId
          ? _self.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      postingDate: null == postingDate
          ? _self.postingDate
          : postingDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      grandTotal: null == grandTotal
          ? _self.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      outstandingAmount: null == outstandingAmount
          ? _self.outstandingAmount
          : outstandingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      isReturn: null == isReturn
          ? _self.isReturn
          : isReturn // ignore: cast_nullable_to_non_nullable
              as bool,
      returnAgainst: freezed == returnAgainst
          ? _self.returnAgainst
          : returnAgainst // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
