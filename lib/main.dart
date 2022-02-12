import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:livenewspro/Screens/SplashScreen.dart';
import 'package:livenewspro/Theme/AppTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Live News Pro',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routes: {"/": (context) => SplashScreen()});
  }

}
