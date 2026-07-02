// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hyper_market_order_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HyperMarketOrdersSummaryResponse {
  String get customer;
  String get fromDate;
  String get toDate;
  int get totalStock;
  int get netSales;
  List<HyperMarketStockItemModel> get items;

  /// Create a copy of HyperMarketOrdersSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HyperMarketOrdersSummaryResponseCopyWith<HyperMarketOrdersSummaryResponse>
      get copyWith => _$HyperMarketOrdersSummaryResponseCopyWithImpl<
              HyperMarketOrdersSummaryResponse>(
          this as HyperMarketOrdersSummaryResponse, _$identity);

  /// Serializes this HyperMarketOrdersSummaryResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HyperMarketOrdersSummaryResponse &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.totalStock, totalStock) ||
                other.totalStock == totalStock) &&
            (identical(other.netSales, netSales) ||
                other.netSales == netSales) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customer, fromDate, toDate,
      totalStock, netSales, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'HyperMarketOrdersSummaryResponse(customer: $customer, fromDate: $fromDate, toDate: $toDate, totalStock: $totalStock, netSales: $netSales, items: $items)';
  }
}

/// @nodoc
abstract mixin class $HyperMarketOrdersSummaryResponseCopyWith<$Res> {
  factory $HyperMarketOrdersSummaryResponseCopyWith(
          HyperMarketOrdersSummaryResponse value,
          $Res Function(HyperMarketOrdersSummaryResponse) _then) =
      _$HyperMarketOrdersSummaryResponseCopyWithImpl;
  @useResult
  $Res call(
      {String customer,
      String fromDate,
      String toDate,
      int totalStock,
      int netSales,
      List<HyperMarketStockItemModel> items});
}

/// @nodoc
class _$HyperMarketOrdersSummaryResponseCopyWithImpl<$Res>
    implements $HyperMarketOrdersSummaryResponseCopyWith<$Res> {
  _$HyperMarketOrdersSummaryResponseCopyWithImpl(this._self, this._then);

  final HyperMarketOrdersSummaryResponse _self;
  final $Res Function(HyperMarketOrdersSummaryResponse) _then;

  /// Create a copy of HyperMarketOrdersSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? fromDate = null,
    Object? toDate = null,
    Object? totalStock = null,
    Object? netSales = null,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      customer: null == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      fromDate: null == fromDate
          ? _self.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as String,
      toDate: null == toDate
          ? _self.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as String,
      totalStock: null == totalStock
          ? _self.totalStock
          : totalStock // ignore: cast_nullable_to_non_nullable
              as int,
      netSales: null == netSales
          ? _self.netSales
          : netSales // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<HyperMarketStockItemModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [HyperMarketOrdersSummaryResponse].
extension HyperMarketOrdersSummaryResponsePatterns
    on HyperMarketOrdersSummaryResponse {
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
    TResult Function(_HyperMarketOrdersSummaryResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HyperMarketOrdersSummaryResponse() when $default != null:
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
    TResult Function(_HyperMarketOrdersSummaryResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HyperMarketOrdersSummaryResponse():
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
    TResult? Function(_HyperMarketOrdersSummaryResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HyperMarketOrdersSummaryResponse() when $default != null:
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
            String customer,
            String fromDate,
            String toDate,
            int totalStock,
            int netSales,
            List<HyperMarketStockItemModel> items)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HyperMarketOrdersSummaryResponse() when $default != null:
        return $default(_that.customer, _that.fromDate, _that.toDate,
            _that.totalStock, _that.netSales, _that.items);
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
    TResult Function(String customer, String fromDate, String toDate,
            int totalStock, int netSales, List<HyperMarketStockItemModel> items)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HyperMarketOrdersSummaryResponse():
        return $default(_that.customer, _that.fromDate, _that.toDate,
            _that.totalStock, _that.netSales, _that.items);
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
            String customer,
            String fromDate,
            String toDate,
            int totalStock,
            int netSales,
            List<HyperMarketStockItemModel> items)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HyperMarketOrdersSummaryResponse() when $default != null:
        return $default(_that.customer, _that.fromDate, _that.toDate,
            _that.totalStock, _that.netSales, _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HyperMarketOrdersSummaryResponse
    implements HyperMarketOrdersSummaryResponse {
  const _HyperMarketOrdersSummaryResponse(
      {required this.customer,
      required this.fromDate,
      required this.toDate,
      required this.totalStock,
      required this.netSales,
      required final List<HyperMarketStockItemModel> items})
      : _items = items;
  factory _HyperMarketOrdersSummaryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$HyperMarketOrdersSummaryResponseFromJson(json);

  @override
  final String customer;
  @override
  final String fromDate;
  @override
  final String toDate;
  @override
  final int totalStock;
  @override
  final int netSales;
  final List<HyperMarketStockItemModel> _items;
  @override
  List<HyperMarketStockItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of HyperMarketOrdersSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HyperMarketOrdersSummaryResponseCopyWith<_HyperMarketOrdersSummaryResponse>
      get copyWith => __$HyperMarketOrdersSummaryResponseCopyWithImpl<
          _HyperMarketOrdersSummaryResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HyperMarketOrdersSummaryResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HyperMarketOrdersSummaryResponse &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.totalStock, totalStock) ||
                other.totalStock == totalStock) &&
            (identical(other.netSales, netSales) ||
                other.netSales == netSales) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customer, fromDate, toDate,
      totalStock, netSales, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'HyperMarketOrdersSummaryResponse(customer: $customer, fromDate: $fromDate, toDate: $toDate, totalStock: $totalStock, netSales: $netSales, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$HyperMarketOrdersSummaryResponseCopyWith<$Res>
    implements $HyperMarketOrdersSummaryResponseCopyWith<$Res> {
  factory _$HyperMarketOrdersSummaryResponseCopyWith(
          _HyperMarketOrdersSummaryResponse value,
          $Res Function(_HyperMarketOrdersSummaryResponse) _then) =
      __$HyperMarketOrdersSummaryResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String customer,
      String fromDate,
      String toDate,
      int totalStock,
      int netSales,
      List<HyperMarketStockItemModel> items});
}

/// @nodoc
class __$HyperMarketOrdersSummaryResponseCopyWithImpl<$Res>
    implements _$HyperMarketOrdersSummaryResponseCopyWith<$Res> {
  __$HyperMarketOrdersSummaryResponseCopyWithImpl(this._self, this._then);

  final _HyperMarketOrdersSummaryResponse _self;
  final $Res Function(_HyperMarketOrdersSummaryResponse) _then;

  /// Create a copy of HyperMarketOrdersSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? customer = null,
    Object? fromDate = null,
    Object? toDate = null,
    Object? totalStock = null,
    Object? netSales = null,
    Object? items = null,
  }) {
    return _then(_HyperMarketOrdersSummaryResponse(
      customer: null == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      fromDate: null == fromDate
          ? _self.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as String,
      toDate: null == toDate
          ? _self.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as String,
      totalStock: null == totalStock
          ? _self.totalStock
          : totalStock // ignore: cast_nullable_to_non_nullable
              as int,
      netSales: null == netSales
          ? _self.netSales
          : netSales // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<HyperMarketStockItemModel>,
    ));
  }
}

