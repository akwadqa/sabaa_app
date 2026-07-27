// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {
  String get itemCode;
  String get productName;
  String? get productImage;
  String get category;
  double get price;
  String get availableStock;
  String get defaultUom;
  List<UomModel> get uoms;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<ProductModel> get copyWith =>
      _$ProductModelCopyWithImpl<ProductModel>(
          this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductModel &&
            (identical(other.itemCode, itemCode) ||
                other.itemCode == itemCode) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.availableStock, availableStock) ||
                other.availableStock == availableStock) &&
            (identical(other.defaultUom, defaultUom) ||
                other.defaultUom == defaultUom) &&
            const DeepCollectionEquality().equals(other.uoms, uoms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemCode,
      productName,
      productImage,
      category,
      price,
      availableStock,
      defaultUom,
      const DeepCollectionEquality().hash(uoms));

  @override
  String toString() {
    return 'ProductModel(itemCode: $itemCode, productName: $productName, productImage: $productImage, category: $category, price: $price, availableStock: $availableStock, defaultUom: $defaultUom, uoms: $uoms)';
  }
}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) _then) =
      _$ProductModelCopyWithImpl;
  @useResult
  $Res call(
      {String itemCode,
      String productName,
      String? productImage,
      String category,
      double price,
      String availableStock,
      String defaultUom,
      List<UomModel> uoms});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res> implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemCode = null,
    Object? productName = null,
    Object? productImage = freezed,
    Object? category = null,
    Object? price = null,
    Object? availableStock = null,
    Object? defaultUom = null,
    Object? uoms = null,
  }) {
    return _then(_self.copyWith(
      itemCode: null == itemCode
          ? _self.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: freezed == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      availableStock: null == availableStock
          ? _self.availableStock
          : availableStock // ignore: cast_nullable_to_non_nullable
              as String,
      defaultUom: null == defaultUom
          ? _self.defaultUom
          : defaultUom // ignore: cast_nullable_to_non_nullable
              as String,
      uoms: null == uoms
          ? _self.uoms
          : uoms // ignore: cast_nullable_to_non_nullable
              as List<UomModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
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
    TResult Function(_ProductModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
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
    TResult Function(_ProductModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel():
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
    TResult? Function(_ProductModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
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
            String itemCode,
            String productName,
            String? productImage,
            String category,
            double price,
            String availableStock,
            String defaultUom,
            List<UomModel> uoms)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
        return $default(
            _that.itemCode,
            _that.productName,
            _that.productImage,
            _that.category,
            _that.price,
            _that.availableStock,
            _that.defaultUom,
            _that.uoms);
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
            String itemCode,
            String productName,
            String? productImage,
            String category,
            double price,
            String availableStock,
            String defaultUom,
            List<UomModel> uoms)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel():
        return $default(
            _that.itemCode,
            _that.productName,
            _that.productImage,
            _that.category,
            _that.price,
            _that.availableStock,
            _that.defaultUom,
            _that.uoms);
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
            String itemCode,
            String productName,
            String? productImage,
            String category,
            double price,
            String availableStock,
            String defaultUom,
            List<UomModel> uoms)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
        return $default(
            _that.itemCode,
            _that.productName,
            _that.productImage,
            _that.category,
            _that.price,
            _that.availableStock,
            _that.defaultUom,
            _that.uoms);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProductModel implements ProductModel {
  const _ProductModel(
      {required this.itemCode,
      required this.productName,
      this.productImage,
      required this.category,
      required this.price,
      required this.availableStock,
      required this.defaultUom,
      required final List<UomModel> uoms})
      : _uoms = uoms;
  factory _ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  @override
  final String itemCode;
  @override
  final String productName;
  @override
  final String? productImage;
  @override
  final String category;
  @override
  final double price;
  @override
  final String availableStock;
  @override
  final String defaultUom;
  final List<UomModel> _uoms;
  @override
  List<UomModel> get uoms {
    if (_uoms is EqualUnmodifiableListView) return _uoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uoms);
  }

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductModelCopyWith<_ProductModel> get copyWith =>
      __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductModel &&
            (identical(other.itemCode, itemCode) ||
                other.itemCode == itemCode) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.availableStock, availableStock) ||
                other.availableStock == availableStock) &&
            (identical(other.defaultUom, defaultUom) ||
                other.defaultUom == defaultUom) &&
            const DeepCollectionEquality().equals(other._uoms, _uoms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemCode,
      productName,
      productImage,
      category,
      price,
      availableStock,
      defaultUom,
      const DeepCollectionEquality().hash(_uoms));

  @override
  String toString() {
    return 'ProductModel(itemCode: $itemCode, productName: $productName, productImage: $productImage, category: $category, price: $price, availableStock: $availableStock, defaultUom: $defaultUom, uoms: $uoms)';
  }
}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(
          _ProductModel value, $Res Function(_ProductModel) _then) =
      __$ProductModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String itemCode,
      String productName,
      String? productImage,
      String category,
      double price,
      String availableStock,
      String defaultUom,
      List<UomModel> uoms});
}

