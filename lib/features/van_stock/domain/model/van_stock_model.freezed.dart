// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'van_stock_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VanStockModel {
  String? get warehouse;
  StockStatistics get statistics;
  List<ProductModel> get products;
  List<StockCategoryModel> get categories;

  /// Create a copy of VanStockModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VanStockModelCopyWith<VanStockModel> get copyWith =>
      _$VanStockModelCopyWithImpl<VanStockModel>(
          this as VanStockModel, _$identity);

  /// Serializes this VanStockModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VanStockModel &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            const DeepCollectionEquality().equals(other.products, products) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      warehouse,
      statistics,
      const DeepCollectionEquality().hash(products),
      const DeepCollectionEquality().hash(categories));

  @override
  String toString() {
    return 'VanStockModel(warehouse: $warehouse, statistics: $statistics, products: $products, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $VanStockModelCopyWith<$Res> {
  factory $VanStockModelCopyWith(
          VanStockModel value, $Res Function(VanStockModel) _then) =
      _$VanStockModelCopyWithImpl;
  @useResult
  $Res call(
      {String? warehouse,
      StockStatistics statistics,
      List<ProductModel> products,
      List<StockCategoryModel> categories});

  $StockStatisticsCopyWith<$Res> get statistics;
}

/// @nodoc
class _$VanStockModelCopyWithImpl<$Res>
    implements $VanStockModelCopyWith<$Res> {
  _$VanStockModelCopyWithImpl(this._self, this._then);

  final VanStockModel _self;
  final $Res Function(VanStockModel) _then;

  /// Create a copy of VanStockModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouse = freezed,
    Object? statistics = null,
    Object? products = null,
    Object? categories = null,
  }) {
    return _then(_self.copyWith(
      warehouse: freezed == warehouse
          ? _self.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String?,
      statistics: null == statistics
          ? _self.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as StockStatistics,
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<StockCategoryModel>,
    ));
  }

  /// Create a copy of VanStockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StockStatisticsCopyWith<$Res> get statistics {
    return $StockStatisticsCopyWith<$Res>(_self.statistics, (value) {
      return _then(_self.copyWith(statistics: value));
    });
  }
}

/// Adds pattern-matching-related methods to [VanStockModel].
extension VanStockModelPatterns on VanStockModel {
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
    TResult Function(_VanStockModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VanStockModel() when $default != null:
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
    TResult Function(_VanStockModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VanStockModel():
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
    TResult? Function(_VanStockModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VanStockModel() when $default != null:
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
    TResult Function(String? warehouse, StockStatistics statistics,
            List<ProductModel> products, List<StockCategoryModel> categories)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VanStockModel() when $default != null:
        return $default(_that.warehouse, _that.statistics, _that.products,
            _that.categories);
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
    TResult Function(String? warehouse, StockStatistics statistics,
            List<ProductModel> products, List<StockCategoryModel> categories)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VanStockModel():
        return $default(_that.warehouse, _that.statistics, _that.products,
            _that.categories);
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
    TResult? Function(String? warehouse, StockStatistics statistics,
            List<ProductModel> products, List<StockCategoryModel> categories)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VanStockModel() when $default != null:
        return $default(_that.warehouse, _that.statistics, _that.products,
            _that.categories);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VanStockModel implements VanStockModel {
  const _VanStockModel(
      {required this.warehouse,
      required this.statistics,
      required final List<ProductModel> products,
      required final List<StockCategoryModel> categories})
      : _products = products,
        _categories = categories;
  factory _VanStockModel.fromJson(Map<String, dynamic> json) =>
      _$VanStockModelFromJson(json);

  @override
  final String? warehouse;
  @override
  final StockStatistics statistics;
  final List<ProductModel> _products;
  @override
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<StockCategoryModel> _categories;
  @override
  List<StockCategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Create a copy of VanStockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VanStockModelCopyWith<_VanStockModel> get copyWith =>
      __$VanStockModelCopyWithImpl<_VanStockModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VanStockModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VanStockModel &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      warehouse,
      statistics,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_categories));

  @override
  String toString() {
    return 'VanStockModel(warehouse: $warehouse, statistics: $statistics, products: $products, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class _$VanStockModelCopyWith<$Res>
    implements $VanStockModelCopyWith<$Res> {
  factory _$VanStockModelCopyWith(
          _VanStockModel value, $Res Function(_VanStockModel) _then) =
      __$VanStockModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? warehouse,
      StockStatistics statistics,
      List<ProductModel> products,
      List<StockCategoryModel> categories});

  @override
  $StockStatisticsCopyWith<$Res> get statistics;
}

/// @nodoc
class __$VanStockModelCopyWithImpl<$Res>
    implements _$VanStockModelCopyWith<$Res> {
  __$VanStockModelCopyWithImpl(this._self, this._then);

  final _VanStockModel _self;
  final $Res Function(_VanStockModel) _then;

  /// Create a copy of VanStockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? warehouse = freezed,
    Object? statistics = null,
    Object? products = null,
    Object? categories = null,
  }) {
    return _then(_VanStockModel(
      warehouse: freezed == warehouse
          ? _self.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String?,
      statistics: null == statistics
          ? _self.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as StockStatistics,
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<StockCategoryModel>,
    ));
  }

  /// Create a copy of VanStockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StockStatisticsCopyWith<$Res> get statistics {
    return $StockStatisticsCopyWith<$Res>(_self.statistics, (value) {
      return _then(_self.copyWith(statistics: value));
    });
  }
}

// dart format on
