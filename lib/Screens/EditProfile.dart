import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:livenewspro/Controller/UserDetailsController.dart';
import 'package:livenewspro/Theme/AppTheme.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String firstName = "";
  String lastName = "";
  String email = "";
  String userName = "";
  String userId = "";
  bool loading = false;
  bool _isObscure=true;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void initState() {
    getUser();
    super.initState();
  }

  updateUser(String userName, String email, String firstName, String lastName,
      String password, String id) async {
    setState(() {
      loading = true;
    });
    var client = http.Client();
    String url = "https://livenewspro.com/wp-json/mp/v1/members?id=" + id;
    try {
      var response = await client.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'MEMBERPRESS-API-KEY': 'SftrOcH824',
          },
          body: jsonEncode(<String, String>{
            'username': userName,
            'email': email,
            'password': password,
            'first_name': firstName,
            'last_name': lastName,
          }));
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          elevation: 8.0,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10.0),
          content: Text("User details updated !"),
          backgroundColor: Colors.green,

        ));
        Get.delete<UserDetailsController>();

        setState(() {
          loading = false;
        });
      } else if (response.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          elevation: 8.0,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10.0),
          content: Text("Error occurred try again later !"),
          backgroundColor: Colors.red,
        ));

        setState(() {
          loading = false;
        });
      }
      print(response.statusCode);
    } on Exception {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        elevation: 8.0,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10.0),
        content: Text("Server Error !"),
        backgroundColor: Colors.red,
      ));

      setState(() {
        loading = false;
      });
    }
  }

  void getUser() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      firstNameController.text = prefs.getString('FirstName')!;
      lastNameController.text = prefs.getString('LastName')!;
      email = prefs.getString('Email')!;
      userName = prefs.getString('userName')!;
      userId = prefs.getString('userId')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:                   MediaQuery.of(context).platformBrightness == Brightness.light
            ? AppTheme.backgroundColor
            : AppTheme.darkBackground,
        body: Stack(children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/images/circles.png",
              color: MediaQuery.of(context).platformBrightness == Brightness.light
                  ? AppTheme.darkGrey
                  : AppTheme.white,
              width: MediaQuery.of(context).size.height / 2,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: MediaQuery.of(context).platformBrightness == Brightness.light
                                      ? AppTheme.purple
                                      : AppTheme.white,
                                )),
                            Text(
                              "Edit Profile",
                              style: TextStyle(
                                  color: MediaQuery.of(context).platformBrightness == Brightness.light
                                      ? AppTheme.purple
                                      : AppTheme.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 5,
                              width: 50,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 30.0, top: 15.0),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, left: 15.0),
                                          child: Text(
                                            "First Name",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: AppTheme.lightGrey),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 30, right: 15),
                                    child: Card(
                                      color: MediaQuery.of(context).platformBrightness == Brightness.light
                                          ? AppTheme.white
                                          : AppTheme.darkCard,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            side: BorderSide(
                                                color: MediaQuery.of(context).platformBrightness == Brightness.light
                                                    ? AppTheme.purple
                                                    : AppTheme.darkBackground,
                                                width: 1.5)),
                                        child: Container(
                                          height: 40.0,
                                          child: SizedBox.expand(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0.0,
                                                  left: 10.0,
                                                  right: 10.0),
                                              child: TextField(
                                                controller: firstNameController,
                                                cursorColor: AppTheme.purple,
                                                style: TextStyle(
                                                    color: MediaQuery.of(context).platformBrightness == Brightness.light
                                                        ? AppTheme.purple
                                                        : AppTheme.white),
                                                textInputAction:
                                                    TextInputAction.search,
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                            left: 3.0,
                                                            right: 3.0,
                                                            bottom: 7.0),
                                                    border: InputBorder.none,
                                                    hintText: 'First Name',
                                                    hintStyle: TextStyle(
                                                        color: AppTheme
                                                            .lightGrey)),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              flex: 5,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 15.0, top: 15.0),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, left: 15.0),
                                          child: Text(
                                            "Last Name",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: AppTheme.lightGrey),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 15, right: 30),
                                    child: Card(
                                      color: MediaQuery.of(context).platformBrightness == Brightness.light
                                          ? AppTheme.white
                                          : AppTheme.darkCard,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            side: BorderSide(
                                                color: MediaQuery.of(context).platformBrightness == Brightness.light
                                                    ? AppTheme.purple
                                                    : AppTheme.darkBackground,
                                                width: 1.5)),
                                        child: Container(
                                          height: 40.0,
                                          child: SizedBox.expand(
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, right: 10.0),
                                                child: TextField(
                                                  controller:
                                                      lastNameController,
                                                  style: TextStyle(
                                                      color: MediaQuery.of(context).platformBrightness == Brightness.light
                                                          ? AppTheme.purple
                                                          : AppTheme.white,),
                                                  textInputAction:
                                                      TextInputAction.search,
                                                  cursorColor: AppTheme.purple,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              left: 3.0,
                                                              right: 3.0,
                                                              bottom: 7.0),
                                                      border: InputBorder.none,
                                                      hintText: 'Last Name',
                                                      hintStyle: TextStyle(
                                                          color: AppTheme
                                                              .lightGrey)

                                                      // errorText: _validate
                                                      //     ? 'Enter a keyword to search'
                                                      //     : null,
                                                      ),
                                                )),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              flex: 5,
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 30.0, top: 0.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 15.0),
                              child: Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 13, color: AppTheme.lightGrey),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        child: Card(
                          color: MediaQuery.of(context).platformBrightness == Brightness.light
                              ? AppTheme.white
                              : AppTheme.darkCard,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(
                                    color: MediaQuery.of(context).platformBrightness == Brightness.light
                                        ? AppTheme.purple
                                        : AppTheme.darkBackground, width: 1.5)),
                            child: Container(
                              height: 40.0,
                              child: SizedBox.expand(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 11.0, left: 10.0, right: 10.0),
                                  child: Text(
                                    email,
                                    style: TextStyle(
                                        fontSize: 15.0, color: MediaQuery.of(context).platformBrightness == Brightness.light
                                        ? AppTheme.purple
                                        : AppTheme.white,),
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
                                const EdgeInsets.only(left: 30.0, top: 15.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 15.0),
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 13, color: AppTheme.lightGrey),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        child: Card(
                          color: MediaQuery.of(context).platformBrightness == Brightness.light
                              ? AppTheme.white
                              : AppTheme.darkCard,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(
                                    color: MediaQuery.of(context).platformBrightness == Brightness.light
                                        ? AppTheme.purple
                                        : AppTheme.darkBackground, width: 1.5)),
                            child: Container(
                              height: 38.0,
                              child: SizedBox.expand(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0,top: 3.0),
                                    child: TextField(
                                      obscureText: _isObscure,
                                      controller: newPassword,
                                      style: TextStyle(color: MediaQuery.of(context).platformBrightness == Brightness.light
                                          ? AppTheme.purple
                                          : AppTheme.white,),
                                      textInputAction: TextInputAction.search,
                                      cursorColor: MediaQuery.of(context).platformBrightness == Brightness.light
                                          ? AppTheme.purple
                                          : AppTheme.white,
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              left: 3.0,
                                              right: 3.0,
                                              bottom: 7.0),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _isObscure
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              size: 20,
                                              color:  MediaQuery.of(context)
                                                  .platformBrightness ==
                                                  Brightness.light
                                                  ? AppTheme.purple
                                                  : AppTheme.yellow,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (_isObscure) {
                                                  _isObscure = false;
                                                } else {
                                                  _isObscure = true;
                                                }
                                              });
                                            },
                                          ),
                                          border: InputBorder.none,
                                          hintText: 'New Password',
                                          hintStyle: TextStyle(
                                              color: AppTheme.lightGrey)

                                          // errorText: _validate
                                          //     ? 'Enter a keyword to search'
                                          //     : null,
                                          ),
                                    )),
                              ),
                            )),
                      ),
                      Row(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(left: 30.0, top: 15.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 15.0),
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 13, color: AppTheme.lightGrey),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        child: Card(
                          color: MediaQuery.of(context).platformBrightness == Brightness.light
                              ? AppTheme.white
                              : AppTheme.darkCard,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(
                                    color: MediaQuery.of(context).platformBrightness == Brightness.light
                                        ? AppTheme.purple
                                        : AppTheme.darkBackground, width: 1.5)),
                            child: Container(
                              height: 40.0,
                              child: SizedBox.expand(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: TextField(
                                      obscureText: _isObscure,
                                      controller: confirmPassword,
                                      style: TextStyle(color: MediaQuery.of(context).platformBrightness == Brightness.light
                                          ? AppTheme.purple
                                          : AppTheme.white,),
                                      textInputAction: TextInputAction.search,
                                      cursorColor: MediaQuery.of(context).platformBrightness == Brightness.light
                                          ? AppTheme.purple
                                          : AppTheme.white,
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              left: 3.0,
                                              right: 3.0,
                                              bottom: 7.0),
                                          border: InputBorder.none,
                                          hintText: 'Confirm Password',
                                          hintStyle: TextStyle(
                                              color: AppTheme.lightGrey)

                                          // errorText: _validate
                                          //     ? 'Enter a keyword to search'
                                          //     : null,
                                          ),
                                    )),
                              ),
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40.0, bottom: 40.0),
                        height: 28.0,
                        width: 120,
                        child: loading
                            ? Container(
                                margin: EdgeInsets.only(top: 0.0),
                                child: Center(
                                    child: Lottie.asset(
                                  'assets/json/loading_in_button.json',
                                )),
                                decoration: ShapeDecoration(
                                  shape: StadiumBorder(),
                                  color: AppTheme.purple.withOpacity(0.7),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  if (firstNameController.text.isEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      elevation: 8.0,
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(10.0),
                                      content: Text("Enter First Name !"),
                                      backgroundColor: Colors.red,
                                    ));
                                    return;
                                  }
                                  if (lastNameController.text.isEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      elevation: 8.0,
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(10.0),
                                      content: Text("Enter Last Name !"),
                                      backgroundColor: Colors.red,
                                    ));
                                    return;
                                  }

                                  if (newPassword.text.isEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      elevation: 8.0,
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(10.0),
                                      content:
                                          Text("Password cannot be empty !"),
                                      backgroundColor: Colors.red,
                                    ));
                                    return;
                                  }

                                  if (newPassword.text.length < 5) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      elevation: 8.0,
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(10.0),
                                      content:
                                          Text("Choose a strong password !"),
                                      backgroundColor: Colors.red,
                                    ));
                                    return;
                                  }
                                  if (newPassword.text !=
                                      confirmPassword.text) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      elevation: 8.0,
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(10.0),
                                      content:
                                          Text("Passwords should be same !"),
                                      backgroundColor: Colors.red,
                                    ));
                                    return;
                                  }
                                  if (email.isEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      elevation: 8.0,
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(10.0),
                                      content: Text(
                                          "Error occurred, Restart the application"),
                                      backgroundColor: Colors.red,
                                    ));
                                    return;
                                  }
                                  updateUser(
                                      userName,
                                      email,
                                      firstNameController.text,
                                      lastNameController.text,
                                      newPassword.text,
                                      userId);
                                },
                                style: TextButton.styleFrom(
                                  primary: MediaQuery.of(context).platformBrightness == Brightness.light
                                      ? AppTheme.white
                                      : AppTheme.darkBackground,
                                  backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.light
                                      ? AppTheme.purple
                                      : AppTheme.yellow,
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text(
                                  "Save",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]));
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}
