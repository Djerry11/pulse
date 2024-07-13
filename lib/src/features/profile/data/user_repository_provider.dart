import 'package:pulse/src/features/profile/data/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_provider.g.dart';

@Riverpod(keepAlive: true)
PulseUserRepositoryImpl pulseUserRepository(PulseUserRepositoryRef ref) {
  return PulseUserRepositoryImpl();
}
