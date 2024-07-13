import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_model.freezed.dart';

@freezed
class PulseError with _$PulseError {
  const factory PulseError({
    required final String message,
    final String? code,
    final String? detailedMessage,
  }) = _PulseError;
}
