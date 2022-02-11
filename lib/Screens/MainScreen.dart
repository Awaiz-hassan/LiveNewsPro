import 'package:flutter/material.dart';
import 'package:livenewspro/Screens/FavouriteScreen.dart';
import 'package:livenewspro/Screens/HomeScreen.dart';
import 'package:livenewspro/Screens/SettingScreen.dart';
import 'package:livenewspro/Theme/AppTheme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(child: SafeArea(child: Container(),),),
      SizedBox.expand(
        child: Container(
          margin: const EdgeInsets.only(bottom: 55.0),
          child: _selectedIndex == 0
              ? FavouritesScreen()
              : _selectedIndex == 1
                  ? HomeScreen()
                  : SettingsScreen(),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 70,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? AppTheme.white
                      : AppTheme.darkCard,
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    buildNavBarItem(Icons.favorite_rounded, 0, "Favourite"),
                    buildNavBarItem(Icons.home, 1, "Home"),
                    buildNavBarItem(Icons.settings, 2, "Settings"),
                  ],
                ),
              )
            ],
          ),
        ),
      )
        ],
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index, String label) {
    return _selectedIndex == index
        ? Container(
            height: 70,
            width: MediaQuery.of(context).size.width / 3,
            child: Column(
              children: [
                Card(
                  elevation: 3.0,
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? AppTheme.purple
                      : AppTheme.yellow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.5),
                      side: BorderSide(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? AppTheme.white
                              : AppTheme.darkCard,
                          width: 1.5)),
                  child: SizedBox(
                    height: 35.0,
                    width: 35.0,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Icon(
                        icon,
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.light
                            ? AppTheme.white
                            : AppTheme.darkBackground,
                      ),
                    ),
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? AppTheme.purple
                        : AppTheme.yellow,
                  ),
                ),
                Container(
                  height: 2.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? AppTheme.purple
                          : AppTheme.yellow,
                      borderRadius: const BorderRadius.all(Radius.circular(1))),
                )
              ],
            ),
          )
        : InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              height: 60,
              margin: const EdgeInsets.only(bottom: 5.0),
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    icon,
                    color: AppTheme.lightGrey,
                  ),
                  Text(
                    label,
                    style: TextStyle(color: AppTheme.lightGrey),
                  )
                ],
              ),
            ),
          );
  }
}
