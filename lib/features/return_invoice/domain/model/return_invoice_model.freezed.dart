// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_invoice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReturnInvoiceModel {
  String get invoiceId;
  String get customer;
  String get customerName;
  String get status;
  String get postingDate;
  num get grandTotal;
  num get totalTaxesAndCharges;
  num get outstandingAmount;
  num get paidAmount;
  bool get isReturn;
  String? get returnAgainst;
  List<InvoiceItemModel> get items;
  List<String> get paymentReferences;

  /// Create a copy of ReturnInvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReturnInvoiceModelCopyWith<ReturnInvoiceModel> get copyWith =>
      _$ReturnInvoiceModelCopyWithImpl<ReturnInvoiceModel>(
          this as ReturnInvoiceModel, _$identity);

  /// Serializes this ReturnInvoiceModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReturnInvoiceModel &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.postingDate, postingDate) ||
                other.postingDate == postingDate) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.totalTaxesAndCharges, totalTaxesAndCharges) ||
                other.totalTaxesAndCharges == totalTaxesAndCharges) &&
            (identical(other.outstandingAmount, outstandingAmount) ||
                other.outstandingAmount == outstandingAmount) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.isReturn, isReturn) ||
                other.isReturn == isReturn) &&
            (identical(other.returnAgainst, returnAgainst) ||
                other.returnAgainst == returnAgainst) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality()
                .equals(other.paymentReferences, paymentReferences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      invoiceId,
      customer,
      customerName,
      status,
      postingDate,
      grandTotal,
      totalTaxesAndCharges,
      outstandingAmount,
      paidAmount,
      isReturn,
      returnAgainst,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(paymentReferences));

  @override
  String toString() {
    return 'ReturnInvoiceModel(invoiceId: $invoiceId, customer: $customer, customerName: $customerName, status: $status, postingDate: $postingDate, grandTotal: $grandTotal, totalTaxesAndCharges: $totalTaxesAndCharges, outstandingAmount: $outstandingAmount, paidAmount: $paidAmount, isReturn: $isReturn, returnAgainst: $returnAgainst, items: $items, paymentReferences: $paymentReferences)';
  }
}

/// @nodoc
abstract mixin class $ReturnInvoiceModelCopyWith<$Res> {
  factory $ReturnInvoiceModelCopyWith(
          ReturnInvoiceModel value, $Res Function(ReturnInvoiceModel) _then) =
      _$ReturnInvoiceModelCopyWithImpl;
  @useResult
  $Res call(
      {String invoiceId,
      String customer,
      String customerName,
      String status,
      String postingDate,
      num grandTotal,
      num totalTaxesAndCharges,
      num outstandingAmount,
      num paidAmount,
      bool isReturn,
      String? returnAgainst,
      List<InvoiceItemModel> items,
      List<String> paymentReferences});
}

