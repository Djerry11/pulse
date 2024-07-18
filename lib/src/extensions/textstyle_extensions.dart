//--------------------------------- TextStyle ---------------------------------
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension TextStyleExt on TextStyle {
  TextStyle get spMin {
    return copyWith(
      fontSize: fontSize!.spMin,
    );
  }

  TextStyle get spMax {
    return copyWith(
      fontSize: fontSize!.spMax,
    );
  }

  TextStyle get bold {
    return copyWith(
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle applyColor(Color color) {
    return copyWith(
      color: color,
    );
  }

  TextStyle get italic {
    return copyWith(
      fontStyle: FontStyle.italic,
    );
  }

  TextStyle get underline {
    return copyWith(
      decoration: TextDecoration.underline,
    );
  }

  TextStyle get lineThrough {
    return copyWith(
      decoration: TextDecoration.lineThrough,
    );
  }

  TextStyle get overline {
    return copyWith(
      decoration: TextDecoration.overline,
    );
  }
}
