// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PulseSubUser _$PulseSubUserFromJson(Map<String, dynamic> json) {
  return _PulseSubUser.fromJson(json);
}

/// @nodoc
mixin _$PulseSubUser {
  String? get uid => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Map<String, dynamic> get extraData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PulseSubUserCopyWith<PulseSubUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PulseSubUserCopyWith<$Res> {
  factory $PulseSubUserCopyWith(
          PulseSubUser value, $Res Function(PulseSubUser) then) =
      _$PulseSubUserCopyWithImpl<$Res, PulseSubUser>;
  @useResult
  $Res call(
      {String? uid,
      int? createdAt,
      int? updatedAt,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Map<String, dynamic> extraData});
}

/// @nodoc
class _$PulseSubUserCopyWithImpl<$Res, $Val extends PulseSubUser>
    implements $PulseSubUserCopyWith<$Res> {
  _$PulseSubUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? extraData = null,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      extraData: null == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PulseSubUserImplCopyWith<$Res>
    implements $PulseSubUserCopyWith<$Res> {
  factory _$$PulseSubUserImplCopyWith(
          _$PulseSubUserImpl value, $Res Function(_$PulseSubUserImpl) then) =
      __$$PulseSubUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      int? createdAt,
      int? updatedAt,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Map<String, dynamic> extraData});
}

/// @nodoc
class __$$PulseSubUserImplCopyWithImpl<$Res>
    extends _$PulseSubUserCopyWithImpl<$Res, _$PulseSubUserImpl>
    implements _$$PulseSubUserImplCopyWith<$Res> {
  __$$PulseSubUserImplCopyWithImpl(
      _$PulseSubUserImpl _value, $Res Function(_$PulseSubUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? extraData = null,
  }) {
    return _then(_$PulseSubUserImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      extraData: null == extraData
          ? _value._extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PulseSubUserImpl implements _PulseSubUser {
  const _$PulseSubUserImpl(
      {this.uid,
      this.createdAt,
      this.updatedAt,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Map<String, dynamic> extraData = const <String, dynamic>{}})
      : _extraData = extraData;

  factory _$PulseSubUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$PulseSubUserImplFromJson(json);

  @override
  final String? uid;
  @override
  final int? createdAt;
  @override
  final int? updatedAt;
  final Map<String, dynamic> _extraData;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Map<String, dynamic> get extraData {
    if (_extraData is EqualUnmodifiableMapView) return _extraData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_extraData);
  }

  @override
  String toString() {
    return 'PulseSubUser(uid: $uid, createdAt: $createdAt, updatedAt: $updatedAt, extraData: $extraData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PulseSubUserImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._extraData, _extraData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, createdAt, updatedAt,
      const DeepCollectionEquality().hash(_extraData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PulseSubUserImplCopyWith<_$PulseSubUserImpl> get copyWith =>
      __$$PulseSubUserImplCopyWithImpl<_$PulseSubUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PulseSubUserImplToJson(
      this,
    );
  }
}

abstract class _PulseSubUser implements PulseSubUser {
  const factory _PulseSubUser(
      {final String? uid,
      final int? createdAt,
      final int? updatedAt,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Map<String, dynamic> extraData}) = _$PulseSubUserImpl;

  factory _PulseSubUser.fromJson(Map<String, dynamic> json) =
      _$PulseSubUserImpl.fromJson;

  @override
  String? get uid;
  @override
  int? get createdAt;
  @override
  int? get updatedAt;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Map<String, dynamic> get extraData;
  @override
  @JsonKey(ignore: true)
  _$$PulseSubUserImplCopyWith<_$PulseSubUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
