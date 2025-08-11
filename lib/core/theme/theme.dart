import 'package:flutter/material.dart';

import 'constants/colors.dart';
import 'constants/font_size.dart';

class YTOLiteTheme {
  static ThemeData get lightTheme => ThemeData(
    primarySwatch: Colors.blue,
    unselectedWidgetColor: ODWColor.primaryColor,
    primaryColor: ODWColor.primaryColor,
    fontFamily: 'Avenir',
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: ODWColor.primaryColor,
        fixedSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        color: ODWColor.black,
        fontSize: ODFontSize.xSmall16,
      ),
      titleMedium: TextStyle(
        color: ODWColor.black,
        fontSize: ODFontSize.small18,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: ODWColor.black,
        fontSize: ODFontSize.medium30,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: ODWColor.black,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
