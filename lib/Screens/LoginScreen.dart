import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:livenewspro/Models/LoginModel.dart';
import 'package:livenewspro/Theme/AppTheme.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'MainScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isObscure = true;


  loginUser(String username,String password) async {
    var client = http.Client();
    String url = "https://livenewspro.com/wp-json/custom-plugin/login";
    LoginModel loginModel;
    try {
      var response = await client.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'username': username,
            'password': password,
          }));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        loginModel = loginModelFromJson(jsonString);

        setLogged(true,loginModel.data.id);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const MainScreen()));
        return;
      } else if (response.statusCode == 404) {

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Invalid Username/Password"),backgroundColor: Colors.red,
        ));
      }
      print(response.statusCode);
    } on Exception {
      print("Server Error");
    }
  }



  void setLogged(bool logged,String userId)async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('logged', true);
    await prefs.setString('userId', userId);

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.backgroundColor,
        body: Stack(children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/images/circles.png",
              color: AppTheme.darkGrey,
              width: MediaQuery.of(context).size.height / 2,
              fit: BoxFit.contain,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  Row(children: [
                    SafeArea(
                      child: Container(
                        margin: EdgeInsets.only(top: 80, left: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome",
                                style: TextStyle(
                                    fontSize: 30, color: AppTheme.purple),
                              ),
                              Text("Back",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: AppTheme.purple,
                                      fontWeight: FontWeight.bold)),
                            ]),
                      ),
                    )
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: AppTheme.purple,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: _email,
                              style: TextStyle(
                                  color: AppTheme.purple, fontSize: 17),
                              maxLines: 1,
                              textInputAction: TextInputAction.next,
                              // Moves focus to next.

                              cursorColor: AppTheme.purple,
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppTheme.purple)),
                                  hintText: "Email Address",
                                  hintStyle: TextStyle(
                                      fontSize: 17.0,
                                      color: AppTheme.lightGrey),
                                  contentPadding:
                                      EdgeInsets.only(bottom: -15.0),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppTheme.lightGrey)))),
                        ),
                        Container(
                          height: 35,
                          child: TextField(
                            controller: _password,
                              style: TextStyle(
                                  color: AppTheme.purple, fontSize: 17),
                              maxLines: 1,
                              obscureText: _isObscure,
                              textInputAction: TextInputAction.done,
                              cursorColor: AppTheme.purple,
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppTheme.purple)),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      size: 20,
                                      color: AppTheme.lightGrey,
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
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      fontSize: 17.0,
                                      color: AppTheme.lightGrey),
                                  contentPadding:
                                      EdgeInsets.only(bottom: -15.0),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppTheme.lightGrey)))),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Forgot password ?",
                                  style: TextStyle(color: AppTheme.lightGrey),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    constraints: BoxConstraints(maxWidth: 300),
                    child: ElevatedButton(
                      onPressed: () {

                        if(_email.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Invalid Email"),backgroundColor: Colors.red,
                          ));

                          return;
                        }
                        else if(_password.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Invalid password"),backgroundColor: Colors.red,
                          ));
                        }


                        loginUser(_email.text.toString().trim(),_password.text.toString().trim());
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: AppTheme.purple,
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        "Login",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).orientation ==
                                Orientation.landscape
                            ? 40
                            : 100),
                    child: Column(
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: AppTheme.grey, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("SignUp");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Signup",
                                style: TextStyle(
                                    color: AppTheme.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
