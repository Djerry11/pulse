import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse/src/routing/app_startup.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
final _rootNavigatorKey = GlobalKey<NavigatorState>();

enum AppRoute {
  onboarding,
  home,
  signIn,
  signUp,
  forgotPassword,
  resetPassword,
  profile,
  settings,
  notifications,
  search,
  chat,
  feed,
  createPost,
  postDetails,
  editPost,
}

@riverpod
GoRouter goRouter(){
    // rebuild GoRouter when app startup state changes
  final appStartupState = ref.watch(appStartupProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
}
