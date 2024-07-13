import 'package:freezed_annotation/freezed_annotation.dart';

part 'following_model.freezed.dart';
part 'following_model.g.dart';

@freezed
class PulseFollowing with _$PulseFollowing {
  const factory PulseFollowing({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
  }) = _PulseFollowing;

  factory PulseFollowing.fromJson(final Map<String, dynamic> data) =>
      _$PulseFollowingFromJson(data);
}
