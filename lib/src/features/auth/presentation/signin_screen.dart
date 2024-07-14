import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulse/src/common_widgets/input_field.dart';
import 'package:pulse/src/constants/app_colors.dart';
import 'package:pulse/src/extensions/widget_extensions.dart';
import 'package:pulse/src/utils/app_themes.dart';
import 'package:pulse/src/utils/pulse_text.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    // void toggleLocale() {
    //   final currentLocale = context.locale;
    //   final newLocale = currentLocale == const Locale('en', 'US')
    //       ? const Locale('ne', 'NP')
    //       : const Locale('en', 'US');
    //   context.setLocale(newLocale);
    // }

    void toggleTheme() {
      ref.read(appThemeNotifierProvider.notifier).toggleTheme();
    }

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
              tileMode: TileMode.decal,
              radius: 50.r,
              focal: Alignment.centerLeft,
              stops: const [0.3, 0.2],
              focalRadius: 40.8.r,
              colors: [
                Colors.orange.withOpacity(0.1),
                Colors.white,
              ],
            )),
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //----------------- Logo -----------------
                    _pulseLogoBuilder(context).pY(50.h),

                    //--------------email input fields --------------
                    _emailInputBuilder().pB(25.h),

                    //--------------password input fields --------------
                    _passwordInputBuilder(),

                    //--------------forgot password --------------
                    _forgotPasswordBuilder(),

                    // //--------------sign in button --------------
                    // _signInButtonBuilder(context),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            toggleTheme();
          },
          child: const Icon(Icons.add),
        ));
  }

  Widget _pulseLogoBuilder(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/pulse_logo.png',
          width: 150.w,
          height: 130.h,
          color: AppColors.primaryTheme,
        ),
        Text(
          context.tr('app_name'),
          style: GoogleFonts.playball(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

//---
  Widget _emailInputBuilder() {
    return const PulseInput(
      hintText: 'Username, email or mobile number',
    ).pX(15);
  }

//---
  Widget _passwordInputBuilder() {
    return const PulseInput(
      hintText: 'Password',
      password: true,
    ).pX(15);
  }

//---
  Widget _forgotPasswordBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        PulseText.titleMedium(
          'Forgot Password?',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.textDark.withOpacity(0.8),
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    ).pXY(15, 10);
  }
}
