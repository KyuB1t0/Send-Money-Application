import 'package:flutter/material.dart';

abstract class MayaColors {
  static const int _primaryValue = 0xFFFFCD41;
  static const MaterialColor primary =
      MaterialColor(_primaryValue, <int, Color>{
        50: Color(0xFFFFE186),
        100: Color(0xFFFFDE79),
        200: Color(0xFFFFDC72),
        300: Color(0xFFFFD862),
        400: Color(0xFFFFD65A),
        500: Color(0xFFFFD247),
        600: Color(0xFFFFCF3E),
        700: Color(0xFFFFCD34),
        800: Color(0xFFFFC926),
        900: Color(0xFFFFCD41),
      });
  static const primaryColor = Colors.teal;
  static const primaryButtonDark = Color(0xFFFFC720);

  static const primaryButtonMid = Color(0xFFFFD453);
  static const primaryButtonLite = Color(0xFFFFE186);
  static const backgroundlite = Color(0xFF727272);
  static const yellow = Color(0xFFFFC415);
  static const background = Color(0xff000000);
  static const whiteBG = Color(0xfffbfbfb);
  static const backgroundsLite = Color(0xFF727272);
  static const backgroundLite = Color(0xFFC2C2C2);
  static const foreground = Color(0xffFFFFFF);
  static const accent = Color(0xFFFFFF0C2);
  static const blue = Colors.blue;
  static const black = Colors.black;
  static const semiPink = Color(0xFFFAEF9E);
  static const textListColor = Color(0xFF2C2C2C);

  static const primaryLinerGradient = LinearGradient(
    colors: [primaryButtonLite, primaryButtonMid, primaryButtonDark],
  );
  static const secondaryLinearGradient = LinearGradient(
    colors: [yellow, accent],
  );
}
