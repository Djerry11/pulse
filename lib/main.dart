import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse/firebase_options.dart';
import 'package:pulse/src/app.dart';
import 'package:pulse/src/extensions/string_extensions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // * Initialize EasyLocalization
  await EasyLocalization.ensureInitialized();

  // * Register error handlers
  registerErrorHandlers();
  // * Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ProviderScope(
    child: EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ne', 'NP')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  ));
}

// * Register error handlers
void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('An error occurred'.hardcoded),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Text(details.toString()),
        ),
      ),
    );
  };
}
