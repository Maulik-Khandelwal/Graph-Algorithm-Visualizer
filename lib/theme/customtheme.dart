import 'package:flutter/material.dart';

class CustomTheme {
  static Color darkNavy = Color(0xff1C2938);
  static Color lightNavy = Color(0xff9B9BAF);
  static Color backGroundGreyColor = Color(0xff1D1D1D);
  static Color darkAccent = Color(0xff26303d);
  static Color primaryColor = Color(0xff238985);
  static Color accentColor = Color(0xff08FDD8);
  static Color pale = Colors.white;

  ThemeData buildTheme() {
    return ThemeData(
      canvasColor: darkNavy,
      hintColor: lightNavy,
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: accentColor)),
      ),
      scaffoldBackgroundColor: backGroundGreyColor,
      primaryColor: primaryColor,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        color: Color(0xff181818).withOpacity(0),
      ),
      accentColor: accentColor,
      focusColor: darkAccent,
      highlightColor: pale,
    );
  }
}