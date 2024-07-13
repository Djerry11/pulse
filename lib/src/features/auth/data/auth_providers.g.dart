// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pulseAuthRepositoryHash() =>
    r'fb8578bc0d4570543ab55b70f1049bc184f2c502';

/// See also [pulseAuthRepository].
@ProviderFor(pulseAuthRepository)
final pulseAuthRepositoryProvider = Provider<PulseAuthRepositoryImpl>.internal(
  pulseAuthRepository,
  name: r'pulseAuthRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pulseAuthRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PulseAuthRepositoryRef = ProviderRef<PulseAuthRepositoryImpl>;
String _$authStateChangesHash() => r'449e0e5f100e8114d7fb87139fa9069592f74ea8';

/// See also [authStateChanges].
@ProviderFor(authStateChanges)
final authStateChangesProvider = AutoDisposeStreamProvider<User?>.internal(
  authStateChanges,
  name: r'authStateChangesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStateChangesRef = AutoDisposeStreamProviderRef<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
