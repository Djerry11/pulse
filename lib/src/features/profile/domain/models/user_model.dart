import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pulse/src/features/profile/domain/enums/gender_type.dart';
import 'package:pulse/src/features/profile/domain/enums/online_status.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class PulseUser with _$PulseUser {
  const factory PulseUser({
    final String? uid,
    final String? name,
    final String? userName,
    final String? email,
    final String? photo,
    final String? phone,
    final String? country,
    final String? bio,
    final String? profession,
    @Default(PulseGender.unknown) final PulseGender gender,
    final int? dob,
    @Default(<String>[]) final List<String> searchKeys,
    @Default(PulseOnlineStatus.unknown) final PulseOnlineStatus onlineStatus,
    final int? lastOnlineAt,
    @Default(0) final int feedsCount,
    @Default(0) final int photosCount,
    @Default(0) final int videosCount,
    @Default(0) final int followersCount,
    @Default(0) final int followingCount,
    @Default(0) final int reactionsReceivedFromFeedsCount,
    @Default(0) final int commentsReceivedFromFeedsCount,
    @Default(0) final int repliesReceivedFromFeedsCount,
    @Default(0) final int sharesReceivedFromFeedsCount,
    @Default(0) final int viewsReceivedFromFeedsCount,
    @Default(false) final bool isAdmin,
    @Default(false) final bool isEditor,
    @Default(false) final bool isTester,
    @Default(false) final bool isVerified,
    @Default(0) final int onboardingStep,
    @Default(false) final bool isOnboardingCompleted,
    final double? latitude,
    final double? longitude,
    final int? createdAt,
    @Default(true) final bool visibility,
    //ignore:invalid_annotation_target
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(<String, dynamic>{})
    final Map<String, dynamic> extraData,
  }) = _PulseUser;

  factory PulseUser.fromJson(final Map<String, dynamic> data) =>
      _$PulseUserFromJson(data).copyWith(
        extraData: data,
      );
}