/// @nodoc
mixin _$HyperMarketStockItemModel {
  String get itemCode;
  String get itemName;
  String? get itemImage;
  String get totalQty;
  List<String> get availableUoms;

  /// Create a copy of HyperMarketStockItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HyperMarketStockItemModelCopyWith<HyperMarketStockItemModel> get copyWith =>
      _$HyperMarketStockItemModelCopyWithImpl<HyperMarketStockItemModel>(
          this as HyperMarketStockItemModel, _$identity);

  /// Serializes this HyperMarketStockItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HyperMarketStockItemModel &&
            (identical(other.itemCode, itemCode) ||
                other.itemCode == itemCode) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.itemImage, itemImage) ||
                other.itemImage == itemImage) &&
            (identical(other.totalQty, totalQty) ||
                other.totalQty == totalQty) &&
            const DeepCollectionEquality()
                .equals(other.availableUoms, availableUoms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemCode, itemName, itemImage,
      totalQty, const DeepCollectionEquality().hash(availableUoms));

  @override
  String toString() {
    return 'HyperMarketStockItemModel(itemCode: $itemCode, itemName: $itemName, itemImage: $itemImage, totalQty: $totalQty, availableUoms: $availableUoms)';
  }
}

/// @nodoc
abstract mixin class $HyperMarketStockItemModelCopyWith<$Res> {
  factory $HyperMarketStockItemModelCopyWith(HyperMarketStockItemModel value,
          $Res Function(HyperMarketStockItemModel) _then) =
      _$HyperMarketStockItemModelCopyWithImpl;
  @useResult
  $Res call(
      {String itemCode,
      String itemName,
      String? itemImage,
      String totalQty,
      List<String> availableUoms});
}