/// @nodoc
class _$ReturnInvoiceModelCopyWithImpl<$Res>
    implements $ReturnInvoiceModelCopyWith<$Res> {
  _$ReturnInvoiceModelCopyWithImpl(this._self, this._then);

  final ReturnInvoiceModel _self;
  final $Res Function(ReturnInvoiceModel) _then;

  /// Create a copy of ReturnInvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceId = null,
    Object? customer = null,
    Object? customerName = null,
    Object? status = null,
    Object? postingDate = null,
    Object? grandTotal = null,
    Object? totalTaxesAndCharges = null,
    Object? outstandingAmount = null,
    Object? paidAmount = null,
    Object? isReturn = null,
    Object? returnAgainst = freezed,
    Object? items = null,
    Object? paymentReferences = null,
  }) {
    return _then(_self.copyWith(
      invoiceId: null == invoiceId
          ? _self.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      customer: null == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      postingDate: null == postingDate
          ? _self.postingDate
          : postingDate // ignore: cast_nullable_to_non_nullable
              as String,
      grandTotal: null == grandTotal
          ? _self.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as num,
      totalTaxesAndCharges: null == totalTaxesAndCharges
          ? _self.totalTaxesAndCharges
          : totalTaxesAndCharges // ignore: cast_nullable_to_non_nullable
              as num,
      outstandingAmount: null == outstandingAmount
          ? _self.outstandingAmount
          : outstandingAmount // ignore: cast_nullable_to_non_nullable
              as num,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as num,
      isReturn: null == isReturn
          ? _self.isReturn
          : isReturn // ignore: cast_nullable_to_non_nullable
              as bool,
      returnAgainst: freezed == returnAgainst
          ? _self.returnAgainst
          : returnAgainst // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InvoiceItemModel>,
      paymentReferences: null == paymentReferences
          ? _self.paymentReferences
          : paymentReferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReturnInvoiceModel].
extension ReturnInvoiceModelPatterns on ReturnInvoiceModel {
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
    TResult Function(_ReturnInvoiceModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReturnInvoiceModel() when $default != null:
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
    TResult Function(_ReturnInvoiceModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReturnInvoiceModel():
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
    TResult? Function(_ReturnInvoiceModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReturnInvoiceModel() when $default != null:
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
            String invoiceId,
            String customer,
            String customerName,
            String status,
            String postingDate,
            num grandTotal,
            num totalTaxesAndCharges,
            num outstandingAmount,
            num paidAmount,
            bool isReturn,
            String? returnAgainst,
            List<InvoiceItemModel> items,
            List<String> paymentReferences)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReturnInvoiceModel() when $default != null:
        return $default(
            _that.invoiceId,
            _that.customer,
            _that.customerName,
            _that.status,
            _that.postingDate,
            _that.grandTotal,
            _that.totalTaxesAndCharges,
            _that.outstandingAmount,
            _that.paidAmount,
            _that.isReturn,
            _that.returnAgainst,
            _that.items,
            _that.paymentReferences);
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
            String invoiceId,
            String customer,
            String customerName,
            String status,
            String postingDate,
            num grandTotal,
            num totalTaxesAndCharges,
            num outstandingAmount,
            num paidAmount,
            bool isReturn,
            String? returnAgainst,
            List<InvoiceItemModel> items,
            List<String> paymentReferences)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReturnInvoiceModel():
        return $default(
            _that.invoiceId,
            _that.customer,
            _that.customerName,
            _that.status,
            _that.postingDate,
            _that.grandTotal,
            _that.totalTaxesAndCharges,
            _that.outstandingAmount,
            _that.paidAmount,
            _that.isReturn,
            _that.returnAgainst,
            _that.items,
            _that.paymentReferences);
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
            String invoiceId,
            String customer,
            String customerName,
            String status,
            String postingDate,
            num grandTotal,
            num totalTaxesAndCharges,
            num outstandingAmount,
            num paidAmount,
            bool isReturn,
            String? returnAgainst,
            List<InvoiceItemModel> items,
            List<String> paymentReferences)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReturnInvoiceModel() when $default != null:
        return $default(
            _that.invoiceId,
            _that.customer,
            _that.customerName,
            _that.status,
            _that.postingDate,
            _that.grandTotal,
            _that.totalTaxesAndCharges,
            _that.outstandingAmount,
            _that.paidAmount,
            _that.isReturn,
            _that.returnAgainst,
            _that.items,
            _that.paymentReferences);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReturnInvoiceModel implements ReturnInvoiceModel {
  const _ReturnInvoiceModel(
      {required this.invoiceId,
      required this.customer,
      required this.customerName,
      required this.status,
      required this.postingDate,
      required this.grandTotal,
      required this.totalTaxesAndCharges,
      required this.outstandingAmount,
      required this.paidAmount,
      required this.isReturn,
      this.returnAgainst,
      required final List<InvoiceItemModel> items,
      required final List<String> paymentReferences})
      : _items = items,
        _paymentReferences = paymentReferences;
  factory _ReturnInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnInvoiceModelFromJson(json);

  @override
  final String invoiceId;
  @override
  final String customer;
  @override
  final String customerName;
  @override
  final String status;
  @override
  final String postingDate;
  @override
  final num grandTotal;
  @override
  final num totalTaxesAndCharges;
  @override
  final num outstandingAmount;
  @override
  final num paidAmount;
  @override
  final bool isReturn;
  @override
  final String? returnAgainst;
  final List<InvoiceItemModel> _items;
  @override
  List<InvoiceItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<String> _paymentReferences;
  @override
  List<String> get paymentReferences {
    if (_paymentReferences is EqualUnmodifiableListView)
      return _paymentReferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentReferences);
  }

  /// Create a copy of ReturnInvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReturnInvoiceModelCopyWith<_ReturnInvoiceModel> get copyWith =>
      __$ReturnInvoiceModelCopyWithImpl<_ReturnInvoiceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReturnInvoiceModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReturnInvoiceModel &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.postingDate, postingDate) ||
                other.postingDate == postingDate) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.totalTaxesAndCharges, totalTaxesAndCharges) ||
                other.totalTaxesAndCharges == totalTaxesAndCharges) &&
            (identical(other.outstandingAmount, outstandingAmount) ||
                other.outstandingAmount == outstandingAmount) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.isReturn, isReturn) ||
                other.isReturn == isReturn) &&
            (identical(other.returnAgainst, returnAgainst) ||
                other.returnAgainst == returnAgainst) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._paymentReferences, _paymentReferences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      invoiceId,
      customer,
      customerName,
      status,
      postingDate,
      grandTotal,
      totalTaxesAndCharges,
      outstandingAmount,
      paidAmount,
      isReturn,
      returnAgainst,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_paymentReferences));

  @override
  String toString() {
    return 'ReturnInvoiceModel(invoiceId: $invoiceId, customer: $customer, customerName: $customerName, status: $status, postingDate: $postingDate, grandTotal: $grandTotal, totalTaxesAndCharges: $totalTaxesAndCharges, outstandingAmount: $outstandingAmount, paidAmount: $paidAmount, isReturn: $isReturn, returnAgainst: $returnAgainst, items: $items, paymentReferences: $paymentReferences)';
  }
}

