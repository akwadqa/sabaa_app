// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SigninResponseModel {
  @JsonKey(name: 'mobile_number')
  String get mobileNumber;
  @JsonKey(name: 'user_exist')
  bool get userExist;

  /// Create a copy of SigninResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SigninResponseModelCopyWith<SigninResponseModel> get copyWith =>
      _$SigninResponseModelCopyWithImpl<SigninResponseModel>(
          this as SigninResponseModel, _$identity);

  /// Serializes this SigninResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SigninResponseModel &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.userExist, userExist) ||
                other.userExist == userExist));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mobileNumber, userExist);

  @override
  String toString() {
    return 'SigninResponseModel(mobileNumber: $mobileNumber, userExist: $userExist)';
  }
}

/// @nodoc
abstract mixin class $SigninResponseModelCopyWith<$Res> {
  factory $SigninResponseModelCopyWith(
          SigninResponseModel value, $Res Function(SigninResponseModel) _then) =
      _$SigninResponseModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'mobile_number') String mobileNumber,
      @JsonKey(name: 'user_exist') bool userExist});
}

/// @nodoc
class _$SigninResponseModelCopyWithImpl<$Res>
    implements $SigninResponseModelCopyWith<$Res> {
  _$SigninResponseModelCopyWithImpl(this._self, this._then);

  final SigninResponseModel _self;
  final $Res Function(SigninResponseModel) _then;

  /// Create a copy of SigninResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobileNumber = null,
    Object? userExist = null,
  }) {
    return _then(_self.copyWith(
      mobileNumber: null == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userExist: null == userExist
          ? _self.userExist
          : userExist // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SigninResponseModel].
extension SigninResponseModelPatterns on SigninResponseModel {
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
    TResult Function(_SigninResponseModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SigninResponseModel() when $default != null:
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
    TResult Function(_SigninResponseModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SigninResponseModel():
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
    TResult? Function(_SigninResponseModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SigninResponseModel() when $default != null:
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
    TResult Function(@JsonKey(name: 'mobile_number') String mobileNumber,
            @JsonKey(name: 'user_exist') bool userExist)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SigninResponseModel() when $default != null:
        return $default(_that.mobileNumber, _that.userExist);
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
    TResult Function(@JsonKey(name: 'mobile_number') String mobileNumber,
            @JsonKey(name: 'user_exist') bool userExist)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SigninResponseModel():
        return $default(_that.mobileNumber, _that.userExist);
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
    TResult? Function(@JsonKey(name: 'mobile_number') String mobileNumber,
            @JsonKey(name: 'user_exist') bool userExist)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SigninResponseModel() when $default != null:
        return $default(_that.mobileNumber, _that.userExist);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SigninResponseModel implements SigninResponseModel {
  const _SigninResponseModel(
      {@JsonKey(name: 'mobile_number') required this.mobileNumber,
      @JsonKey(name: 'user_exist') required this.userExist});
  factory _SigninResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseModelFromJson(json);

  @override
  @JsonKey(name: 'mobile_number')
  final String mobileNumber;
  @override
  @JsonKey(name: 'user_exist')
  final bool userExist;

  /// Create a copy of SigninResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SigninResponseModelCopyWith<_SigninResponseModel> get copyWith =>
      __$SigninResponseModelCopyWithImpl<_SigninResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SigninResponseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SigninResponseModel &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.userExist, userExist) ||
                other.userExist == userExist));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mobileNumber, userExist);

  @override
  String toString() {
    return 'SigninResponseModel(mobileNumber: $mobileNumber, userExist: $userExist)';
  }
}

/// @nodoc
abstract mixin class _$SigninResponseModelCopyWith<$Res>
    implements $SigninResponseModelCopyWith<$Res> {
  factory _$SigninResponseModelCopyWith(_SigninResponseModel value,
          $Res Function(_SigninResponseModel) _then) =
      __$SigninResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'mobile_number') String mobileNumber,
      @JsonKey(name: 'user_exist') bool userExist});
}

