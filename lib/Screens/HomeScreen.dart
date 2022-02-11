import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:livenewspro/Constants/AppConstants.dart';
import 'package:livenewspro/Controller/ChannelsController.dart';
import 'package:livenewspro/Screens/LiveStreamScreen.dart';
import 'package:livenewspro/Theme/AppTheme.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ChannelsController _channelsController = Get.put(ChannelsController());

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
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(top: 25, right: 20),
                child: Material(
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                      splashColor: AppTheme.lightGrey,
                      onTap: () {
                        setState(() {
                          if (!AppConstants.list) {
                            AppConstants.list = true;
                          }
                        });
                      },
                      child: SvgPicture.asset(
                        AppConstants.list
                            ? MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? "assets/icons/list_checked.svg"
                                : "assets/icons/list_checked_dark.svg"
                            : MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? "assets/icons/list_unchecked.svg"
                                : "assets/icons/list_unchecked_dark.svg",
                        height: 27,
                        width: 27,
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(top: 25, right: 55),
                child: Material(
                  clipBehavior: Clip.antiAlias,
                  color: Colors.transparent,
                  child: InkWell(
                      splashColor: AppTheme.lightGrey,
                      onTap: () {
                        setState(() {
                          if (AppConstants.list) {
                            AppConstants.list = false;
                          }
                        });
                      },
                      child: SvgPicture.asset(
                        AppConstants.list
                            ? MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? "assets/icons/grid_unchecked.svg"
                                : "assets/icons/grid_unchecked_dark.svg"
                            : MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? "assets/icons/grid_checked.svg"
                                : "assets/icons/grid_checked_dark.svg",
                        height: 27,
                        width: 27,
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(top: 20.0, left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "News Channels",
                      style: TextStyle(
                          color: AppTheme.yellow,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Align(
              child: Container(
                child: AppConstants.list
                    ? Obx(() => _channelsController.isLoading.value
                        ? Center(
                            child: Lottie.asset(
                                'assets/json/loading_animation.json',
                                height: 150.0))
                        : ListView.builder(
                            padding: EdgeInsets.all(0.0),
                            itemCount: _channelsController.channelList.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LiveStreamScreen(
                                                    _channelsController
                                                        .channelList[index])));
                                  },
                                  child: Container(
                                    height: 57,
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 17, top: 5.0),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                "assets/images/channel_bg.png",
                                                height: 50,
                                                width: 50,
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 10, top: 10),
                                                child: CachedNetworkImage(
                                                  height: 30,
                                                  width: 30,
                                                  imageUrl:
                                                      "https://livetvi.com/dashboard/images/channel_images/" +
                                                          _channelsController
                                                              .channelList[
                                                                  index]
                                                              .chName +
                                                          ".png",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            child: Card(
                                          color: MediaQuery.of(context)
                                                      .platformBrightness ==
                                                  Brightness.light
                                              ? AppTheme.white
                                              : AppTheme.darkCard,
                                          child: Container(
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    flex: 8,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0,
                                                              right: 10.0),
                                                      child: (Text(
                                                        _channelsController
                                                            .channelList[index]
                                                            .chName,
                                                        style: TextStyle(
                                                            color: MediaQuery.of(
                                                                            context)
                                                                        .platformBrightness ==
                                                                    Brightness
                                                                        .light
                                                                ? AppTheme
                                                                    .purple
                                                                : AppTheme
                                                                    .white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )),
                                                    )),
                                                Expanded(
                                                  flex: 2,
                                                  child: Icon(
                                                    Icons.play_arrow_rounded,
                                                    size: 30,
                                                    color: MediaQuery.of(
                                                                    context)
                                                                .platformBrightness ==
                                                            Brightness.light
                                                        ? AppTheme.purple
                                                        : AppTheme.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ))
                                      ],
                                    ),
                                  ));
                            }))
                    : Obx(() => _channelsController.isLoading.value
                        ? Center(
                            child: Lottie.asset(
                                'assets/json/loading_animation.json',
                                height: 150.0))
                        : Container(
                            margin:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: GridView.builder(
                                shrinkWrap: false,
                                physics: const BouncingScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3, childAspectRatio: 1),
                                itemCount:
                                    _channelsController.channelList.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LiveStreamScreen(
                                                      _channelsController
                                                              .channelList[
                                                          index])));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Stack(
                                          children: [
                                            Image.asset(
                                              "assets/images/channel_bg.png",
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(20),
                                              child: CachedNetworkImage(
                                                fit: BoxFit.contain,
                                                imageUrl:
                                                    "https://livetvi.com/dashboard/images/channel_images/" +
                                                        _channelsController
                                                            .channelList[index]
                                                            .chName +
                                                        ".png",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )),
                margin: const EdgeInsets.only(top: 70.0, bottom: 15.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
