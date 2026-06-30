// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewOrderModel {
  List<OrderProductModel> get products;
  List<OrderCategoryModel> get categories;

  /// Create a copy of NewOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewOrderModelCopyWith<NewOrderModel> get copyWith =>
      _$NewOrderModelCopyWithImpl<NewOrderModel>(
          this as NewOrderModel, _$identity);

  /// Serializes this NewOrderModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewOrderModel &&
            const DeepCollectionEquality().equals(other.products, products) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(products),
      const DeepCollectionEquality().hash(categories));

  @override
  String toString() {
    return 'NewOrderModel(products: $products, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $NewOrderModelCopyWith<$Res> {
  factory $NewOrderModelCopyWith(
          NewOrderModel value, $Res Function(NewOrderModel) _then) =
      _$NewOrderModelCopyWithImpl;
  @useResult
  $Res call(
      {List<OrderProductModel> products, List<OrderCategoryModel> categories});
}

/// @nodoc
class _$NewOrderModelCopyWithImpl<$Res>
    implements $NewOrderModelCopyWith<$Res> {
  _$NewOrderModelCopyWithImpl(this._self, this._then);

  final NewOrderModel _self;
  final $Res Function(NewOrderModel) _then;

  /// Create a copy of NewOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? categories = null,
  }) {
    return _then(_self.copyWith(
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<OrderProductModel>,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<OrderCategoryModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [NewOrderModel].
extension NewOrderModelPatterns on NewOrderModel {
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
    TResult Function(_NewOrderModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewOrderModel() when $default != null:
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
    TResult Function(_NewOrderModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewOrderModel():
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
    TResult? Function(_NewOrderModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewOrderModel() when $default != null:
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
    TResult Function(List<OrderProductModel> products,
            List<OrderCategoryModel> categories)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewOrderModel() when $default != null:
        return $default(_that.products, _that.categories);
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
    TResult Function(List<OrderProductModel> products,
            List<OrderCategoryModel> categories)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewOrderModel():
        return $default(_that.products, _that.categories);
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
    TResult? Function(List<OrderProductModel> products,
            List<OrderCategoryModel> categories)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewOrderModel() when $default != null:
        return $default(_that.products, _that.categories);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NewOrderModel implements NewOrderModel {
  const _NewOrderModel(
      {required final List<OrderProductModel> products,
      required final List<OrderCategoryModel> categories})
      : _products = products,
        _categories = categories;
  factory _NewOrderModel.fromJson(Map<String, dynamic> json) =>
      _$NewOrderModelFromJson(json);

  final List<OrderProductModel> _products;
  @override
  List<OrderProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<OrderCategoryModel> _categories;
  @override
  List<OrderCategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Create a copy of NewOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewOrderModelCopyWith<_NewOrderModel> get copyWith =>
      __$NewOrderModelCopyWithImpl<_NewOrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NewOrderModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewOrderModel &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_categories));

  @override
  String toString() {
    return 'NewOrderModel(products: $products, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class _$NewOrderModelCopyWith<$Res>
    implements $NewOrderModelCopyWith<$Res> {
  factory _$NewOrderModelCopyWith(
          _NewOrderModel value, $Res Function(_NewOrderModel) _then) =
      __$NewOrderModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<OrderProductModel> products, List<OrderCategoryModel> categories});
}

/// @nodoc
class __$NewOrderModelCopyWithImpl<$Res>
    implements _$NewOrderModelCopyWith<$Res> {
  __$NewOrderModelCopyWithImpl(this._self, this._then);

  final _NewOrderModel _self;
  final $Res Function(_NewOrderModel) _then;

  /// Create a copy of NewOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
    Object? categories = null,
  }) {
    return _then(_NewOrderModel(
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<OrderProductModel>,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<OrderCategoryModel>,
    ));
  }
}

/// @nodoc
mixin _$OrderProductModel {
  String get itemCode;
  String get productName;
  String? get productImage;
  String get category;
  double get price;
  String get availableStock;
  List<UomModel> get uoms;

  /// Create a copy of OrderProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderProductModelCopyWith<OrderProductModel> get copyWith =>
      _$OrderProductModelCopyWithImpl<OrderProductModel>(
          this as OrderProductModel, _$identity);

  /// Serializes this OrderProductModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderProductModel &&
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
      const DeepCollectionEquality().hash(uoms));

  @override
  String toString() {
    return 'OrderProductModel(itemCode: $itemCode, productName: $productName, productImage: $productImage, category: $category, price: $price, availableStock: $availableStock, uoms: $uoms)';
  }
}

/// @nodoc
abstract mixin class $OrderProductModelCopyWith<$Res> {
  factory $OrderProductModelCopyWith(
          OrderProductModel value, $Res Function(OrderProductModel) _then) =
      _$OrderProductModelCopyWithImpl;
  @useResult
  $Res call(
      {String itemCode,
      String productName,
      String? productImage,
      String category,
      double price,
      String availableStock,
      List<UomModel> uoms});
}

/// @nodoc
class _$OrderProductModelCopyWithImpl<$Res>
    implements $OrderProductModelCopyWith<$Res> {
  _$OrderProductModelCopyWithImpl(this._self, this._then);

  final OrderProductModel _self;
  final $Res Function(OrderProductModel) _then;

  /// Create a copy of OrderProductModel
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
      uoms: null == uoms
          ? _self.uoms
          : uoms // ignore: cast_nullable_to_non_nullable
              as List<UomModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrderProductModel].
extension OrderProductModelPatterns on OrderProductModel {
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
    TResult Function(_OrderProductModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderProductModel() when $default != null:
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
    TResult Function(_OrderProductModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderProductModel():
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
    TResult? Function(_OrderProductModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderProductModel() when $default != null:
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
            List<UomModel> uoms)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderProductModel() when $default != null:
        return $default(_that.itemCode, _that.productName, _that.productImage,
            _that.category, _that.price, _that.availableStock, _that.uoms);
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
            List<UomModel> uoms)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderProductModel():
        return $default(_that.itemCode, _that.productName, _that.productImage,
            _that.category, _that.price, _that.availableStock, _that.uoms);
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
            List<UomModel> uoms)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderProductModel() when $default != null:
        return $default(_that.itemCode, _that.productName, _that.productImage,
            _that.category, _that.price, _that.availableStock, _that.uoms);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OrderProductModel implements OrderProductModel {
  const _OrderProductModel(
      {required this.itemCode,
      required this.productName,
      this.productImage,
      required this.category,
      required this.price,
      required this.availableStock,
      required final List<UomModel> uoms})
      : _uoms = uoms;
  factory _OrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$OrderProductModelFromJson(json);

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
  final List<UomModel> _uoms;
  @override
  List<UomModel> get uoms {
    if (_uoms is EqualUnmodifiableListView) return _uoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uoms);
  }

  /// Create a copy of OrderProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderProductModelCopyWith<_OrderProductModel> get copyWith =>
      __$OrderProductModelCopyWithImpl<_OrderProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrderProductModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderProductModel &&
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
      const DeepCollectionEquality().hash(_uoms));

  @override
  String toString() {
    return 'OrderProductModel(itemCode: $itemCode, productName: $productName, productImage: $productImage, category: $category, price: $price, availableStock: $availableStock, uoms: $uoms)';
  }
}

/// @nodoc
abstract mixin class _$OrderProductModelCopyWith<$Res>
    implements $OrderProductModelCopyWith<$Res> {
  factory _$OrderProductModelCopyWith(
          _OrderProductModel value, $Res Function(_OrderProductModel) _then) =
      __$OrderProductModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String itemCode,
      String productName,
      String? productImage,
      String category,
      double price,
      String availableStock,
      List<UomModel> uoms});
}