/// @nodoc
abstract mixin class _$ReturnInvoiceModelCopyWith<$Res>
    implements $ReturnInvoiceModelCopyWith<$Res> {
  factory _$ReturnInvoiceModelCopyWith(
          _ReturnInvoiceModel value, $Res Function(_ReturnInvoiceModel) _then) =
      __$ReturnInvoiceModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String invoiceId,
      String customer,
      String customerName,
      String status,
      String postingDate,
      num grandTotal,
      num totalTaxesAndCharges,
      num outstandingAmount,
      num paidAmount,
      bool isReturn,
      String? returnAgainst,
      List<InvoiceItemModel> items,
      List<String> paymentReferences});
}

/// @nodoc
class __$ReturnInvoiceModelCopyWithImpl<$Res>
    implements _$ReturnInvoiceModelCopyWith<$Res> {
  __$ReturnInvoiceModelCopyWithImpl(this._self, this._then);

  final _ReturnInvoiceModel _self;
  final $Res Function(_ReturnInvoiceModel) _then;

  /// Create a copy of ReturnInvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? invoiceId = null,
    Object? customer = null,
    Object? customerName = null,
    Object? status = null,
    Object? postingDate = null,
    Object? grandTotal = null,
    Object? totalTaxesAndCharges = null,
    Object? outstandingAmount = null,
    Object? paidAmount = null,
    Object? isReturn = null,
    Object? returnAgainst = freezed,
    Object? items = null,
    Object? paymentReferences = null,
  }) {
    return _then(_ReturnInvoiceModel(
      invoiceId: null == invoiceId
          ? _self.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      customer: null == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      postingDate: null == postingDate
          ? _self.postingDate
          : postingDate // ignore: cast_nullable_to_non_nullable
              as String,
      grandTotal: null == grandTotal
          ? _self.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as num,
      totalTaxesAndCharges: null == totalTaxesAndCharges
          ? _self.totalTaxesAndCharges
          : totalTaxesAndCharges // ignore: cast_nullable_to_non_nullable
              as num,
      outstandingAmount: null == outstandingAmount
          ? _self.outstandingAmount
          : outstandingAmount // ignore: cast_nullable_to_non_nullable
              as num,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as num,
      isReturn: null == isReturn
          ? _self.isReturn
          : isReturn // ignore: cast_nullable_to_non_nullable
              as bool,
      returnAgainst: freezed == returnAgainst
          ? _self.returnAgainst
          : returnAgainst // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InvoiceItemModel>,
      paymentReferences: null == paymentReferences
          ? _self._paymentReferences
          : paymentReferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$InvoiceItemModel {
  String get itemCode;
  String get itemName;
  int get qty;
  String get uom;
  num get rate;
  num get amount;
  num get discountPercentage;
  String? get warehouse;

  /// Create a copy of InvoiceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceItemModelCopyWith<InvoiceItemModel> get copyWith =>
      _$InvoiceItemModelCopyWithImpl<InvoiceItemModel>(
          this as InvoiceItemModel, _$identity);

  /// Serializes this InvoiceItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceItemModel &&
            (identical(other.itemCode, itemCode) ||
                other.itemCode == itemCode) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.uom, uom) || other.uom == uom) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemCode, itemName, qty, uom,
      rate, amount, discountPercentage, warehouse);

  @override
  String toString() {
    return 'InvoiceItemModel(itemCode: $itemCode, itemName: $itemName, qty: $qty, uom: $uom, rate: $rate, amount: $amount, discountPercentage: $discountPercentage, warehouse: $warehouse)';
  }
}

/// @nodoc
abstract mixin class $InvoiceItemModelCopyWith<$Res> {
  factory $InvoiceItemModelCopyWith(
          InvoiceItemModel value, $Res Function(InvoiceItemModel) _then) =
      _$InvoiceItemModelCopyWithImpl;
  @useResult
  $Res call(
      {String itemCode,
      String itemName,
      int qty,
      String uom,
      num rate,
      num amount,
      num discountPercentage,
      String? warehouse});
}

