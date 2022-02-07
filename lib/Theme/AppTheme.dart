import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getLightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.grey, fontFamily: "assets/font/lato_regular.ttf");

  static ThemeData getDarkTheme(BuildContext context) =>
      ThemeData(primarySwatch: Colors.grey);

  static Color yellow = const Color(0XFFFFA737);
  static Color lightGrey = const Color(0XFFAEB5C0);
  static Color backgroundColor = const Color(0XFFF3F3FF);
  static Color darkGrey = const Color(0XFF323643);
  static Color tabBarColor = const Color(0XFFF5F5F5);
  static Color purple = const Color(0XFF0A0E7D);
  static Color white = const Color(0XFFFFFFFF);
  static Color grey = const Color(0XFF8B8B8B);
}
