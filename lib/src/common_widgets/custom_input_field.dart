import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse/src/constants/app_colors.dart';

class PulseInput extends StatefulWidget {
  const PulseInput({
    super.key,
    this.controller,
    this.autoFocus = false,
    this.hintText = '',
    this.labelText,
    this.onPressed,
    this.onFormSubmitted,
    this.onChanged,
    this.focusNode,
    this.enabled = true,
    this.leading,
    this.trailing,
    this.password = false,
    this.textCapitalization = TextCapitalization.none,
    this.textInputType = TextInputType.text,
    this.limit = 5000,
    this.inputFormatters = const [],
    this.errorWidget,
    this.isValidated,
    this.padding,
    this.textStyle,
    this.hintStyle,
  });

  final TextEditingController? controller;
  final bool autoFocus;
  final FocusNode? focusNode;
  final String hintText;
  final String? labelText;
  final Function()? onPressed;
  final Function(String)? onFormSubmitted;
  final Function(String)? onChanged;
  final bool enabled;
  final Widget? leading;
  final Widget? trailing;
  final bool password;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;
  final int limit;
  final List<TextInputFormatter> inputFormatters;
  final Widget? errorWidget;
  final bool? isValidated;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  @override
  State<PulseInput> createState() => _PulseInputState();
}

class _PulseInputState extends State<PulseInput> {
  bool _passwordVisible = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _passwordVisible = !widget.password;
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void didUpdateWidget(covariant PulseInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != null &&
        oldWidget.controller != widget.controller) {
      _controller = widget.controller!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    //-----------------------------------
    return TextFormField(
      controller: _controller,
      autofocus: widget.autoFocus,
      focusNode: widget.focusNode,
      onTap: widget.onPressed,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      obscureText: widget.password && !_passwordVisible,
      style: widget.textStyle ??
          Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .color!
                    .withOpacity(0.8),
                fontSize: 17.spMax,
              ),
      maxLength: widget.limit,
      keyboardType: widget.textInputType,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: widget.onFormSubmitted,
      textCapitalization: widget.textCapitalization,
      onChanged: (val) {
        widget.onChanged?.call(val);
        setState(() {});
      },
      decoration: InputDecoration(
        hintText: widget.hintText,

        counterText: '',
        contentPadding: widget.padding ??
            EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        prefixIcon: widget.leading,
        error: widget.errorWidget,
        suffixIcon: widget.password
            ? IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : widget.trailing,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
              color: (widget.isValidated != null)
                  ? widget.isValidated!
                      ? Colors.green
                      : AppColors.errorRed
                  : AppColors.errorRed,
              width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
              color: (widget.isValidated != null)
                  ? widget.isValidated!
                      ? Colors.green
                      : AppColors.errorRed
                  : AppColors.errorRed,
              width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
              color: themeContext.colorScheme.onSurface.withOpacity(0.5),
              width: 1.7),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide:
              BorderSide(color: themeContext.colorScheme.onSurface, width: 2),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
              color: themeContext.colorScheme.onSurface.withOpacity(0.5),
              width: 1.7),
        ),
        // floatingLabelBehavior: FloatingLabelBehavior.auto,
        // labelStyle: TextStyle(
        //   color: _isFocused ? Theme.of(context).primaryColor : Colors.grey,
        // ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
              color: themeContext.colorScheme.onSurface.withOpacity(0.5),
              width: 1.7),
        ),
        //--
        hintStyle: widget.hintStyle ??
            themeContext.textTheme.titleSmall!.copyWith(
              color: Colors.grey.shade500,
              fontSize: 16.sp,
            ),
      ),
    );
  }
}
