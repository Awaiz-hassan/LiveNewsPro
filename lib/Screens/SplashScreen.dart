import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livenewspro/Screens/LoginScreen.dart';
import 'package:livenewspro/Theme/AppTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MainScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void toMainScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? logged = prefs.getBool('logged');
    if (logged != null) {
      if (logged) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainScreen()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            child: Image.asset(
              "assets/images/background_purple.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/images/circles.png",
              color: Colors.white,
              width: MediaQuery.of(context).size.height / 2,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                curve: Curves.ease,
                onEnd: (){
                  toMainScreen();
                },
                duration: const Duration(seconds: 3),
                builder: (BuildContext context, double opacity, Widget? child) {
                  return Container(
                    margin: EdgeInsets.all(100),
                    child: Opacity(
                        opacity: opacity,
                        child: Image.asset(
                          "assets/images/logo_splash.png",
                        )),
                  );
                }),
          )
        ],
      ),
    );
  }
}
