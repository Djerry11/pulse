import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_user_model.freezed.dart';
part 'sub_user_model.g.dart';

@freezed
class PulseSubUser with _$PulseSubUser {
  const factory PulseSubUser({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(<String, dynamic>{})
    final Map<String, dynamic> extraData,
  }) = _PulseSubUser;

  factory PulseSubUser.fromJson(final Map<String, dynamic> data) =>
      _$PulseSubUserFromJson(data).copyWith(extraData: data);
}
