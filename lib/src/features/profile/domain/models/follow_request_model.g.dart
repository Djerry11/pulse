// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PulseFollowRequestImpl _$$PulseFollowRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PulseFollowRequestImpl(
      uid: json['uid'] as String?,
      createdAt: (json['createdAt'] as num?)?.toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
      isAccepted: json['isAccepted'] as bool? ?? false,
      isIgnored: json['isIgnored'] as bool? ?? false,
    );

Map<String, dynamic> _$$PulseFollowRequestImplToJson(
        _$PulseFollowRequestImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isAccepted': instance.isAccepted,
      'isIgnored': instance.isIgnored,
    };
