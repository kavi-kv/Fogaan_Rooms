import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle logoHeadingStyle(Color? color, [double? fontSize = 16]) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        color: color ?? Colors.black);
  }

  static TextStyle headingOneStyle(Color? color, [double? fontSize = 24]) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: color ?? Colors.black,
    );
  }

  static TextStyle headingTwoStyle(Color? color, [double fontSize = 20]) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: color ?? Colors.black,
    );
  }

  static TextStyle subheadingStyle(Color? color) {
    return TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: color ?? Colors.black);
  }

  static TextStyle normalStyle(Color? color) {
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: color ?? Colors.black);
  }

  static TextStyle mediumSmallStyle(Color? color) {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color ?? Colors.black);
  }

  static TextStyle smallStyle(Color? color) {
    return TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: color ?? Colors.black);
  }
}
