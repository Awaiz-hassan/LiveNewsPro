import 'package:flutter/material.dart';

class AppTheme {


  static final light = ThemeData.light();
  static final dark = ThemeData.dark();


  static ThemeData getLightTheme(BuildContext context) => ThemeData(
      primarySwatch: purpleMain, fontFamily: "assets/font/lato_regular.ttf");

  static ThemeData getDarkTheme(BuildContext context) =>
      ThemeData(primarySwatch: darkMain);





  static const MaterialColor purpleMain = MaterialColor(
    _purplePrimaryValue,
    <int, Color>{
      50: Color(0xFFECEFF1),
      100: Color(0xFFe7e7f2),
      200: Color(0xFF9d9fcb),
      300: Color(0xFF8587be),
      400: Color(0xFF6c6eb1),
      500: Color(_purplePrimaryValue),
      600: Color(0xFF5456a4),
      700: Color(0xFF3b3e97),
      800: Color(0xFF23268a),
      900: Color(0xFF23268a),
    },
  );
  static const int _purplePrimaryValue = 0xFF0A0E7D;



  static const MaterialColor darkMain = MaterialColor(
    _darkPrimaryValue,
    <int, Color>{
      50: Color(0xFF12121e),
      100: Color(0xFF12121e),
      200: Color(0xFF12121e),
      300: Color(0xFF12121e),
      400: Color(0xFF12121e),
      500: Color(_purplePrimaryValue),
      600: Color(0xFF151522),
      700: Color(0xFF151522),
      800: Color(0xFF12121e),
      900: Color(0xFF12121e),
    },
  );
  static const int _darkPrimaryValue = 0xFF171726;


  //light theme
  static Color yellow = const Color(0XFFFFA737);
  static Color lightGrey = const Color(0XFFAEB5C0);
  static Color backgroundColor = const Color(0XFFF3F3FF);
  static Color darkGrey = const Color(0XFF323643);
  static Color tabBarColor = const Color(0XFFF5F5F5);
  static Color purple = const Color(0XFF0A0E7D);
  static Color white = const Color(0XFFFFFFFF);
  static Color grey = const Color(0XFF8B8B8B);

  // dark theme
  static Color darkBackground = const Color(0XFF171726);
  static Color darkCard = const Color(0XFF33334a);




}
