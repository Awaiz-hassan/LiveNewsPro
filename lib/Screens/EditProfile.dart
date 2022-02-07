import 'package:flutter/material.dart';
import 'package:livenewspro/Theme/AppTheme.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                icon:  Icon(Icons.arrow_back_ios_rounded,color: AppTheme.purple,)),
                            Text("Edit Profile",style: TextStyle(color: AppTheme.purple,fontSize: 18,fontWeight: FontWeight.bold),

                            ),
                            Container(height: 5,width: 50,)
                          ],
                        ),
                      ),

                      Container(
                        margin:
                        const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 30.0, top: 15.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                                        child: Text(
                                          "First Name",
                                          style: TextStyle(
                                              fontSize: 13, color: AppTheme.lightGrey),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 30,right: 15),
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
                                                top: 0.0, left: 10.0, right: 10.0),
                                            child: TextField(
                                              cursorColor: AppTheme.purple,
                                              style: TextStyle(color: AppTheme.purple),
                                              textInputAction: TextInputAction.search,
                                              decoration:InputDecoration(
                                                  contentPadding:
                                                  const  EdgeInsets.only(left: 3.0, right: 3.0,bottom: 7.0),
                                                  border: InputBorder.none,
                                                  hintText: 'First Name',
                                                  hintStyle: TextStyle(color: AppTheme.lightGrey)

                                                // errorText: _validate
                                                //     ? 'Enter a keyword to search'
                                                //     : null,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                ),


                              ],),
                              flex: 5,
                            ),
                            Expanded(
                              child: Column(children: [

                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 15.0, top: 15.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                                        child: Text(
                                          "Last Name",
                                          style: TextStyle(
                                              fontSize: 13, color: AppTheme.lightGrey),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15, right: 30),
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
                                                left: 10.0, right: 10.0),
                                            child: TextField(
                                              style: TextStyle(color: AppTheme.purple),
                                              textInputAction: TextInputAction.search,
                                              cursorColor: AppTheme.purple,
                                              decoration:InputDecoration(
                                                  contentPadding:
                                                  const  EdgeInsets.only(left: 3.0, right: 3.0,bottom: 7.0),
                                                  border: InputBorder.none,
                                                  hintText: 'Last Name',
                                                  hintStyle: TextStyle(color: AppTheme.lightGrey)

                                                // errorText: _validate
                                                //     ? 'Enter a keyword to search'
                                                //     : null,
                                              ),
                                            )
                                          ),
                                        ),
                                      )),
                                ),

                              ],),
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
                              padding: const EdgeInsets.only(top: 10.0, left: 15.0),
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
                                    "shabee933@gamil.com",
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
                            margin: const EdgeInsets.only(left: 30.0, top: 15.0),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0, left: 15.0),
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
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: AppTheme.purple, width: 1.5)),
                            child: Container(
                              height: 40.0,
                              child: SizedBox.expand(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: TextField(
                                      style: TextStyle(color: AppTheme.purple),
                                      textInputAction: TextInputAction.search,
                                      cursorColor: AppTheme.purple,
                                      decoration:InputDecoration(
                                          contentPadding:
                                          const  EdgeInsets.only(left: 3.0, right: 3.0,bottom: 7.0),
                                          border: InputBorder.none,
                                          hintText: 'New Password',
                                          hintStyle: TextStyle(color: AppTheme.lightGrey)

                                        // errorText: _validate
                                        //     ? 'Enter a keyword to search'
                                        //     : null,
                                      ),
                                    )
                                ),
                              ),
                            )),
                      ),



                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 30.0, top: 15.0),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0, left: 15.0),
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
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: AppTheme.purple, width: 1.5)),
                            child: Container(
                              height: 40.0,
                              child: SizedBox.expand(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: TextField(
                                      style: TextStyle(color: AppTheme.purple),
                                      textInputAction: TextInputAction.search,
                                      cursorColor: AppTheme.purple,
                                      decoration:InputDecoration(
                                          contentPadding:
                                          const  EdgeInsets.only(left: 3.0, right: 3.0,bottom: 7.0),
                                          border: InputBorder.none,
                                          hintText: 'Confirm Password',
                                          hintStyle: TextStyle(color: AppTheme.lightGrey)

                                        // errorText: _validate
                                        //     ? 'Enter a keyword to search'
                                        //     : null,
                                      ),
                                    )
                                ),
                              ),
                            )),
                      ),


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
}
