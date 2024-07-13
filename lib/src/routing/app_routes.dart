import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse/src/features/auth/data/auth_providers.dart';
import 'package:pulse/src/features/auth/presentation/signin_screen.dart';
import 'package:pulse/src/features/onboarding/data/onboarding_repository.dart';
import 'package:pulse/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:pulse/src/routing/app_startup.dart';
import 'package:pulse/src/routing/go_router_refresh_stream.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_routes.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

enum AppRoute {
  startUp,
  onboarding,
  signIn,
  signUp,
  home,
  chat,
  profile,
  search,
  forgotPassword,
  resetPassword,
  settings,
  notifications,
  createPost,
  postDetails,
  editPost,
}

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  // rebuild GoRouter when app startup state changes
  final appStartupState = ref.watch(appStartupProvider);
  final authRepository = ref.watch(pulseAuthRepositoryProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/signIn',
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    redirect: (context, state) {
      //place holder
      // If the app is still initializing, show the /startup route
      if (appStartupState.isLoading || appStartupState.hasError) {
        return '/startup';
      }
      final onboardingRepository =
          ref.watch(onboardingRepositoryProvider).requireValue;
      final path = state.uri.path;
      final didOnboardingComplete = onboardingRepository.isOnboardingComplete();
      if (!didOnboardingComplete) {
        if (path != '/onboarding') {
          return '/onboarding';
        }
        return null;
      }
      //check if user is logged in
      final isLoggedIn = authRepository.currentUser != null;

      if (isLoggedIn) {
        if (path.startsWith('/startUp') ||
            path.startsWith('/onboarding') ||
            path.startsWith('/signIn')) {
          return '/home';
        }
      } else {
        if (!path.startsWith('/signIn')) {
          return '/signIn';
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/startup',
        name: AppRoute.startUp.name,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: AppStartupWidget(
              onLoaded: (_) => const SizedBox.shrink(),
            ),
          );
        },
      ),
      GoRoute(
          path: '/onboarding',
          name: AppRoute.onboarding.name,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: OnboardingScreen(),
            );
          }),
      GoRoute(
          path: '/signIn',
          name: AppRoute.signIn.name,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: SignInScreen(),
            );
          }),
    ],
  );
}
