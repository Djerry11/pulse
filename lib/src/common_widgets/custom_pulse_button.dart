import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse/src/common_widgets/pulse_spinner.dart';
import 'package:pulse/src/constants/app_colors.dart';

enum Type {
  filled,
  outlined,
}

class CustomPulseButton extends StatelessWidget {
  final Type type;

  final String? text;
  final TextStyle? textStyle;
  final Color? color;
  final Color? splashColor;
  final BorderSide? borderSide;

  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final double? width;
  final double? height;

  final double? borderRadius;
  final EdgeInsets? padding;
  final double elevation;

  final bool isLoading;
  final Widget? loader;
  final double? spinnerSize;

  final List<Color>? gradientColors;

  final Function()? onPressed;

//---------------------------------------------------------------------
  const CustomPulseButton.filled({
    super.key,
    required this.text,
    this.textStyle,
    this.color,
    this.splashColor,
    this.borderSide,
    this.trailingIcon,
    this.leadingIcon,
    this.width,
    this.borderRadius,
    this.padding,
    this.elevation = 0.0,
    this.isLoading = false,
    this.loader,
    this.onPressed,
    this.height,
    this.spinnerSize,
    this.gradientColors,
  }) : type = Type.filled;
  //---------------------------------------------------------------------
  const CustomPulseButton.outlined({
    super.key,
    required this.text,
    this.textStyle,
    this.color,
    this.splashColor,
    this.borderSide,
    this.leadingIcon,
    this.trailingIcon,
    this.width,
    this.borderRadius,
    this.padding,
    this.elevation = 0.0,
    this.isLoading = false,
    this.loader,
    this.onPressed,
    this.height,
    this.spinnerSize,
    this.gradientColors,
  }) : type = Type.outlined;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case Type.filled:
        return _buildFilledButton(context);
      case Type.outlined:
        return _buildOutlinedButton(context);
    }
  }
  //----------- _buildFilledButton() -----------------

  Widget _buildFilledButton(final BuildContext context) {
    final spinnerHeight = (textStyle?.fontSize ?? 24) * 1.5;
    final elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: borderRadius == null
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!.r),
            ),
      elevation: elevation,
      padding: padding,
    );

    return SizedBox(
      width: width?.w,
      height: height?.h,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              gradientColors?.first ?? AppColors.lightPrimary,
              gradientColors?[1] ?? AppColors.darkPrimary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!.r)
              : BorderRadius.circular(10.0),
        ),
        child: ElevatedButton(
          onPressed: isLoading ? () {} : onPressed,
          style: elevatedButtonStyle,
          child: Container(
            alignment: Alignment.center,
            child: isLoading
                ? loader ??
                    PulseSpinner(
                      size: spinnerHeight,
                      color: Colors.white,
                    )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (leadingIcon != null)
                        leadingIcon ?? const SizedBox.shrink(),
                      if (text != null && !isLoading)
                        Text(
                          '$text',
                          style: textStyle,
                        ),
                      if (trailingIcon != null)
                        trailingIcon ?? const SizedBox.shrink(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  // --outlinedButton()--
  Widget _buildOutlinedButton(final BuildContext context) {
    //--------- outlinedButtonStyle ---------
    final outlinedButtonStyle = OutlinedButton.styleFrom(
      side: borderSide ??
          BorderSide(
            color: color ?? Theme.of(context).primaryColor,
            width: 1.8.w,
          ),
      shape: borderRadius == null
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!.r),
            ),
      elevation: elevation,
      padding: padding,
    );

    return SizedBox(
      width: width?.w,
      height: height?.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: outlinedButtonStyle,
        child: isLoading
            ? loader ??
                PulseSpinner(
                  size: spinnerSize ?? 24.h,
                  color: outlinedButtonStyle.side?.resolve(
                    const <WidgetState>{
                      WidgetState.pressed,
                      WidgetState.hovered,
                      WidgetState.focused,
                    },
                  )?.color,
                )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leadingIcon != null)
                    leadingIcon ?? const SizedBox.shrink(),
                  if (text != null)
                    Text(
                      '$text',
                      style: textStyle,
                    ),
                  if (trailingIcon != null && text != null)
                    if (trailingIcon != null)
                      trailingIcon ?? const SizedBox.shrink(),
                ],
              ),
      ),
    );
  }
}
