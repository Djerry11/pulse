import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetExtensions on Widget {
  //--------------------------------- Button actions ---------------------------------
  Widget onPressed(final Function()? onPressed) => GestureDetector(
        onTap: onPressed,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  Widget onPressedDown(final Function(TapDownDetails)? onPressed) =>
      GestureDetector(
        onTapDown: onPressed,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  Widget onPressedUp(final Function(TapUpDetails)? onPressed) =>
      GestureDetector(
        onTapUp: onPressed,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  Widget onLongPressed(final Function()? onLongPressed) => GestureDetector(
        onLongPress: onLongPressed,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  //--------------------------------- Padding ---------------------------------
  Widget pX(double val) => Padding(
        padding: EdgeInsets.symmetric(horizontal: val.w),
        child: this,
      );

  Widget pY(double val) => Padding(
        padding: EdgeInsets.symmetric(vertical: val.h),
        child: this,
      );

  Widget pXY(double x, double y) => Padding(
        padding: EdgeInsets.symmetric(horizontal: x.w, vertical: y.h),
        child: this,
      );

  Widget pT(double val) => Padding(
        padding: EdgeInsets.only(top: val.h),
        child: this,
      );

  Widget pL(double val) => Padding(
        padding: EdgeInsets.only(left: val.w),
        child: this,
      );

  Widget pR(double val) => Padding(
        padding: EdgeInsets.only(right: val.w),
        child: this,
      );

  Widget pB(double val) => Padding(
        padding: EdgeInsets.only(bottom: val.h),
        child: this,
      );

  Widget pad(double val) => Padding(
        padding: EdgeInsets.all(val.w),
        child: this,
      );
}

extension WidgetListExtensions on List<Widget> {
  Widget toColumn(
          {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start}) =>
      Column(
        mainAxisAlignment: mainAxisAlignment,
        children: this,
      );

  Widget toRow(
          {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start}) =>
      Row(
        mainAxisAlignment: mainAxisAlignment,
        children: this,
      );
}

extension DateTimeExtensions on DateTime {
  String get toFormattedString {
    return '$day/$month/$year';
  }

  int get toInt {
    return millisecondsSinceEpoch;
  }
}

extension IntExt on int {
  DateTime get toDate {
    return DateTime.fromMillisecondsSinceEpoch(this);
  }
}
