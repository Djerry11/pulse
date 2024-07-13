// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PulseFollowing _$PulseFollowingFromJson(Map<String, dynamic> json) {
  return _PulseFollowing.fromJson(json);
}

/// @nodoc
mixin _$PulseFollowing {
  String? get uid => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PulseFollowingCopyWith<PulseFollowing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PulseFollowingCopyWith<$Res> {
  factory $PulseFollowingCopyWith(
          PulseFollowing value, $Res Function(PulseFollowing) then) =
      _$PulseFollowingCopyWithImpl<$Res, PulseFollowing>;
  @useResult
  $Res call({String? uid, int? createdAt, int? updatedAt});
}

/// @nodoc
class _$PulseFollowingCopyWithImpl<$Res, $Val extends PulseFollowing>
    implements $PulseFollowingCopyWith<$Res> {
  _$PulseFollowingCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PulseFollowingImplCopyWith<$Res>
    implements $PulseFollowingCopyWith<$Res> {
  factory _$$PulseFollowingImplCopyWith(_$PulseFollowingImpl value,
          $Res Function(_$PulseFollowingImpl) then) =
      __$$PulseFollowingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? uid, int? createdAt, int? updatedAt});
}

/// @nodoc
class __$$PulseFollowingImplCopyWithImpl<$Res>
    extends _$PulseFollowingCopyWithImpl<$Res, _$PulseFollowingImpl>
    implements _$$PulseFollowingImplCopyWith<$Res> {
  __$$PulseFollowingImplCopyWithImpl(
      _$PulseFollowingImpl _value, $Res Function(_$PulseFollowingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PulseFollowingImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PulseFollowingImpl implements _PulseFollowing {
  const _$PulseFollowingImpl({this.uid, this.createdAt, this.updatedAt});

  factory _$PulseFollowingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PulseFollowingImplFromJson(json);

  @override
  final String? uid;
  @override
  final int? createdAt;
  @override
  final int? updatedAt;

  @override
  String toString() {
    return 'PulseFollowing(uid: $uid, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PulseFollowingImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PulseFollowingImplCopyWith<_$PulseFollowingImpl> get copyWith =>
      __$$PulseFollowingImplCopyWithImpl<_$PulseFollowingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PulseFollowingImplToJson(
      this,
    );
  }
}

abstract class _PulseFollowing implements PulseFollowing {
  const factory _PulseFollowing(
      {final String? uid,
      final int? createdAt,
      final int? updatedAt}) = _$PulseFollowingImpl;

  factory _PulseFollowing.fromJson(Map<String, dynamic> json) =
      _$PulseFollowingImpl.fromJson;

  @override
  String? get uid;
  @override
  int? get createdAt;
  @override
  int? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PulseFollowingImplCopyWith<_$PulseFollowingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
