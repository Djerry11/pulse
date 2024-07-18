import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse/src/common_widgets/custom_input_field.dart';
import 'package:pulse/src/common_widgets/custom_pulse_button.dart';
import 'package:pulse/src/constants/app_colors.dart';
import 'package:pulse/src/constants/app_sizes.dart';
import 'package:pulse/src/extensions/textstyle_extensions.dart';
import 'package:pulse/src/extensions/widget_extensions.dart';

import 'package:pulse/src/routing/app_routes.dart';

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
  final Widget? extraWidget;
  final Widget? inputLeading;
  final Widget? inputTrailing;
  final Widget? errorWidget;
  final Function(String)? onChanged;
  final Function(String)? onConfirmChanged;
  final List<Color>? gradientColors;
  final bool? isFormValidated;

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
    this.extraWidget,
    this.inputLeading,
    this.inputTrailing,
    this.errorWidget,
    this.onChanged,
    this.onConfirmChanged,
    this.gradientColors,
    this.isFormValidated,
  });

  @override
  State<PulseSignupPage> createState() => _PulseSignupPageState();
}

class _PulseSignupPageState extends State<PulseSignupPage> {
  var selectedDate = DateTime(1990, 1, 1);
  @override
  Widget build(BuildContext context) {
    final backGround = Theme.of(context).colorScheme.surface;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isBirthday = widget.title.contains('birthday');
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
                        gapH20,
                        _pageHeaderBuilder(textTheme),
                        gapH24,
                        if (!isBirthday) _buildInputField(textTheme),
                        if (widget.inputLabel == 'password')
                          _buildConfirmField(textTheme),
                        widget.extraWidget ?? const SizedBox.shrink(),
                        if (isBirthday) _buildBirthdayPicker(),
                        Expanded(child: gapH4),
                        _nextButtonBuilder(context),
                        _alreadyHaveAccountBuilder(context),
                        gapH48,
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

  Widget _buildBirthdayPicker() {
    final theme = Theme.of(context);
    final TextStyle textStyle = theme.textTheme.titleSmall!.spMax.bold;

    return Column(
      children: [
        PulseInput(
          padding: EdgeInsets.only(left: 25.w),
          controller: widget.controller,
          textInputType: TextInputType.none,
          hintText: 'Select your birthday',
          errorWidget: widget.errorWidget,
          textStyle: textStyle.applyColor(
            theme.textTheme.titleSmall!.color!.withOpacity(0.8),
          ),
          hintStyle: textStyle.applyColor(
            theme.textTheme.titleSmall!.color!.withOpacity(0.6),
          ),
          enabled: false,
        ),
        CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            firstDate: DateTime(1900, 1, 1),
            lastDate: DateTime.now(),
            controlsTextStyle: textStyle,
            dayTextStyle: textStyle,
            hideMonthPickerDividers: true,
            selectedDayHighlightColor: AppColors.primaryTheme,
            selectedDayTextStyle: textStyle.applyColor(Colors.white),
            weekdayLabelTextStyle: textStyle.applyColor(
              theme.textTheme.titleSmall!.color!.withOpacity(0.5),
            ),
            monthTextStyle: textStyle,
            yearTextStyle: textStyle,
            daySplashColor: Colors.transparent,
            weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
          ),
          // displayedMonthDate: widget.selectedDate,
          value: const [],
          onValueChanged: (value) {
            selectedDate = value.first;
            //---display selected date on form
            widget.controller.text = DateFormat.yMMMd().format(selectedDate);
            //---send selected date
            widget.onChanged!(selectedDate.millisecondsSinceEpoch.toString());
          },
        ),
      ],
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
          leading: widget.inputLeading,
          trailing: widget.inputTrailing,
          controller: widget.controller,
          password: widget.inputLabel == 'password',
          textInputType: TextInputType.text,
          isValidated: widget.isFormValidated,
          errorWidget:
              widget.onConfirmChanged != null ? null : widget.errorWidget,
          onChanged: widget.onChanged,
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
          errorWidget: widget.errorWidget,
          isValidated: widget.isFormValidated,
          onChanged: (val) {},
        ),
      ],
    );
  }

  // ----------------- next button -----------------
  Widget _nextButtonBuilder(BuildContext context) {
    return CustomPulseButton.filled(
      text: context.tr('next'),
      height: AppSizes.buttonHeight,
      onPressed: widget.onPressed,
      gradientColors: widget.gradientColors,
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
                fontSize:
                    Theme.of(context).textTheme.titleMedium!.fontSize!.spMax,
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
