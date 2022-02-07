import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livenewspro/Theme/AppTheme.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
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
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                "Favourites",
                style: TextStyle(
                    color: AppTheme.yellow,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(top: 25,right: 20),
              child: Material(
                clipBehavior: Clip.antiAlias,
                color: Colors.white,
                child: InkWell(
                    splashColor: AppTheme.lightGrey,
                    onTap: () {},
                    child: SvgPicture.asset(
                      "assets/icons/list_checked.svg",
                      height: 27,
                      width: 27,
                    )),
              ),
            ),
          ),



          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(top: 25,right: 55),
              child: Material(
                clipBehavior: Clip.antiAlias,
                color: Colors.transparent,
                child: InkWell(
                    splashColor: AppTheme.lightGrey,
                    onTap: () {},
                    child: SvgPicture.asset(
                      "assets/icons/grid_unchecked.svg",
                      height: 27,
                      width: 27,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
