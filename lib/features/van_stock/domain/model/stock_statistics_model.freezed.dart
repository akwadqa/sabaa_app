// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_statistics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockStatistics {
  int get totalStockItems;
  double get totalStockValue;
  int get lowStockItems;

  /// Create a copy of StockStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StockStatisticsCopyWith<StockStatistics> get copyWith =>
      _$StockStatisticsCopyWithImpl<StockStatistics>(
          this as StockStatistics, _$identity);

  /// Serializes this StockStatistics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StockStatistics &&
            (identical(other.totalStockItems, totalStockItems) ||
                other.totalStockItems == totalStockItems) &&
            (identical(other.totalStockValue, totalStockValue) ||
                other.totalStockValue == totalStockValue) &&
            (identical(other.lowStockItems, lowStockItems) ||
                other.lowStockItems == lowStockItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalStockItems, totalStockValue, lowStockItems);

  @override
  String toString() {
    return 'StockStatistics(totalStockItems: $totalStockItems, totalStockValue: $totalStockValue, lowStockItems: $lowStockItems)';
  }
}

/// @nodoc
abstract mixin class $StockStatisticsCopyWith<$Res> {
  factory $StockStatisticsCopyWith(
          StockStatistics value, $Res Function(StockStatistics) _then) =
      _$StockStatisticsCopyWithImpl;
  @useResult
  $Res call({int totalStockItems, double totalStockValue, int lowStockItems});
}

/// @nodoc
class _$StockStatisticsCopyWithImpl<$Res>
    implements $StockStatisticsCopyWith<$Res> {
  _$StockStatisticsCopyWithImpl(this._self, this._then);

  final StockStatistics _self;
  final $Res Function(StockStatistics) _then;

  /// Create a copy of StockStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalStockItems = null,
    Object? totalStockValue = null,
    Object? lowStockItems = null,
  }) {
    return _then(_self.copyWith(
      totalStockItems: null == totalStockItems
          ? _self.totalStockItems
          : totalStockItems // ignore: cast_nullable_to_non_nullable
              as int,
      totalStockValue: null == totalStockValue
          ? _self.totalStockValue
          : totalStockValue // ignore: cast_nullable_to_non_nullable
              as double,
      lowStockItems: null == lowStockItems
          ? _self.lowStockItems
          : lowStockItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [StockStatistics].
extension StockStatisticsPatterns on StockStatistics {
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
    TResult Function(_StockStatistics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StockStatistics() when $default != null:
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
    TResult Function(_StockStatistics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockStatistics():
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
    TResult? Function(_StockStatistics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockStatistics() when $default != null:
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
            int totalStockItems, double totalStockValue, int lowStockItems)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StockStatistics() when $default != null:
        return $default(
            _that.totalStockItems, _that.totalStockValue, _that.lowStockItems);
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
            int totalStockItems, double totalStockValue, int lowStockItems)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockStatistics():
        return $default(
            _that.totalStockItems, _that.totalStockValue, _that.lowStockItems);
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
            int totalStockItems, double totalStockValue, int lowStockItems)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockStatistics() when $default != null:
        return $default(
            _that.totalStockItems, _that.totalStockValue, _that.lowStockItems);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _StockStatistics implements StockStatistics {
  const _StockStatistics(
      {required this.totalStockItems,
      required this.totalStockValue,
      required this.lowStockItems});
  factory _StockStatistics.fromJson(Map<String, dynamic> json) =>
      _$StockStatisticsFromJson(json);

  @override
  final int totalStockItems;
  @override
  final double totalStockValue;
  @override
  final int lowStockItems;

  /// Create a copy of StockStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StockStatisticsCopyWith<_StockStatistics> get copyWith =>
      __$StockStatisticsCopyWithImpl<_StockStatistics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StockStatisticsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StockStatistics &&
            (identical(other.totalStockItems, totalStockItems) ||
                other.totalStockItems == totalStockItems) &&
            (identical(other.totalStockValue, totalStockValue) ||
                other.totalStockValue == totalStockValue) &&
            (identical(other.lowStockItems, lowStockItems) ||
                other.lowStockItems == lowStockItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalStockItems, totalStockValue, lowStockItems);

  @override
  String toString() {
    return 'StockStatistics(totalStockItems: $totalStockItems, totalStockValue: $totalStockValue, lowStockItems: $lowStockItems)';
  }
}

/// @nodoc
abstract mixin class _$StockStatisticsCopyWith<$Res>
    implements $StockStatisticsCopyWith<$Res> {
  factory _$StockStatisticsCopyWith(
          _StockStatistics value, $Res Function(_StockStatistics) _then) =
      __$StockStatisticsCopyWithImpl;
  @override
  @useResult
  $Res call({int totalStockItems, double totalStockValue, int lowStockItems});
}

/// @nodoc
class __$StockStatisticsCopyWithImpl<$Res>
    implements _$StockStatisticsCopyWith<$Res> {
  __$StockStatisticsCopyWithImpl(this._self, this._then);

  final _StockStatistics _self;
  final $Res Function(_StockStatistics) _then;

  /// Create a copy of StockStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalStockItems = null,
    Object? totalStockValue = null,
    Object? lowStockItems = null,
  }) {
    return _then(_StockStatistics(
      totalStockItems: null == totalStockItems
          ? _self.totalStockItems
          : totalStockItems // ignore: cast_nullable_to_non_nullable
              as int,
      totalStockValue: null == totalStockValue
          ? _self.totalStockValue
          : totalStockValue // ignore: cast_nullable_to_non_nullable
              as double,
      lowStockItems: null == lowStockItems
          ? _self.lowStockItems
          : lowStockItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
