// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeDashboardModel {
  String get userName;
  String get todayDate;
  String get salesVolume;
  int get todaysVisits;

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeDashboardModelCopyWith<HomeDashboardModel> get copyWith =>
      _$HomeDashboardModelCopyWithImpl<HomeDashboardModel>(
          this as HomeDashboardModel, _$identity);

  /// Serializes this HomeDashboardModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeDashboardModel &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.todayDate, todayDate) ||
                other.todayDate == todayDate) &&
            (identical(other.salesVolume, salesVolume) ||
                other.salesVolume == salesVolume) &&
            (identical(other.todaysVisits, todaysVisits) ||
                other.todaysVisits == todaysVisits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userName, todayDate, salesVolume, todaysVisits);

  @override
  String toString() {
    return 'HomeDashboardModel(userName: $userName, todayDate: $todayDate, salesVolume: $salesVolume, todaysVisits: $todaysVisits)';
  }
}

/// @nodoc
abstract mixin class $HomeDashboardModelCopyWith<$Res> {
  factory $HomeDashboardModelCopyWith(
          HomeDashboardModel value, $Res Function(HomeDashboardModel) _then) =
      _$HomeDashboardModelCopyWithImpl;
  @useResult
  $Res call(
      {String userName,
      String todayDate,
      String salesVolume,
      int todaysVisits});
}

/// @nodoc
class _$HomeDashboardModelCopyWithImpl<$Res>
    implements $HomeDashboardModelCopyWith<$Res> {
  _$HomeDashboardModelCopyWithImpl(this._self, this._then);

  final HomeDashboardModel _self;
  final $Res Function(HomeDashboardModel) _then;

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? todayDate = null,
    Object? salesVolume = null,
    Object? todaysVisits = null,
  }) {
    return _then(_self.copyWith(
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      todayDate: null == todayDate
          ? _self.todayDate
          : todayDate // ignore: cast_nullable_to_non_nullable
              as String,
      salesVolume: null == salesVolume
          ? _self.salesVolume
          : salesVolume // ignore: cast_nullable_to_non_nullable
              as String,
      todaysVisits: null == todaysVisits
          ? _self.todaysVisits
          : todaysVisits // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [HomeDashboardModel].
extension HomeDashboardModelPatterns on HomeDashboardModel {
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
    TResult Function(_HomeDashboardModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel() when $default != null:
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
    TResult Function(_HomeDashboardModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel():
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
    TResult? Function(_HomeDashboardModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel() when $default != null:
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
    TResult Function(String userName, String todayDate, String salesVolume,
            int todaysVisits)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel() when $default != null:
        return $default(_that.userName, _that.todayDate, _that.salesVolume,
            _that.todaysVisits);
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
    TResult Function(String userName, String todayDate, String salesVolume,
            int todaysVisits)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel():
        return $default(_that.userName, _that.todayDate, _that.salesVolume,
            _that.todaysVisits);
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
    TResult? Function(String userName, String todayDate, String salesVolume,
            int todaysVisits)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeDashboardModel() when $default != null:
        return $default(_that.userName, _that.todayDate, _that.salesVolume,
            _that.todaysVisits);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HomeDashboardModel implements HomeDashboardModel {
  const _HomeDashboardModel(
      {this.userName = '',
      this.todayDate = '',
      this.salesVolume = '',
      this.todaysVisits = 0});
  factory _HomeDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDashboardModelFromJson(json);

  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String todayDate;
  @override
  @JsonKey()
  final String salesVolume;
  @override
  @JsonKey()
  final int todaysVisits;

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeDashboardModelCopyWith<_HomeDashboardModel> get copyWith =>
      __$HomeDashboardModelCopyWithImpl<_HomeDashboardModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HomeDashboardModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeDashboardModel &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.todayDate, todayDate) ||
                other.todayDate == todayDate) &&
            (identical(other.salesVolume, salesVolume) ||
                other.salesVolume == salesVolume) &&
            (identical(other.todaysVisits, todaysVisits) ||
                other.todaysVisits == todaysVisits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userName, todayDate, salesVolume, todaysVisits);

  @override
  String toString() {
    return 'HomeDashboardModel(userName: $userName, todayDate: $todayDate, salesVolume: $salesVolume, todaysVisits: $todaysVisits)';
  }
}

/// @nodoc
abstract mixin class _$HomeDashboardModelCopyWith<$Res>
    implements $HomeDashboardModelCopyWith<$Res> {
  factory _$HomeDashboardModelCopyWith(
          _HomeDashboardModel value, $Res Function(_HomeDashboardModel) _then) =
      __$HomeDashboardModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userName,
      String todayDate,
      String salesVolume,
      int todaysVisits});
}

/// @nodoc
class __$HomeDashboardModelCopyWithImpl<$Res>
    implements _$HomeDashboardModelCopyWith<$Res> {
  __$HomeDashboardModelCopyWithImpl(this._self, this._then);

  final _HomeDashboardModel _self;
  final $Res Function(_HomeDashboardModel) _then;

  /// Create a copy of HomeDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userName = null,
    Object? todayDate = null,
    Object? salesVolume = null,
    Object? todaysVisits = null,
  }) {
    return _then(_HomeDashboardModel(
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      todayDate: null == todayDate
          ? _self.todayDate
          : todayDate // ignore: cast_nullable_to_non_nullable
              as String,
      salesVolume: null == salesVolume
          ? _self.salesVolume
          : salesVolume // ignore: cast_nullable_to_non_nullable
              as String,
      todaysVisits: null == todaysVisits
          ? _self.todaysVisits
          : todaysVisits // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
