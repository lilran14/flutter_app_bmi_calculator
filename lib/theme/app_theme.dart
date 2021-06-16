import 'package:flutter/material.dart';
import 'package:flutter_app_bmi_calculator/theme/color_theme.dart';
import 'package:google_fonts/google_fonts.dart';

// Theme Data with Light Theme
final themeData = ThemeData.light().copyWith(
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          onSurface: kPrimaryDisableColor, primary: kPrimaryColor)),
  primaryColor: kPrimaryColor,
  disabledColor: kPrimaryDisableColor,
  accentColor: kAccentColor,
  appBarTheme: AppBarTheme(
      titleTextStyle:
          GoogleFonts.sourceSansPro(fontSize: 24, fontWeight: FontWeight.bold),
      centerTitle: true),
  scaffoldBackgroundColor: Color(0xFFEDF2F2),
  textTheme: GoogleFonts.sourceSansProTextTheme(),
);
