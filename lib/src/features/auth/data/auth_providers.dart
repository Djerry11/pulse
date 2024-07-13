import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pulse/src/features/auth/data/auth_user_repository.dart';

import 'package:pulse/src/features/profile/data/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
PulseAuthRepositoryImpl pulseAuthRepository(PulseAuthRepositoryRef ref) {
  return PulseAuthRepositoryImpl(
      pulseUserRepository: ref.watch(pulseUserRepositoryProvider));
}

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return ref.watch(pulseAuthRepositoryProvider).authStateChanges();
}
