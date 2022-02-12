import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:livenewspro/Controller/ChannelsController.dart';
import 'package:livenewspro/Controller/FavouritesController.dart';
import 'package:livenewspro/Controller/UserDetailsController.dart';
import 'package:livenewspro/Screens/EditProfile.dart';
import 'package:livenewspro/Screens/LoginScreen.dart';
import 'package:livenewspro/Screens/WebViewScreen.dart';
import 'package:livenewspro/Theme/AppTheme.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final UserDetailsController _userDetailsController =
      Get.put(UserDetailsController());

  bool _isToggled=false;
  @override
  void initState() {
    if(Get.isDarkMode) {setState(() {
      _isToggled=true;
    });}
    else{
      setState(() {
        _isToggled=false;
      });
    }
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          MediaQuery.of(context).platformBrightness == Brightness.light
              ? AppTheme.backgroundColor
              : AppTheme.darkBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/images/circles.png",
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? AppTheme.darkGrey
                    : AppTheme.white,
                width: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.contain,
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Obx(
                () => _userDetailsController.isLoading.value
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                            child: Lottie.asset(
                                'assets/json/loading_animation.json',
                                height: 150.0)))
                    : Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(20.0),
                            child: Card(
                              color:
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.light
                                      ? AppTheme.white
                                      : AppTheme.darkCard,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text("Edit Profile"),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditProfile()));
                                        },
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 20.0, left: 30.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Card(
                                          color: MediaQuery.of(context)
                                                      .platformBrightness ==
                                                  Brightness.light
                                              ? AppTheme.white
                                              : AppTheme.darkBackground,
                                          child: Container(
                                            height: 90.0,
                                            width: 90.0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: SvgPicture.asset(
                                                "assets/icons/user_avatar.svg",
                                                height: 27,
                                                width: 27,
                                                color: MediaQuery.of(context)
                                                            .platformBrightness ==
                                                        Brightness.light
                                                    ? AppTheme.purple
                                                    : AppTheme.darkCard,
                                              ),
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  _userDetailsController
                                                      .name.string,
                                                  style: TextStyle(
                                                      color: MediaQuery.of(
                                                                      context)
                                                                  .platformBrightness ==
                                                              Brightness.light
                                                          ? AppTheme.purple
                                                          : AppTheme.white,
                                                      fontSize: 20.0),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                                margin: const EdgeInsets.only(
                                                    top: 22.0,
                                                    left: 5.0,
                                                    right: 5.0),
                                              ),
                                              Container(
                                                child: Text(
                                                  _userDetailsController
                                                      .email.string,
                                                  style: TextStyle(
                                                      color: AppTheme.lightGrey,
                                                      fontSize: 15.0),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                                margin: EdgeInsets.only(
                                                    left: 5.0,
                                                    right: 5.0,
                                                    top: 3.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 15.0, bottom: 15.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "Package Type",
                                                  style: TextStyle(
                                                      color: MediaQuery.of(
                                                                      context)
                                                                  .platformBrightness ==
                                                              Brightness.light
                                                          ? AppTheme.purple
                                                          : AppTheme.white,
                                                      fontSize: 12.0),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                                margin: const EdgeInsets.only(
                                                    left: 30.0,
                                                    right: 20.0,
                                                    top: 3.0),
                                              ),
                                              Container(
                                                child: Text(
                                                  _userDetailsController
                                                      .packageType.string,
                                                  style: TextStyle(
                                                      color: AppTheme.yellow,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.0),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                                margin: const EdgeInsets.only(
                                                    top: 2.0,
                                                    left: 30.0,
                                                    right: 22.0),
                                                height: 25.0,
                                              ),
                                            ],
                                          ),
                                          flex: 6,
                                        ),
                                        Expanded(
                                          child: Container(
                                            constraints:
                                                BoxConstraints(maxWidth: 120),
                                            margin: const EdgeInsets.only(
                                                right: 20.0),
                                            height: 33.0,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const WebViewMain(
                                                              pageUrl:
                                                                  'https://livenewspro.com/pricing/',
                                                            )));
                                              },
                                              style: TextButton.styleFrom(
                                                primary: MediaQuery.of(context)
                                                            .platformBrightness ==
                                                        Brightness.light
                                                    ? AppTheme.white
                                                    : AppTheme.darkBackground,
                                                backgroundColor: MediaQuery.of(
                                                                context)
                                                            .platformBrightness ==
                                                        Brightness.light
                                                    ? AppTheme.purple
                                                    : AppTheme.yellow,
                                                shape: const StadiumBorder(),
                                              ),
                                              child: const Text(
                                                "Upgrade",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          flex: 4,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? AppTheme.white
                                : AppTheme.darkCard,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            margin: const EdgeInsets.only(
                                top: 10, left: 30, right: 30, bottom: 30),
                            child: SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Night Mode",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: MediaQuery.of(context)
                                                        .platformBrightness ==
                                                    Brightness.light
                                                ? AppTheme.purple
                                                : AppTheme.white),
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(right: 20.0),
                                    child: FlutterSwitch(
                                      width: 50.0,
                                      height: 25.0,
                                      toggleSize: 22.0,
                                      value: _isToggled,
                                      borderRadius: 15.0,
                                      padding: 1.0,
                                      activeToggleColor: AppTheme.yellow,
                                      inactiveToggleColor: AppTheme.purple,
                                      activeSwitchBorder: Border.all(
                                        color: AppTheme.yellow,
                                        width: 1.5,
                                      ),
                                      inactiveSwitchBorder: Border.all(
                                        color: AppTheme.purple,
                                        width: 1.5,
                                      ),
                                      activeColor: AppTheme.darkBackground,
                                      inactiveColor: Colors.white,
                                      activeIcon: Icon(
                                        Icons.nightlight_round,
                                        color: AppTheme.darkBackground,
                                      ),
                                      inactiveIcon: Icon(
                                        Icons.wb_sunny,
                                        color: AppTheme.white,
                                      ),
                                      onToggle: (val) {
                                        setState(() {
                                          _isToggled = val;
                                        });
                                        if(Get.isDarkMode){
                                          Get.changeThemeMode(ThemeMode.light);
                                        }
                                        else{
                                          Get.changeThemeMode(ThemeMode.dark);
                                        }
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    "Package Details",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.light
                                            ? AppTheme.purple
                                            : AppTheme.lightGrey),
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 30.0, top: 15.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 15.0),
                                  child: Text(
                                    "User ID",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: AppTheme.lightGrey),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: Card(
                                color:
                                    MediaQuery.of(context).platformBrightness ==
                                            Brightness.light
                                        ? AppTheme.white
                                        : AppTheme.darkCard,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(
                                        color: MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.light
                                            ? AppTheme.purple
                                            : AppTheme.darkBackground,
                                        width: 1.5)),
                                child: Container(
                                  height: 40.0,
                                  child: SizedBox.expand(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 11.0, left: 10.0, right: 10.0),
                                      child: Text(
                                        _userDetailsController.userID.string,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: MediaQuery.of(context)
                                                      .platformBrightness ==
                                                  Brightness.light
                                              ? AppTheme.purple
                                              : AppTheme.white,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 30.0, top: 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 15.0),
                                  child: Text(
                                    "Package Validity",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: AppTheme.lightGrey),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: Card(
                                color:
                                    MediaQuery.of(context).platformBrightness ==
                                            Brightness.light
                                        ? AppTheme.white
                                        : AppTheme.darkCard,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(
                                        color: MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.light
                                            ? AppTheme.purple
                                            : AppTheme.darkBackground,
                                        width: 1.5)),
                                child: Container(
                                  height: 40.0,
                                  child: SizedBox.expand(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 11.0, left: 10.0, right: 10.0),
                                      child: Text(
                                        _userDetailsController.expDate.string,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: MediaQuery.of(context)
                                                      .platformBrightness ==
                                                  Brightness.light
                                              ? AppTheme.purple
                                              : AppTheme.white,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 30.0, top: 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 15.0),
                                  child: Text(
                                    "Package Cost",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: AppTheme.lightGrey),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: Card(
                                color:
                                    MediaQuery.of(context).platformBrightness ==
                                            Brightness.light
                                        ? AppTheme.white
                                        : AppTheme.darkCard,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(
                                        color: MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.light
                                            ? AppTheme.purple
                                            : AppTheme.darkBackground,
                                        width: 1.5)),
                                child: Container(
                                  height: 40.0,
                                  child: SizedBox.expand(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 10.0, right: 10.0),
                                      child: Text(
                                        _userDetailsController.price.string,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: MediaQuery.of(context)
                                                      .platformBrightness ==
                                                  Brightness.light
                                              ? AppTheme.purple
                                              : AppTheme.white,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 40.0, bottom: 40.0),
                                height: 33.0,
                                width:
                                    MediaQuery.of(context).size.shortestSide <
                                            550
                                        ? 120
                                        : 240,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    Get.delete<ChannelsController>();
                                    Get.delete<UserDetailsController>();
                                    Get.delete<FavController>();
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.clear();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                                  },
                                  style: TextButton.styleFrom(
                                    primary: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.light
                                        ? AppTheme.white
                                        : AppTheme.darkBackground,
                                    backgroundColor: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.light
                                        ? AppTheme.purple
                                        : AppTheme.yellow,
                                    shape: const StadiumBorder(),
                                  ),
                                  child: const Text(
                                    "Signout",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
