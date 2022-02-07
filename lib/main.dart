import 'package:flutter/material.dart';
import 'package:livenewspro/Screens/LoginScreen.dart';
import 'package:livenewspro/Screens/MainScreen.dart';
import 'package:livenewspro/Screens/SplashScreen.dart';
import 'package:livenewspro/Theme/AppTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Live News Pro',
        theme: AppTheme.getLightTheme(context),
        darkTheme: AppTheme.getDarkTheme(context),
        routes: {"/": (context) => SplashScreen()});
  }

}
