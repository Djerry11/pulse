// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PulseError {
  String get message => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get detailedMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PulseErrorCopyWith<PulseError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PulseErrorCopyWith<$Res> {
  factory $PulseErrorCopyWith(
          PulseError value, $Res Function(PulseError) then) =
      _$PulseErrorCopyWithImpl<$Res, PulseError>;
  @useResult
  $Res call({String message, String? code, String? detailedMessage});
}

/// @nodoc
class _$PulseErrorCopyWithImpl<$Res, $Val extends PulseError>
    implements $PulseErrorCopyWith<$Res> {
  _$PulseErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
    Object? detailedMessage = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      detailedMessage: freezed == detailedMessage
          ? _value.detailedMessage
          : detailedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PulseErrorImplCopyWith<$Res>
    implements $PulseErrorCopyWith<$Res> {
  factory _$$PulseErrorImplCopyWith(
          _$PulseErrorImpl value, $Res Function(_$PulseErrorImpl) then) =
      __$$PulseErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code, String? detailedMessage});
}

/// @nodoc
class __$$PulseErrorImplCopyWithImpl<$Res>
    extends _$PulseErrorCopyWithImpl<$Res, _$PulseErrorImpl>
    implements _$$PulseErrorImplCopyWith<$Res> {
  __$$PulseErrorImplCopyWithImpl(
      _$PulseErrorImpl _value, $Res Function(_$PulseErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
    Object? detailedMessage = freezed,
  }) {
    return _then(_$PulseErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      detailedMessage: freezed == detailedMessage
          ? _value.detailedMessage
          : detailedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PulseErrorImpl implements _PulseError {
  const _$PulseErrorImpl(
      {required this.message, this.code, this.detailedMessage});

  @override
  final String message;
  @override
  final String? code;
  @override
  final String? detailedMessage;

  @override
  String toString() {
    return 'PulseError(message: $message, code: $code, detailedMessage: $detailedMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PulseErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.detailedMessage, detailedMessage) ||
                other.detailedMessage == detailedMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code, detailedMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PulseErrorImplCopyWith<_$PulseErrorImpl> get copyWith =>
      __$$PulseErrorImplCopyWithImpl<_$PulseErrorImpl>(this, _$identity);
}

abstract class _PulseError implements PulseError {
  const factory _PulseError(
      {required final String message,
      final String? code,
      final String? detailedMessage}) = _$PulseErrorImpl;

  @override
  String get message;
  @override
  String? get code;
  @override
  String? get detailedMessage;
  @override
  @JsonKey(ignore: true)
  _$$PulseErrorImplCopyWith<_$PulseErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
