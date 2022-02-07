import 'package:flutter/material.dart';
import 'package:livenewspro/Screens/EditProfile.dart';
import 'package:livenewspro/Theme/AppTheme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
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
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Card(
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
                                        builder: (context) => EditProfile()));
                              },
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20.0, left: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                child: Container(height: 90.0, width: 90.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Namesssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss",
                                        style: TextStyle(
                                            color: AppTheme.purple,
                                            fontSize: 20.0),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      margin: const EdgeInsets.only(
                                          top: 22.0, left: 5.0, right: 5.0),
                                    ),
                                    Container(
                                      child: Text(
                                        "Namesssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss",
                                        style: TextStyle(
                                            color: AppTheme.lightGrey,
                                            fontSize: 15.0),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      margin: EdgeInsets.only(
                                          left: 5.0, right: 5.0, top: 3.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Package Type",
                                        style: TextStyle(
                                            color: AppTheme.purple,
                                            fontSize: 12.0),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      margin: const EdgeInsets.only(
                                          left: 30.0, right: 20.0, top: 3.0),
                                    ),
                                    Container(
                                      child: Text(
                                        "Premium",
                                        style: TextStyle(
                                            color: AppTheme.yellow,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      margin: const EdgeInsets.only(
                                          top: 2.0, left: 30.0, right: 22.0),
                                      height: 20.0,
                                    ),
                                  ],
                                ),
                                flex: 6,
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 20.0),
                                  height: 28.0,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: AppTheme.purple,
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
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          "Package Details",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.purple),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30.0, top: 15.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                        child: Text(
                          "User ID",
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
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: AppTheme.purple, width: 1.5)),
                      child: Container(
                        height: 40.0,
                        child: SizedBox.expand(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 11.0, left: 10.0, right: 10.0),
                            child: Text(
                              "103000",
                              style: TextStyle(
                                  fontSize: 15.0, color: AppTheme.purple),
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
                      margin: const EdgeInsets.only(left: 30.0, top: 0.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                        child: Text(
                          "Package Validity",
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
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: AppTheme.purple, width: 1.5)),
                      child: Container(
                        height: 40.0,
                        child: SizedBox.expand(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 11.0, left: 10.0, right: 10.0),
                            child: Text(
                              "10-10-2022",
                              style: TextStyle(
                                  fontSize: 15.0, color: AppTheme.purple),
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
                      margin: const EdgeInsets.only(left: 30.0, top: 0.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                        child: Text(
                          "Package Cost",
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
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: AppTheme.purple, width: 1.5)),
                      child: Container(
                        height: 40.0,
                        child: SizedBox.expand(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10.0, right: 10.0),
                            child: Text(
                              "\$ 6",
                              style: TextStyle(
                                  fontSize: 15.0, color: AppTheme.purple),
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
                      margin: const EdgeInsets.only(top: 40.0, bottom: 40.0),
                      height: 28.0,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: AppTheme.purple,
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
          )
        ],
      ),
    );
  }
}
