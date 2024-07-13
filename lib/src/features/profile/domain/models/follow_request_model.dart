import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_request_model.freezed.dart';
part 'follow_request_model.g.dart';

@freezed
class PulseFollowRequest with _$PulseFollowRequest {
  const factory PulseFollowRequest({
    final String? uid,
    final int? createdAt,
    final int? updatedAt,
    @Default(false) final bool isAccepted,
    @Default(false) final bool isIgnored,
  }) = _PulseFollowRequest;

  factory PulseFollowRequest.fromJson(final Map<String, dynamic> data) =>
      _$PulseFollowRequestFromJson(data);
}
