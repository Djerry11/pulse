import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse/src/routing/app_routes.dart';
import 'package:pulse/src/utils/app_themes.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(goRouterProvider);
    final themeProvider = ref.watch(appThemeNotifierProvider);
    final overlayStyle =
        ref.watch(appThemeNotifierProvider.notifier).overlayStyle;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: ScreenUtilInit(
          designSize: const Size(412, 824),
          builder: (context, _) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: themeProvider,
              routerConfig: goRouter,
            );
          }),
    );
  }
}
