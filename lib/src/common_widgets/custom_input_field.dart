import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    this.enabled = true,
    this.leading,
    this.trailing,
    this.password = false,
    this.textCapitalization = TextCapitalization.none,
    this.textInputType = TextInputType.text,
    this.limit = 5000,
    this.inputFormatters = const [],
  });

  final TextEditingController? controller;
  final bool autoFocus;
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
    return TextFormField(
      controller: _controller,
      autofocus: widget.autoFocus,
      onTap: widget.onPressed,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      obscureText: widget.password && !_passwordVisible,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
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
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        prefixIcon: widget.leading,
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey.shade600, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        // labelStyle: TextStyle(
        //   color: _isFocused ? Theme.of(context).primaryColor : Colors.grey,
        // ),
        hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.grey.shade500,
            ),
      ),
    );
  }
}
