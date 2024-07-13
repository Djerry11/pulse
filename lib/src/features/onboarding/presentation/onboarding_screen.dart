import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse/src/common_widgets/responsive_center.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse/src/common_widgets/primary_button.dart';
import 'package:pulse/src/constants/app_sizes.dart';
import 'package:pulse/src/extensions/string_extensions.dart';
import 'package:pulse/src/features/onboarding/presentation/onboarding_controller.dart';
import 'package:pulse/src/routing/app_routes.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingControllerProvider);
    return Scaffold(
      body: ResponsiveCenter(
        maxContentWidth: 450.w,
        padding: EdgeInsets.all(16.0.spMin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pulse\nYour Social Heartbeat.'.hardcoded,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            gapH16,
            Image.asset(
              'assets/images/pulse_rounded.png',
              width: 200.w,
              height: 200.h,
            ),
            gapH16,
            PrimaryButton(
              text: 'Get Started'.hardcoded,
              isLoading: state.isLoading,
              onPressed: state.isLoading
                  ? null
                  : () async {
                      await ref
                          .read(onboardingControllerProvider.notifier)
                          .completeOnboarding();
                      if (context.mounted) {
                        // go to sign in page after completing onboarding
                        context.goNamed(AppRoute.signIn.name);
                      }
                    },
            ),
          ],
        ),
      ),
    );
  }
}
