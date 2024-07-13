// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PulseUserImpl _$$PulseUserImplFromJson(Map<String, dynamic> json) =>
    _$PulseUserImpl(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      photo: json['photo'] as String?,
      phone: json['phone'] as String?,
      country: json['country'] as String?,
      bio: json['bio'] as String?,
      profession: json['profession'] as String?,
      gender: $enumDecodeNullable(_$PulseGenderEnumMap, json['gender']) ??
          PulseGender.unknown,
      dob: (json['dob'] as num?)?.toInt(),
      searchKeys: (json['searchKeys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      onlineStatus: $enumDecodeNullable(
              _$PulseOnlineStatusEnumMap, json['onlineStatus']) ??
          PulseOnlineStatus.unknown,
      lastOnlineAt: (json['lastOnlineAt'] as num?)?.toInt(),
      feedsCount: (json['feedsCount'] as num?)?.toInt() ?? 0,
      photosCount: (json['photosCount'] as num?)?.toInt() ?? 0,
      videosCount: (json['videosCount'] as num?)?.toInt() ?? 0,
      followersCount: (json['followersCount'] as num?)?.toInt() ?? 0,
      followingCount: (json['followingCount'] as num?)?.toInt() ?? 0,
      reactionsReceivedFromFeedsCount:
          (json['reactionsReceivedFromFeedsCount'] as num?)?.toInt() ?? 0,
      commentsReceivedFromFeedsCount:
          (json['commentsReceivedFromFeedsCount'] as num?)?.toInt() ?? 0,
      repliesReceivedFromFeedsCount:
          (json['repliesReceivedFromFeedsCount'] as num?)?.toInt() ?? 0,
      sharesReceivedFromFeedsCount:
          (json['sharesReceivedFromFeedsCount'] as num?)?.toInt() ?? 0,
      viewsReceivedFromFeedsCount:
          (json['viewsReceivedFromFeedsCount'] as num?)?.toInt() ?? 0,
      isAdmin: json['isAdmin'] as bool? ?? false,
      isEditor: json['isEditor'] as bool? ?? false,
      isTester: json['isTester'] as bool? ?? false,
      isVerified: json['isVerified'] as bool? ?? false,
      onboardingStep: (json['onboardingStep'] as num?)?.toInt() ?? 0,
      isOnboardingCompleted: json['isOnboardingCompleted'] as bool? ?? false,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      createdAt: (json['createdAt'] as num?)?.toInt(),
      visibility: json['visibility'] as bool? ?? true,
    );

Map<String, dynamic> _$$PulseUserImplToJson(_$PulseUserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'userName': instance.userName,
      'email': instance.email,
      'photo': instance.photo,
      'phone': instance.phone,
      'country': instance.country,
      'bio': instance.bio,
      'profession': instance.profession,
      'gender': _$PulseGenderEnumMap[instance.gender]!,
      'dob': instance.dob,
      'searchKeys': instance.searchKeys,
      'onlineStatus': _$PulseOnlineStatusEnumMap[instance.onlineStatus]!,
      'lastOnlineAt': instance.lastOnlineAt,
      'feedsCount': instance.feedsCount,
      'photosCount': instance.photosCount,
      'videosCount': instance.videosCount,
      'followersCount': instance.followersCount,
      'followingCount': instance.followingCount,
      'reactionsReceivedFromFeedsCount':
          instance.reactionsReceivedFromFeedsCount,
      'commentsReceivedFromFeedsCount': instance.commentsReceivedFromFeedsCount,
      'repliesReceivedFromFeedsCount': instance.repliesReceivedFromFeedsCount,
      'sharesReceivedFromFeedsCount': instance.sharesReceivedFromFeedsCount,
      'viewsReceivedFromFeedsCount': instance.viewsReceivedFromFeedsCount,
      'isAdmin': instance.isAdmin,
      'isEditor': instance.isEditor,
      'isTester': instance.isTester,
      'isVerified': instance.isVerified,
      'onboardingStep': instance.onboardingStep,
      'isOnboardingCompleted': instance.isOnboardingCompleted,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'createdAt': instance.createdAt,
      'visibility': instance.visibility,
    };

const _$PulseGenderEnumMap = {
  PulseGender.unknown: 'unknown',
  PulseGender.male: 'male',
  PulseGender.female: 'female',
  PulseGender.other: 'other',
};

const _$PulseOnlineStatusEnumMap = {
  PulseOnlineStatus.unknown: 'unknown',
  PulseOnlineStatus.away: 'away',
  PulseOnlineStatus.active: 'active',
};
