// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PulseFollowingImpl _$$PulseFollowingImplFromJson(Map<String, dynamic> json) =>
    _$PulseFollowingImpl(
      uid: json['uid'] as String?,
      createdAt: (json['createdAt'] as num?)?.toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PulseFollowingImplToJson(
        _$PulseFollowingImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
