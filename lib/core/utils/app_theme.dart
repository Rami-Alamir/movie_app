import 'package:flutter/material.dart';
import '../constants/constants.dart';

Color primaryColor = Colors.white;

class AppTheme {
  AppTheme._();
  static final ThemeData theme = ThemeData(
    splashColor: Colors.white,
    primaryColor: primaryColor,
    fontFamily: Constants.fontFamily,
    canvasColor: Colors.transparent,
    backgroundColor: const Color.fromRGBO(66, 81, 161, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(66, 81, 161, 1),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.bold, color: primaryColor, fontSize: 24),
      headline2: TextStyle(
          fontWeight: FontWeight.w700, color: primaryColor, fontSize: 12),
      headline3: TextStyle(
          fontWeight: FontWeight.w700, color: primaryColor, fontSize: 16),
      headline4: TextStyle(
          fontWeight: FontWeight.bold, color: primaryColor, fontSize: 18),
      headline5: TextStyle(
          fontWeight: FontWeight.w400, color: primaryColor, fontSize: 16),
      headline6: const TextStyle(
          fontWeight: FontWeight.normal, color: Colors.white70, fontSize: 14),
      subtitle2: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 16,
          height: 2.4),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color.fromRGBO(66, 81, 161, 1),
      secondary: const Color.fromRGBO(107, 158, 215, 1),
      primaryContainer: const Color.fromRGBO(240, 240, 240, 1),
      secondaryContainer: const Color.fromRGBO(88, 118, 185, 1),
    ),
  );
}