/// @nodoc
class __$OrderProductModelCopyWithImpl<$Res>
    implements _$OrderProductModelCopyWith<$Res> {
  __$OrderProductModelCopyWithImpl(this._self, this._then);

  final _OrderProductModel _self;
  final $Res Function(_OrderProductModel) _then;

  /// Create a copy of OrderProductModel
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
    Object? uoms = null,
  }) {
    return _then(_OrderProductModel(
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
      uoms: null == uoms
          ? _self._uoms
          : uoms // ignore: cast_nullable_to_non_nullable
              as List<UomModel>,
    ));
  }
}

/// @nodoc
mixin _$OrderCategoryModel {
  String get id;
  String get name;

  /// Create a copy of OrderCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderCategoryModelCopyWith<OrderCategoryModel> get copyWith =>
      _$OrderCategoryModelCopyWithImpl<OrderCategoryModel>(
          this as OrderCategoryModel, _$identity);

  /// Serializes this OrderCategoryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderCategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'OrderCategoryModel(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $OrderCategoryModelCopyWith<$Res> {
  factory $OrderCategoryModelCopyWith(
          OrderCategoryModel value, $Res Function(OrderCategoryModel) _then) =
      _$OrderCategoryModelCopyWithImpl;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$OrderCategoryModelCopyWithImpl<$Res>
    implements $OrderCategoryModelCopyWith<$Res> {
  _$OrderCategoryModelCopyWithImpl(this._self, this._then);

  final OrderCategoryModel _self;
  final $Res Function(OrderCategoryModel) _then;

  /// Create a copy of OrderCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrderCategoryModel].
extension OrderCategoryModelPatterns on OrderCategoryModel {
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
    TResult Function(_OrderCategoryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderCategoryModel() when $default != null:
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
    TResult Function(_OrderCategoryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderCategoryModel():
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
    TResult? Function(_OrderCategoryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderCategoryModel() when $default != null:
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
    TResult Function(String id, String name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderCategoryModel() when $default != null:
        return $default(_that.id, _that.name);
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
    TResult Function(String id, String name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderCategoryModel():
        return $default(_that.id, _that.name);
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
    TResult? Function(String id, String name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderCategoryModel() when $default != null:
        return $default(_that.id, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OrderCategoryModel implements OrderCategoryModel {
  const _OrderCategoryModel({required this.id, required this.name});
  factory _OrderCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderCategoryModelFromJson(json);

  @override
  final String id;
  @override
  final String name;

  /// Create a copy of OrderCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderCategoryModelCopyWith<_OrderCategoryModel> get copyWith =>
      __$OrderCategoryModelCopyWithImpl<_OrderCategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrderCategoryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderCategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'OrderCategoryModel(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$OrderCategoryModelCopyWith<$Res>
    implements $OrderCategoryModelCopyWith<$Res> {
  factory _$OrderCategoryModelCopyWith(
          _OrderCategoryModel value, $Res Function(_OrderCategoryModel) _then) =
      __$OrderCategoryModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$OrderCategoryModelCopyWithImpl<$Res>
    implements _$OrderCategoryModelCopyWith<$Res> {
  __$OrderCategoryModelCopyWithImpl(this._self, this._then);

  final _OrderCategoryModel _self;
  final $Res Function(_OrderCategoryModel) _then;

  /// Create a copy of OrderCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_OrderCategoryModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
