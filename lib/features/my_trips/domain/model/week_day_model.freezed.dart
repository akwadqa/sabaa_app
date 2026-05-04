// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_day_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeekDayModel {
  DateTime get date; // full date — used for API calls
  bool get isSelected;

  /// Create a copy of WeekDayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeekDayModelCopyWith<WeekDayModel> get copyWith =>
      _$WeekDayModelCopyWithImpl<WeekDayModel>(
          this as WeekDayModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeekDayModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, isSelected);

  @override
  String toString() {
    return 'WeekDayModel(date: $date, isSelected: $isSelected)';
  }
}

/// @nodoc
abstract mixin class $WeekDayModelCopyWith<$Res> {
  factory $WeekDayModelCopyWith(
          WeekDayModel value, $Res Function(WeekDayModel) _then) =
      _$WeekDayModelCopyWithImpl;
  @useResult
  $Res call({DateTime date, bool isSelected});
}

/// @nodoc
class _$WeekDayModelCopyWithImpl<$Res> implements $WeekDayModelCopyWith<$Res> {
  _$WeekDayModelCopyWithImpl(this._self, this._then);

  final WeekDayModel _self;
  final $Res Function(WeekDayModel) _then;

  /// Create a copy of WeekDayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? isSelected = null,
  }) {
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSelected: null == isSelected
          ? _self.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [WeekDayModel].
extension WeekDayModelPatterns on WeekDayModel {
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
    TResult Function(_WeekDayModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeekDayModel() when $default != null:
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
    TResult Function(_WeekDayModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeekDayModel():
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
    TResult? Function(_WeekDayModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeekDayModel() when $default != null:
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
    TResult Function(DateTime date, bool isSelected)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeekDayModel() when $default != null:
        return $default(_that.date, _that.isSelected);
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
    TResult Function(DateTime date, bool isSelected) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeekDayModel():
        return $default(_that.date, _that.isSelected);
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
    TResult? Function(DateTime date, bool isSelected)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeekDayModel() when $default != null:
        return $default(_that.date, _that.isSelected);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WeekDayModel implements WeekDayModel {
  const _WeekDayModel({required this.date, required this.isSelected});

  @override
  final DateTime date;
// full date — used for API calls
  @override
  final bool isSelected;

  /// Create a copy of WeekDayModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeekDayModelCopyWith<_WeekDayModel> get copyWith =>
      __$WeekDayModelCopyWithImpl<_WeekDayModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeekDayModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, isSelected);

  @override
  String toString() {
    return 'WeekDayModel(date: $date, isSelected: $isSelected)';
  }
}

/// @nodoc
abstract mixin class _$WeekDayModelCopyWith<$Res>
    implements $WeekDayModelCopyWith<$Res> {
  factory _$WeekDayModelCopyWith(
          _WeekDayModel value, $Res Function(_WeekDayModel) _then) =
      __$WeekDayModelCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime date, bool isSelected});
}

/// @nodoc
class __$WeekDayModelCopyWithImpl<$Res>
    implements _$WeekDayModelCopyWith<$Res> {
  __$WeekDayModelCopyWithImpl(this._self, this._then);

  final _WeekDayModel _self;
  final $Res Function(_WeekDayModel) _then;

  /// Create a copy of WeekDayModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? isSelected = null,
  }) {
    return _then(_WeekDayModel(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSelected: null == isSelected
          ? _self.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
