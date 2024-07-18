import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Constant sizes to be used in the app (paddings, gaps, rounded corners etc.)
class Sizes {
  static const p4 = 4.0;
  static const p8 = 8.0;
  static const p12 = 12.0;
  static const p16 = 16.0;
  static const p20 = 20.0;
  static const p24 = 24.0;
  static const p32 = 32.0;
  static const p48 = 48.0;
  static const p64 = 64.0;
}

/// Constant gap widths
final gapW4 = SizedBox(width: Sizes.p4.w);
final gapW8 = SizedBox(width: Sizes.p8.w);
final gapW12 = SizedBox(width: Sizes.p12.w);
final gapW16 = SizedBox(width: Sizes.p16.w);
final gapW20 = SizedBox(width: Sizes.p20.w);
final gapW24 = SizedBox(width: Sizes.p24.w);
final gapW32 = SizedBox(width: Sizes.p32.w);
final gapW48 = SizedBox(width: Sizes.p48.w);
final gapW64 = SizedBox(width: Sizes.p64.w);

/// Constant gap heights
final gapH4 = SizedBox(height: Sizes.p4.h);
final gapH8 = SizedBox(height: Sizes.p8.h);
final gapH12 = SizedBox(height: Sizes.p12.h);
final gapH16 = SizedBox(height: Sizes.p16.h);
final gapH20 = SizedBox(height: Sizes.p20.h);
final gapH24 = SizedBox(height: Sizes.p24.h);
final gapH32 = SizedBox(height: Sizes.p32.h);
final gapH48 = SizedBox(height: Sizes.p48.h);
final gapH64 = SizedBox(height: Sizes.p64.h);

class AppSizes {
  static double buttonHeight = 60.spMin;
}
