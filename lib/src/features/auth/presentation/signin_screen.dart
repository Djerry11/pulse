import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulse/src/common_widgets/custom_pulse_button.dart';
import 'package:pulse/src/common_widgets/custom_input_field.dart';

import 'package:pulse/src/constants/app_colors.dart';
import 'package:pulse/src/constants/app_sizes.dart';
import 'package:pulse/src/extensions/widget_extensions.dart';
import 'package:pulse/src/routing/app_routes.dart';
import 'package:pulse/src/utils/app_themes.dart';
import 'package:pulse/src/utils/pulse_text.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
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

                  //--------------email input  --------------
                  _emailInputBuilder().pB(25.h),

                  //--------------password input  --------------
                  _passwordInputBuilder(),

                  //--------------forgot password --------------
                  _forgotPasswordBuilder(),

                  //--------------gap --------------

                  gapH24,

                  //--------------log in button --------------

                  _signInButtonBuilder(context),

                  gapH16,

                  //---
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      const Text('or').pX(5),
                      const Expanded(
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                    ],
                  ).pX(15),
                  //--
                  gapH16,

                  //--------------continue with google icon button--------------
                  _loginWithGoogleButtonBuilder(context),

                  //--------------continue with facebook icon button--------------
                  // _loginWithFacebookButtonBuilder(context),

                  //--------------dont have an account --------------
                  _dontHaveAccountBuilder(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //--------logo builder-----------------
  Widget _pulseLogoBuilder(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/logo/pulse_logo.png',
          width: 150.w,
          height: 130.h,
          color: AppColors.primaryTheme,
        ),
        Text(
          context.tr('app_name'),
          style: GoogleFonts.playball(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryTheme,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  //----------------- Email Input -----------------
  Widget _emailInputBuilder() {
    return PulseInput(
      controller: _emailController,
      hintText: context.tr('email_hint'),
    ).pX(15);
  }

//----------------- Password Input -----------------
  Widget _passwordInputBuilder() {
    return PulseInput(
      hintText: context.tr('password_hint'),
      password: true,
      controller: _passwordController,
    ).pX(15);
  }

//----------------- Forgot Password -----------------
  Widget _forgotPasswordBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        PulseText.titleMedium(
          context.tr('forgot_password'),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .color!
                    .withAlpha(180),
                fontWeight: FontWeight.w500,
              ),
          onPressed: () {
            toggleTheme();
          },
        ),
      ],
    ).pXY(15, 10);
  }

  //----------------- Sign In Button -----------------
  Widget _signInButtonBuilder(BuildContext context) {
    //---------- filled button ------------
    return CustomPulseButton.filled(
      text: context.tr('log_in'),
      height: 60.h,
      //----- button label style -----
      textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
      //-- action on pressed --
      onPressed: () {
        toggleLocale();
      },
      //---- show spinner ----
      isLoading: false,
    ).pX(15);
  }

  //----------------- Continue with Google Button -----------------
  Widget _loginWithGoogleButtonBuilder(BuildContext context) {
    //---------- outlined button ------------
    return CustomPulseButton.outlined(
      text: context.tr('login_with'),
      //----- button border color -----
      color: AppColors.primaryTheme,
      //----- button label style -----
      textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: AppColors.primaryTheme,
            fontWeight: FontWeight.w500,
          ),
      height: 60.h,
      //----- leading icon -----
      leadingIcon: SvgPicture.asset(
        'assets/logo/Glogo.svg',
        width: 38.w,
        height: 38.h,
      ).pR(14),
      //-- trailing icon --
      trailingIcon: SvgPicture.asset(
        'assets/logo/Google_logo.svg',
        width: 28.w,
        height: 28.h,
      ).pL(6).pT(5),

      //-----action on pressed-----
      onPressed: () {
        toggleTheme();
      },
      isLoading: false,
    ).pX(15);
  }

  //------------ dont have an account --------------
  Widget _dontHaveAccountBuilder(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //--- ask dont have an account--
        Text(
          context.tr('dont_have_account'),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .color!
                    .withAlpha(180),
                fontWeight: FontWeight.w500,
              ),
        ).pR(6),
        //--- sign up button --
        PulseText.titleMedium(
          context.tr('sign_up'),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.primaryTheme,
                fontWeight: FontWeight.w500,
              ),
          onPressed: () {
            debugPrint('Sign Up');
            context.pushNamed(AppRoute.signUp.name);
          },
        ),
      ],
    ).pT(30);
  }
}