/// @nodoc
class _$InvoiceItemModelCopyWithImpl<$Res>
    implements $InvoiceItemModelCopyWith<$Res> {
  _$InvoiceItemModelCopyWithImpl(this._self, this._then);

  final InvoiceItemModel _self;
  final $Res Function(InvoiceItemModel) _then;

  /// Create a copy of InvoiceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemCode = null,
    Object? itemName = null,
    Object? qty = null,
    Object? uom = null,
    Object? rate = null,
    Object? amount = null,
    Object? discountPercentage = null,
    Object? warehouse = freezed,
  }) {
    return _then(_self.copyWith(
      itemCode: null == itemCode
          ? _self.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _self.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _self.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      uom: null == uom
          ? _self.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as num,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      discountPercentage: null == discountPercentage
          ? _self.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      warehouse: freezed == warehouse
          ? _self.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [InvoiceItemModel].
extension InvoiceItemModelPatterns on InvoiceItemModel {
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
    TResult Function(_InvoiceItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceItemModel() when $default != null:
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
    TResult Function(_InvoiceItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceItemModel():
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
    TResult? Function(_InvoiceItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceItemModel() when $default != null:
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
    TResult Function(String itemCode, String itemName, int qty, String uom,
            num rate, num amount, num discountPercentage, String? warehouse)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceItemModel() when $default != null:
        return $default(
            _that.itemCode,
            _that.itemName,
            _that.qty,
            _that.uom,
            _that.rate,
            _that.amount,
            _that.discountPercentage,
            _that.warehouse);
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
    TResult Function(String itemCode, String itemName, int qty, String uom,
            num rate, num amount, num discountPercentage, String? warehouse)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceItemModel():
        return $default(
            _that.itemCode,
            _that.itemName,
            _that.qty,
            _that.uom,
            _that.rate,
            _that.amount,
            _that.discountPercentage,
            _that.warehouse);
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
    TResult? Function(String itemCode, String itemName, int qty, String uom,
            num rate, num amount, num discountPercentage, String? warehouse)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceItemModel() when $default != null:
        return $default(
            _that.itemCode,
            _that.itemName,
            _that.qty,
            _that.uom,
            _that.rate,
            _that.amount,
            _that.discountPercentage,
            _that.warehouse);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InvoiceItemModel implements InvoiceItemModel {
  const _InvoiceItemModel(
      {required this.itemCode,
      required this.itemName,
      required this.qty,
      required this.uom,
      required this.rate,
      required this.amount,
      required this.discountPercentage,
      required this.warehouse});
  factory _InvoiceItemModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceItemModelFromJson(json);

  @override
  final String itemCode;
  @override
  final String itemName;
  @override
  final int qty;
  @override
  final String uom;
  @override
  final num rate;
  @override
  final num amount;
  @override
  final num discountPercentage;
  @override
  final String? warehouse;

  /// Create a copy of InvoiceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceItemModelCopyWith<_InvoiceItemModel> get copyWith =>
      __$InvoiceItemModelCopyWithImpl<_InvoiceItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InvoiceItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceItemModel &&
            (identical(other.itemCode, itemCode) ||
                other.itemCode == itemCode) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.uom, uom) || other.uom == uom) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemCode, itemName, qty, uom,
      rate, amount, discountPercentage, warehouse);

  @override
  String toString() {
    return 'InvoiceItemModel(itemCode: $itemCode, itemName: $itemName, qty: $qty, uom: $uom, rate: $rate, amount: $amount, discountPercentage: $discountPercentage, warehouse: $warehouse)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceItemModelCopyWith<$Res>
    implements $InvoiceItemModelCopyWith<$Res> {
  factory _$InvoiceItemModelCopyWith(
          _InvoiceItemModel value, $Res Function(_InvoiceItemModel) _then) =
      __$InvoiceItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String itemCode,
      String itemName,
      int qty,
      String uom,
      num rate,
      num amount,
      num discountPercentage,
      String? warehouse});
}

/// @nodoc
class __$InvoiceItemModelCopyWithImpl<$Res>
    implements _$InvoiceItemModelCopyWith<$Res> {
  __$InvoiceItemModelCopyWithImpl(this._self, this._then);

  final _InvoiceItemModel _self;
  final $Res Function(_InvoiceItemModel) _then;

  /// Create a copy of InvoiceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? itemCode = null,
    Object? itemName = null,
    Object? qty = null,
    Object? uom = null,
    Object? rate = null,
    Object? amount = null,
    Object? discountPercentage = null,
    Object? warehouse = freezed,
  }) {
    return _then(_InvoiceItemModel(
      itemCode: null == itemCode
          ? _self.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _self.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _self.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      uom: null == uom
          ? _self.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as num,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      discountPercentage: null == discountPercentage
          ? _self.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      warehouse: freezed == warehouse
          ? _self.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
