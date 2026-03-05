// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserInformation {
  @HiveField(0)
  String get token;
  @HiveField(1)
  @JsonKey(name: "full_name")
  String get fullName;
  @HiveField(2)
  @JsonKey(name: "mobile_no")
  String get mobileNumber;
  @HiveField(3)
  String? get email;

  /// Create a copy of UserInformation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserInformationCopyWith<UserInformation> get copyWith =>
      _$UserInformationCopyWithImpl<UserInformation>(
          this as UserInformation, _$identity);

  /// Serializes this UserInformation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserInformation &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, token, fullName, mobileNumber, email);

  @override
  String toString() {
    return 'UserInformation(token: $token, fullName: $fullName, mobileNumber: $mobileNumber, email: $email)';
  }
}

/// @nodoc
abstract mixin class $UserInformationCopyWith<$Res> {
  factory $UserInformationCopyWith(
          UserInformation value, $Res Function(UserInformation) _then) =
      _$UserInformationCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String token,
      @HiveField(1) @JsonKey(name: "full_name") String fullName,
      @HiveField(2) @JsonKey(name: "mobile_no") String mobileNumber,
      @HiveField(3) String? email});
}

/// @nodoc
class _$UserInformationCopyWithImpl<$Res>
    implements $UserInformationCopyWith<$Res> {
  _$UserInformationCopyWithImpl(this._self, this._then);

  final UserInformation _self;
  final $Res Function(UserInformation) _then;

  /// Create a copy of UserInformation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? fullName = null,
    Object? mobileNumber = null,
    Object? email = freezed,
  }) {
    return _then(_self.copyWith(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserInformation].
extension UserInformationPatterns on UserInformation {
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
    TResult Function(_UserInformation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserInformation() when $default != null:
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
    TResult Function(_UserInformation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInformation():
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
    TResult? Function(_UserInformation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInformation() when $default != null:
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
            @HiveField(0) String token,
            @HiveField(1) @JsonKey(name: "full_name") String fullName,
            @HiveField(2) @JsonKey(name: "mobile_no") String mobileNumber,
            @HiveField(3) String? email)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserInformation() when $default != null:
        return $default(
            _that.token, _that.fullName, _that.mobileNumber, _that.email);
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
            @HiveField(0) String token,
            @HiveField(1) @JsonKey(name: "full_name") String fullName,
            @HiveField(2) @JsonKey(name: "mobile_no") String mobileNumber,
            @HiveField(3) String? email)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInformation():
        return $default(
            _that.token, _that.fullName, _that.mobileNumber, _that.email);
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
            @HiveField(0) String token,
            @HiveField(1) @JsonKey(name: "full_name") String fullName,
            @HiveField(2) @JsonKey(name: "mobile_no") String mobileNumber,
            @HiveField(3) String? email)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInformation() when $default != null:
        return $default(
            _that.token, _that.fullName, _that.mobileNumber, _that.email);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserInformation implements UserInformation {
  _UserInformation(
      {@HiveField(0) required this.token,
      @HiveField(1) @JsonKey(name: "full_name") required this.fullName,
      @HiveField(2) @JsonKey(name: "mobile_no") required this.mobileNumber,
      @HiveField(3) required this.email});
  factory _UserInformation.fromJson(Map<String, dynamic> json) =>
      _$UserInformationFromJson(json);

  @override
  @HiveField(0)
  final String token;
  @override
  @HiveField(1)
  @JsonKey(name: "full_name")
  final String fullName;
  @override
  @HiveField(2)
  @JsonKey(name: "mobile_no")
  final String mobileNumber;
  @override
  @HiveField(3)
  final String? email;

  /// Create a copy of UserInformation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserInformationCopyWith<_UserInformation> get copyWith =>
      __$UserInformationCopyWithImpl<_UserInformation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserInformationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInformation &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, token, fullName, mobileNumber, email);

  @override
  String toString() {
    return 'UserInformation(token: $token, fullName: $fullName, mobileNumber: $mobileNumber, email: $email)';
  }
}

/// @nodoc
abstract mixin class _$UserInformationCopyWith<$Res>
    implements $UserInformationCopyWith<$Res> {
  factory _$UserInformationCopyWith(
          _UserInformation value, $Res Function(_UserInformation) _then) =
      __$UserInformationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String token,
      @HiveField(1) @JsonKey(name: "full_name") String fullName,
      @HiveField(2) @JsonKey(name: "mobile_no") String mobileNumber,
      @HiveField(3) String? email});
}

/// @nodoc
class __$UserInformationCopyWithImpl<$Res>
    implements _$UserInformationCopyWith<$Res> {
  __$UserInformationCopyWithImpl(this._self, this._then);

  final _UserInformation _self;
  final $Res Function(_UserInformation) _then;

  /// Create a copy of UserInformation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = null,
    Object? fullName = null,
    Object? mobileNumber = null,
    Object? email = freezed,
  }) {
    return _then(_UserInformation(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