/// @nodoc
class __$SigninResponseModelCopyWithImpl<$Res>
    implements _$SigninResponseModelCopyWith<$Res> {
  __$SigninResponseModelCopyWithImpl(this._self, this._then);

  final _SigninResponseModel _self;
  final $Res Function(_SigninResponseModel) _then;

  /// Create a copy of SigninResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mobileNumber = null,
    Object? userExist = null,
  }) {
    return _then(_SigninResponseModel(
      mobileNumber: null == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userExist: null == userExist
          ? _self.userExist
          : userExist // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$LoginValidation {
  @JsonKey(name: 'mobile_number')
  String get mobileNumber;
  @JsonKey(name: 'user_exist')
  bool get userExist;

  /// Create a copy of LoginValidation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginValidationCopyWith<LoginValidation> get copyWith =>
      _$LoginValidationCopyWithImpl<LoginValidation>(
          this as LoginValidation, _$identity);

  /// Serializes this LoginValidation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginValidation &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.userExist, userExist) ||
                other.userExist == userExist));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mobileNumber, userExist);

  @override
  String toString() {
    return 'LoginValidation(mobileNumber: $mobileNumber, userExist: $userExist)';
  }
}

/// @nodoc
abstract mixin class $LoginValidationCopyWith<$Res> {
  factory $LoginValidationCopyWith(
          LoginValidation value, $Res Function(LoginValidation) _then) =
      _$LoginValidationCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'mobile_number') String mobileNumber,
      @JsonKey(name: 'user_exist') bool userExist});
}

/// @nodoc
class _$LoginValidationCopyWithImpl<$Res>
    implements $LoginValidationCopyWith<$Res> {
  _$LoginValidationCopyWithImpl(this._self, this._then);

  final LoginValidation _self;
  final $Res Function(LoginValidation) _then;

  /// Create a copy of LoginValidation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobileNumber = null,
    Object? userExist = null,
  }) {
    return _then(_self.copyWith(
      mobileNumber: null == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userExist: null == userExist
          ? _self.userExist
          : userExist // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [LoginValidation].
extension LoginValidationPatterns on LoginValidation {
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
    TResult Function(_LoginValidation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginValidation() when $default != null:
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
    TResult Function(_LoginValidation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginValidation():
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
    TResult? Function(_LoginValidation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginValidation() when $default != null:
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
    TResult Function(@JsonKey(name: 'mobile_number') String mobileNumber,
            @JsonKey(name: 'user_exist') bool userExist)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginValidation() when $default != null:
        return $default(_that.mobileNumber, _that.userExist);
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
    TResult Function(@JsonKey(name: 'mobile_number') String mobileNumber,
            @JsonKey(name: 'user_exist') bool userExist)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginValidation():
        return $default(_that.mobileNumber, _that.userExist);
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
    TResult? Function(@JsonKey(name: 'mobile_number') String mobileNumber,
            @JsonKey(name: 'user_exist') bool userExist)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginValidation() when $default != null:
        return $default(_that.mobileNumber, _that.userExist);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LoginValidation implements LoginValidation {
  const _LoginValidation(
      {@JsonKey(name: 'mobile_number') required this.mobileNumber,
      @JsonKey(name: 'user_exist') required this.userExist});
  factory _LoginValidation.fromJson(Map<String, dynamic> json) =>
      _$LoginValidationFromJson(json);

  @override
  @JsonKey(name: 'mobile_number')
  final String mobileNumber;
  @override
  @JsonKey(name: 'user_exist')
  final bool userExist;

  /// Create a copy of LoginValidation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginValidationCopyWith<_LoginValidation> get copyWith =>
      __$LoginValidationCopyWithImpl<_LoginValidation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginValidationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginValidation &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.userExist, userExist) ||
                other.userExist == userExist));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mobileNumber, userExist);

  @override
  String toString() {
    return 'LoginValidation(mobileNumber: $mobileNumber, userExist: $userExist)';
  }
}

/// @nodoc
abstract mixin class _$LoginValidationCopyWith<$Res>
    implements $LoginValidationCopyWith<$Res> {
  factory _$LoginValidationCopyWith(
          _LoginValidation value, $Res Function(_LoginValidation) _then) =
      __$LoginValidationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'mobile_number') String mobileNumber,
      @JsonKey(name: 'user_exist') bool userExist});
}

/// @nodoc
class __$LoginValidationCopyWithImpl<$Res>
    implements _$LoginValidationCopyWith<$Res> {
  __$LoginValidationCopyWithImpl(this._self, this._then);

  final _LoginValidation _self;
  final $Res Function(_LoginValidation) _then;

  /// Create a copy of LoginValidation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mobileNumber = null,
    Object? userExist = null,
  }) {
    return _then(_LoginValidation(
      mobileNumber: null == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userExist: null == userExist
          ? _self.userExist
          : userExist // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