/// @nodoc
class _$HyperMarketStockItemModelCopyWithImpl<$Res>
    implements $HyperMarketStockItemModelCopyWith<$Res> {
  _$HyperMarketStockItemModelCopyWithImpl(this._self, this._then);

  final HyperMarketStockItemModel _self;
  final $Res Function(HyperMarketStockItemModel) _then;

  /// Create a copy of HyperMarketStockItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemCode = null,
    Object? itemName = null,
    Object? itemImage = freezed,
    Object? totalQty = null,
    Object? availableUoms = null,
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
      itemImage: freezed == itemImage
          ? _self.itemImage
          : itemImage // ignore: cast_nullable_to_non_nullable
              as String?,
      totalQty: null == totalQty
          ? _self.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as String,
      availableUoms: null == availableUoms
          ? _self.availableUoms
          : availableUoms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [HyperMarketStockItemModel].
extension HyperMarketStockItemModelPatterns on HyperMarketStockItemModel {
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
    TResult Function(_HyperMarketStockItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HyperMarketStockItemModel() when $default != null:
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
    TResult Function(_HyperMarketStockItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HyperMarketStockItemModel():
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
    TResult? Function(_HyperMarketStockItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HyperMarketStockItemModel() when $default != null:
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
    TResult Function(String itemCode, String itemName, String? itemImage,
            String totalQty, List<String> availableUoms)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HyperMarketStockItemModel() when $default != null:
        return $default(_that.itemCode, _that.itemName, _that.itemImage,
            _that.totalQty, _that.availableUoms);
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
    TResult Function(String itemCode, String itemName, String? itemImage,
            String totalQty, List<String> availableUoms)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HyperMarketStockItemModel():
        return $default(_that.itemCode, _that.itemName, _that.itemImage,
            _that.totalQty, _that.availableUoms);
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
    TResult? Function(String itemCode, String itemName, String? itemImage,
            String totalQty, List<String> availableUoms)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HyperMarketStockItemModel() when $default != null:
        return $default(_that.itemCode, _that.itemName, _that.itemImage,
            _that.totalQty, _that.availableUoms);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HyperMarketStockItemModel implements HyperMarketStockItemModel {
  const _HyperMarketStockItemModel(
      {required this.itemCode,
      required this.itemName,
      required this.itemImage,
      required this.totalQty,
      required final List<String> availableUoms})
      : _availableUoms = availableUoms;
  factory _HyperMarketStockItemModel.fromJson(Map<String, dynamic> json) =>
      _$HyperMarketStockItemModelFromJson(json);

  @override
  final String itemCode;
  @override
  final String itemName;
  @override
  final String? itemImage;
  @override
  final String totalQty;
  final List<String> _availableUoms;
  @override
  List<String> get availableUoms {
    if (_availableUoms is EqualUnmodifiableListView) return _availableUoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableUoms);
  }

  /// Create a copy of HyperMarketStockItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HyperMarketStockItemModelCopyWith<_HyperMarketStockItemModel>
      get copyWith =>
          __$HyperMarketStockItemModelCopyWithImpl<_HyperMarketStockItemModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HyperMarketStockItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HyperMarketStockItemModel &&
            (identical(other.itemCode, itemCode) ||
                other.itemCode == itemCode) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.itemImage, itemImage) ||
                other.itemImage == itemImage) &&
            (identical(other.totalQty, totalQty) ||
                other.totalQty == totalQty) &&
            const DeepCollectionEquality()
                .equals(other._availableUoms, _availableUoms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemCode, itemName, itemImage,
      totalQty, const DeepCollectionEquality().hash(_availableUoms));

  @override
  String toString() {
    return 'HyperMarketStockItemModel(itemCode: $itemCode, itemName: $itemName, itemImage: $itemImage, totalQty: $totalQty, availableUoms: $availableUoms)';
  }
}

/// @nodoc
abstract mixin class _$HyperMarketStockItemModelCopyWith<$Res>
    implements $HyperMarketStockItemModelCopyWith<$Res> {
  factory _$HyperMarketStockItemModelCopyWith(_HyperMarketStockItemModel value,
          $Res Function(_HyperMarketStockItemModel) _then) =
      __$HyperMarketStockItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String itemCode,
      String itemName,
      String? itemImage,
      String totalQty,
      List<String> availableUoms});
}

/// @nodoc
class __$HyperMarketStockItemModelCopyWithImpl<$Res>
    implements _$HyperMarketStockItemModelCopyWith<$Res> {
  __$HyperMarketStockItemModelCopyWithImpl(this._self, this._then);

  final _HyperMarketStockItemModel _self;
  final $Res Function(_HyperMarketStockItemModel) _then;

  /// Create a copy of HyperMarketStockItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? itemCode = null,
    Object? itemName = null,
    Object? itemImage = freezed,
    Object? totalQty = null,
    Object? availableUoms = null,
  }) {
    return _then(_HyperMarketStockItemModel(
      itemCode: null == itemCode
          ? _self.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _self.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      itemImage: freezed == itemImage
          ? _self.itemImage
          : itemImage // ignore: cast_nullable_to_non_nullable
              as String?,
      totalQty: null == totalQty
          ? _self.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as String,
      availableUoms: null == availableUoms
          ? _self._availableUoms
          : availableUoms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
