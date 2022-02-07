import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livenewspro/Screens/FavouriteScreen.dart';
import 'package:livenewspro/Screens/HomeScreen.dart';
import 'package:livenewspro/Screens/LiveStreamScreen.dart';
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
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox.expand(
            child: Container(
              margin: const EdgeInsets.only(bottom: 55.0),
              child: _selectedIndex==0?FavouritesScreen():_selectedIndex==1?HomeScreen():SettingsScreen(),
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
                      color: Colors.white,
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
      )),
    );
  }

  Widget buildNavBarItem(IconData icon, int index, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: _selectedIndex == index
          ? Container(
              height: 70,
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                children: [
                  Card(
                    elevation: 3.0,
                    color: AppTheme.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.5),
                        side: BorderSide(color: AppTheme.white, width: 1.5)),
                    child: SizedBox(
                      height: 35.0,
                      width: 35.0,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          icon,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    label,
                    style: TextStyle(color: AppTheme.purple),
                  ),
                  Container(
                    height: 2.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                        color: AppTheme.purple,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(1))),
                  )
                ],
              ),
            )
          : Container(
              height: 60,
              margin: EdgeInsets.only(bottom: 5.0),
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
