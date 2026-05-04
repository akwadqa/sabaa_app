// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SelectedItem {
  InvoiceItemModel get product;
  int get quantity;
  String get unit;

  /// Create a copy of SelectedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectedItemCopyWith<SelectedItem> get copyWith =>
      _$SelectedItemCopyWithImpl<SelectedItem>(
          this as SelectedItem, _$identity);

  /// Serializes this SelectedItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectedItem &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, product, quantity, unit);

  @override
  String toString() {
    return 'SelectedItem(product: $product, quantity: $quantity, unit: $unit)';
  }
}

/// @nodoc
abstract mixin class $SelectedItemCopyWith<$Res> {
  factory $SelectedItemCopyWith(
          SelectedItem value, $Res Function(SelectedItem) _then) =
      _$SelectedItemCopyWithImpl;
  @useResult
  $Res call({InvoiceItemModel product, int quantity, String unit});

  $InvoiceItemModelCopyWith<$Res> get product;
}

/// @nodoc
class _$SelectedItemCopyWithImpl<$Res> implements $SelectedItemCopyWith<$Res> {
  _$SelectedItemCopyWithImpl(this._self, this._then);

  final SelectedItem _self;
  final $Res Function(SelectedItem) _then;

  /// Create a copy of SelectedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
    Object? unit = null,
  }) {
    return _then(_self.copyWith(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as InvoiceItemModel,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of SelectedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceItemModelCopyWith<$Res> get product {
    return $InvoiceItemModelCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SelectedItem].
extension SelectedItemPatterns on SelectedItem {
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
    TResult Function(_SelectedItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SelectedItem() when $default != null:
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
    TResult Function(_SelectedItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelectedItem():
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
    TResult? Function(_SelectedItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelectedItem() when $default != null:
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
    TResult Function(InvoiceItemModel product, int quantity, String unit)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SelectedItem() when $default != null:
        return $default(_that.product, _that.quantity, _that.unit);
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
    TResult Function(InvoiceItemModel product, int quantity, String unit)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelectedItem():
        return $default(_that.product, _that.quantity, _that.unit);
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
    TResult? Function(InvoiceItemModel product, int quantity, String unit)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelectedItem() when $default != null:
        return $default(_that.product, _that.quantity, _that.unit);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SelectedItem implements SelectedItem {
  const _SelectedItem(
      {required this.product, required this.quantity, required this.unit});
  factory _SelectedItem.fromJson(Map<String, dynamic> json) =>
      _$SelectedItemFromJson(json);

  @override
  final InvoiceItemModel product;
  @override
  final int quantity;
  @override
  final String unit;

  /// Create a copy of SelectedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectedItemCopyWith<_SelectedItem> get copyWith =>
      __$SelectedItemCopyWithImpl<_SelectedItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SelectedItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectedItem &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, product, quantity, unit);

  @override
  String toString() {
    return 'SelectedItem(product: $product, quantity: $quantity, unit: $unit)';
  }
}

/// @nodoc
abstract mixin class _$SelectedItemCopyWith<$Res>
    implements $SelectedItemCopyWith<$Res> {
  factory _$SelectedItemCopyWith(
          _SelectedItem value, $Res Function(_SelectedItem) _then) =
      __$SelectedItemCopyWithImpl;
  @override
  @useResult
  $Res call({InvoiceItemModel product, int quantity, String unit});

  @override
  $InvoiceItemModelCopyWith<$Res> get product;
}

/// @nodoc
class __$SelectedItemCopyWithImpl<$Res>
    implements _$SelectedItemCopyWith<$Res> {
  __$SelectedItemCopyWithImpl(this._self, this._then);

  final _SelectedItem _self;
  final $Res Function(_SelectedItem) _then;

  /// Create a copy of SelectedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
    Object? quantity = null,
    Object? unit = null,
  }) {
    return _then(_SelectedItem(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as InvoiceItemModel,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of SelectedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceItemModelCopyWith<$Res> get product {
    return $InvoiceItemModelCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

// dart format on
