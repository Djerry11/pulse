import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse/src/utils/app_themes.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void toggleLocale() {
      final currentLocale = context.locale;
      final newLocale = currentLocale == const Locale('en', 'US')
          ? const Locale('ne', 'NP')
          : const Locale('en', 'US');
      context.setLocale(newLocale);
    }

    void toggleTheme() {
      ref.read(appThemeNotifierProvider.notifier).toggleTheme();
    }

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Text(
            context.tr('sign_in_msg'),
            style: Theme.of(context).textTheme.bodyLarge!,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            toggleTheme();
          },
          child: const Icon(Icons.add),
        ));
  }
}