/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? itemCode = null,
    Object? productName = null,
    Object? productImage = freezed,
    Object? category = null,
    Object? price = null,
    Object? availableStock = null,
    Object? defaultUom = null,
    Object? uoms = null,
  }) {
    return _then(_ProductModel(
      itemCode: null == itemCode
          ? _self.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: freezed == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      availableStock: null == availableStock
          ? _self.availableStock
          : availableStock // ignore: cast_nullable_to_non_nullable
              as String,
      defaultUom: null == defaultUom
          ? _self.defaultUom
          : defaultUom // ignore: cast_nullable_to_non_nullable
              as String,
      uoms: null == uoms
          ? _self._uoms
          : uoms // ignore: cast_nullable_to_non_nullable
              as List<UomModel>,
    ));
  }
}

/// @nodoc
mixin _$UomModel {
  String get uom;
  double get price;
  int get availableStock;

  /// Create a copy of UomModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UomModelCopyWith<UomModel> get copyWith =>
      _$UomModelCopyWithImpl<UomModel>(this as UomModel, _$identity);

  /// Serializes this UomModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UomModel &&
            (identical(other.uom, uom) || other.uom == uom) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.availableStock, availableStock) ||
                other.availableStock == availableStock));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uom, price, availableStock);

  @override
  String toString() {
    return 'UomModel(uom: $uom, price: $price, availableStock: $availableStock)';
  }
}

/// @nodoc
abstract mixin class $UomModelCopyWith<$Res> {
  factory $UomModelCopyWith(UomModel value, $Res Function(UomModel) _then) =
      _$UomModelCopyWithImpl;
  @useResult
  $Res call({String uom, double price, int availableStock});
}

/// @nodoc
class _$UomModelCopyWithImpl<$Res> implements $UomModelCopyWith<$Res> {
  _$UomModelCopyWithImpl(this._self, this._then);

  final UomModel _self;
  final $Res Function(UomModel) _then;

  /// Create a copy of UomModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uom = null,
    Object? price = null,
    Object? availableStock = null,
  }) {
    return _then(_self.copyWith(
      uom: null == uom
          ? _self.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      availableStock: null == availableStock
          ? _self.availableStock
          : availableStock // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [UomModel].
extension UomModelPatterns on UomModel {
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
    TResult Function(_UomModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UomModel() when $default != null:
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
    TResult Function(_UomModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UomModel():
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
    TResult? Function(_UomModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UomModel() when $default != null:
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
    TResult Function(String uom, double price, int availableStock)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UomModel() when $default != null:
        return $default(_that.uom, _that.price, _that.availableStock);
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
    TResult Function(String uom, double price, int availableStock) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UomModel():
        return $default(_that.uom, _that.price, _that.availableStock);
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
    TResult? Function(String uom, double price, int availableStock)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UomModel() when $default != null:
        return $default(_that.uom, _that.price, _that.availableStock);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UomModel implements UomModel {
  const _UomModel(
      {required this.uom, required this.price, required this.availableStock});
  factory _UomModel.fromJson(Map<String, dynamic> json) =>
      _$UomModelFromJson(json);

  @override
  final String uom;
  @override
  final double price;
  @override
  final int availableStock;

  /// Create a copy of UomModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UomModelCopyWith<_UomModel> get copyWith =>
      __$UomModelCopyWithImpl<_UomModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UomModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UomModel &&
            (identical(other.uom, uom) || other.uom == uom) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.availableStock, availableStock) ||
                other.availableStock == availableStock));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uom, price, availableStock);

  @override
  String toString() {
    return 'UomModel(uom: $uom, price: $price, availableStock: $availableStock)';
  }
}

/// @nodoc
abstract mixin class _$UomModelCopyWith<$Res>
    implements $UomModelCopyWith<$Res> {
  factory _$UomModelCopyWith(_UomModel value, $Res Function(_UomModel) _then) =
      __$UomModelCopyWithImpl;
  @override
  @useResult
  $Res call({String uom, double price, int availableStock});
}

/// @nodoc
class __$UomModelCopyWithImpl<$Res> implements _$UomModelCopyWith<$Res> {
  __$UomModelCopyWithImpl(this._self, this._then);

  final _UomModel _self;
  final $Res Function(_UomModel) _then;

  /// Create a copy of UomModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uom = null,
    Object? price = null,
    Object? availableStock = null,
  }) {
    return _then(_UomModel(
      uom: null == uom
          ? _self.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      availableStock: null == availableStock
          ? _self.availableStock
          : availableStock // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
