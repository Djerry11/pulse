import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse/src/common_widgets/custom_input_field.dart';
import 'package:pulse/src/common_widgets/custom_pulse_button.dart';
import 'package:pulse/src/constants/app_colors.dart';
import 'package:pulse/src/constants/app_sizes.dart';
import 'package:pulse/src/extensions/widget_extensions.dart';
import 'package:pulse/src/routing/app_routes.dart';
import 'package:pulse/src/utils/app_themes.dart';
import 'package:pulse/src/utils/pulse_text.dart';

class PulseSignupPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final String inputLabel;
  final String inputHint;
  final TextEditingController controller;
  final VoidCallback onPressed;
  final String? inputLabel2;
  final TextEditingController? confirmController;
  const PulseSignupPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.inputLabel,
    required this.inputHint,
    required this.controller,
    required this.onPressed,
    this.inputLabel2,
    this.confirmController,
  });

  @override
  State<PulseSignupPage> createState() => _PulseSignupPageState();
}

class _PulseSignupPageState extends State<PulseSignupPage> {
  @override
  Widget build(BuildContext context) {
    final backGround = Theme.of(context).colorScheme.surface;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: backGround,
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        shadowColor: Colors.transparent,
        backgroundColor: backGround,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            CupertinoIcons.back,
            size: 30.spMin,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        gapH32,
                        _pageHeaderBuilder(textTheme),
                        gapH24,
                        _buildInputField(textTheme),
                        if (widget.inputLabel == 'password')
                          _buildConfirmField(textTheme),
                        Expanded(child: gapH32),
                        _nextButtonBuilder(context),
                        _alreadyHaveAccountBuilder(context),
                        gapH64,
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ----------------- header text -----------------
  Widget _pageHeaderBuilder(TextTheme textTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.tr(widget.title),
            style: textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: textTheme.headlineSmall!.color,
            )),
        gapH8,
        Text(context.tr(widget.subtitle),
            style: textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: textTheme.bodyMedium!.color,
            )),
      ],
    );
  }

  // ----------------- name input field -----------------
  Widget _buildInputField(TextTheme textTheme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //--------- title ------
        Text(
          context.tr(widget.inputLabel),
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: textTheme.bodyLarge!.color,
          ),
        ).pY(10),

        //--------- input field ------
        PulseInput(
          hintText: context.tr(widget.inputHint),
          controller: widget.controller,
          password: widget.inputLabel == 'password',
          textInputType: TextInputType.text,
          onChanged: (val) {},
        ),
      ],
    );
  }

  Widget _buildConfirmField(TextTheme textTheme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //--------- title ------
        Text(
          context.tr(widget.inputLabel2 ?? 'confirm_password'),
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: textTheme.bodyLarge!.color,
          ),
        ).pY(10),

        //--------- input field ------
        PulseInput(
          hintText: context.tr(widget.inputHint),
          controller: widget.confirmController!,
          password: widget.inputLabel == 'password',
          textInputType: TextInputType.text,
          onChanged: (val) {},
        ),
      ],
    );
  }

  // ----------------- next button -----------------
  Widget _nextButtonBuilder(BuildContext context) {
    return CustomPulseButton.filled(
      text: context.tr('next'),
      height: 60.h,
      onPressed: widget.onPressed,
    );
  }

  //----------------- Already have account -----------------
  Widget _alreadyHaveAccountBuilder(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //--- ask dont have an account--
        Text(
          context.tr('already_have_account'),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontWeight: FontWeight.bold,
              ),
        ).pR(6),
        //--- sign up button --
        PulseText.titleMedium(
          context.tr('log_in'),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.primaryTheme,
                fontWeight: FontWeight.bold,
              ),
          onPressed: () {
            context.pushNamed(AppRoute.signIn.name);
          },
        ),
      ],
    ).pT(30);
  }
}
