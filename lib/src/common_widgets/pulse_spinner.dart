import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PulseSpinner extends StatelessWidget {
  final Color? color;
  final double strokeWidth;
  final double size;

  const PulseSpinner({
    super.key,
    this.color,
    this.strokeWidth = 3.3,
    this.size = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: strokeWidth.h,
        ),
      ),
    );
  }
}
