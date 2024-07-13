// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PulseSubUserImpl _$$PulseSubUserImplFromJson(Map<String, dynamic> json) =>
    _$PulseSubUserImpl(
      uid: json['uid'] as String?,
      createdAt: (json['createdAt'] as num?)?.toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PulseSubUserImplToJson(_$PulseSubUserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
