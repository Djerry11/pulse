import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse/src/features/auth/data/auth_providers.dart';
import 'package:pulse/src/features/auth/presentation/signin_screen.dart';
import 'package:pulse/src/features/auth/presentation/signup/signup_screen.dart';
import 'package:pulse/src/features/onboarding/data/onboarding_repository.dart';
import 'package:pulse/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:pulse/src/routing/app_startup.dart';
import 'package:pulse/src/routing/go_router_refresh_stream.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_routes.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

enum AppRoute {
  //--- app startup---
  startUp,
  onboarding,
  signIn,

  //--- password reset---
  forgotPassword,
  resetPassword,

  //--- sign up---
  signUp,
  signUpName,
  signUpPassword,
  signUpUsername,
  signUpBirthDate,
  signUpMobileNumber,
  signUpConfirmation,
  signUpComplete,

  //----- bottom navigation---
  home,
  chat,
  profile,
  search,

  //--- profile---
  settings,
  notifications,

  //--- posts -----
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
      FlutterNativeSplash.remove();
      // * Handle loading or error state during app startup
      // If the app is still initializing, show the /startup route
      if (appStartupState.isLoading || appStartupState.hasError) {
        debugPrint('Redirecting to startup');
        return '/startup';
      }
      final onboardingRepository =
          ref.watch(onboardingRepositoryProvider).requireValue;
      final path = state.uri.path;
      final didOnboardingComplete = onboardingRepository.isOnboardingComplete();
      if (!didOnboardingComplete) {
        if (path != '/onboarding') {
          debugPrint('Redirecting to onboarding');
          return '/onboarding';
        }
        return null;
      }

      // *Handle authentication state
      // Check if user is logged in
      final isLoggedIn = authRepository.currentUser != null;
      // Only allow logged-in users to navigate to the home screen
      if (isLoggedIn) {
        debugPrint('User is logged in');
        if (path.startsWith('/startUp') ||
            path.startsWith('/onboarding') ||
            path.startsWith('/signIn') ||
            path.startsWith('/signUp')) {
          // Added signUp here
          debugPrint('Redirecting logged in user to home');
          return '/home';
        }
      } else {
        // Allow navigation to both signIn and signUp for non-logged in users
        if (!path.startsWith('/signIn') && !path.startsWith('/signUp')) {
          debugPrint('Redirecting non-logged in user to sign in');
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
        },
      ),
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: SignInScreen(),
          );
        },
      ),
      GoRoute(
          path: '/signUp',
          name: AppRoute.signUp.name,
          builder: (context, state) => const SignUpNameScreen(),
          routes: [
            GoRoute(
              path: 'name',
              name: AppRoute.signUpName.name,
              builder: (context, state) => const SignUpNameScreen(),
            ),
            GoRoute(
              path: 'password',
              name: AppRoute.signUpPassword.name,
              builder: (context, state) => const SignUpPasswordScreen(),
            ),
            GoRoute(
              path: 'username',
              name: AppRoute.signUpUsername.name,
              builder: (context, state) => const SignUpUsernameScreen(),
            ),
            GoRoute(
                path: 'birthdate',
                name: AppRoute.signUpBirthDate.name,
                builder: (context, state) => const SignUpBirthDateScreen()),
            GoRoute(
              path: 'mobileNumber',
              name: AppRoute.signUpMobileNumber.name,
              builder: (context, state) => const SignUpMobileNumberScreen(),
            ),
            GoRoute(
              path: 'confirmation',
              name: AppRoute.signUpConfirmation.name,
              builder: (context, state) => const SignUpConfirmationScreen(),
            ),
            GoRoute(
              path: 'complete',
              name: AppRoute.signUpComplete.name,
              builder: (context, state) {
                return const Scaffold(
                  body: Center(child: Text('Sign Up Complete Screen')),
                );
              },
            ),
          ]),
    ],
  );
}
