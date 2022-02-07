import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livenewspro/Client/HttpClient.dart';
import 'package:livenewspro/Constants/AppConstants.dart';
import 'package:livenewspro/Models/Channel.dart';
import 'package:livenewspro/Theme/AppTheme.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

class LiveStreamScreen extends StatefulWidget {
  Channel _channel;

  LiveStreamScreen(this._channel, {Key? key}) : super(key: key);

  @override
  _LiveStreamScreenState createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  late Future<List<Channel>> relatedChannels;
  late VideoPlayerController _controller;
  bool controlsVisible = true;
  bool fullScreen = false;

  @override
  void initState() {
    relatedChannels = HttpClient.getRelated(widget._channel);
    _controller = VideoPlayerController.network(widget._channel.streamUrl)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (fullScreen) {
          setState(() {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ]);
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

            fullScreen = false;
          });
        } else {
          Navigator.pop(context);
        }

        return Future.value(false);
      },
      child: Scaffold(
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
                  child: Column(
                children: [
                  Container(
                    margin: fullScreen
                        ? const EdgeInsets.only(left: 0, top: 0, right: 0)
                        : const EdgeInsets.only(left: 20, top: 20, right: 20),
                    height:
                        fullScreen ? MediaQuery.of(context).size.height : 200,
                    color: Colors.black,
                    child: ClipRRect(
                      child: Stack(
                        children: [
                          Center(
                            child: _controller.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: _controller.value.aspectRatio,
                                    child: VideoPlayer(_controller),
                                  )
                                : Center(
                                    child: Container(),
                                  ),
                          ),
                          controlsVisible
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      controlsVisible = false;
                                    });
                                  },
                                  child: Container(
                                    color: Colors.black.withOpacity(0.50),
                                    child: Padding(
                                      padding: MediaQuery.of(context)
                                                  .size
                                                  .shortestSide <
                                              550
                                          ? const EdgeInsets.all(10.0)
                                          : const EdgeInsets.all(20.0),
                                      child: Stack(
                                        children: [
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10.0,
                                                    left: 80.0,
                                                    right: 50.0),
                                                child: VideoProgressIndicator(
                                                    _controller,
                                                    allowScrubbing: true,
                                                    colors: VideoProgressColors(
                                                        backgroundColor:
                                                            AppTheme.lightGrey,
                                                        bufferedColor:
                                                            AppTheme.grey,
                                                        playedColor:
                                                            AppTheme.purple)),
                                              )),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              child: IconButton(
                                                icon: fullScreen
                                                    ? Icon(Icons
                                                        .fullscreen_exit_rounded)
                                                    : Icon(Icons
                                                        .fullscreen_rounded),
                                                color: AppTheme.white,
                                                onPressed: () {
                                                  if (fullScreen) {
                                                    setState(() {
                                                      SystemChrome
                                                          .setPreferredOrientations([
                                                        DeviceOrientation
                                                            .portraitUp,
                                                        DeviceOrientation
                                                            .portraitDown,
                                                        DeviceOrientation
                                                            .landscapeLeft,
                                                        DeviceOrientation
                                                            .landscapeRight,
                                                      ]);
                                                      SystemChrome
                                                          .setEnabledSystemUIMode(
                                                              SystemUiMode
                                                                  .manual,
                                                              overlays: [
                                                            SystemUiOverlay.top,
                                                            SystemUiOverlay
                                                                .bottom
                                                          ]);

                                                      fullScreen = false;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      SystemChrome
                                                          .setEnabledSystemUIMode(
                                                              SystemUiMode
                                                                  .manual,
                                                              overlays: []);
                                                      SystemChrome
                                                          .setPreferredOrientations([
                                                        DeviceOrientation
                                                            .landscapeLeft,
                                                        DeviceOrientation
                                                            .landscapeRight,
                                                      ]);

                                                      fullScreen = true;
                                                    });
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: IconButton(
                                              color: Colors.white,
                                              icon: Icon(
                                                _controller.value.isPlaying
                                                    ? Icons.pause
                                                    : Icons.play_arrow,
                                                size: 30.0,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _controller.value.isPlaying
                                                      ? _controller.pause()
                                                      : _controller.play();
                                                });
                                              },
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 2.0, left: 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: const [
                                                  Text(
                                                    'Live ',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Icon(
                                                    Icons.live_tv_outlined,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0.0),
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.arrow_back_ios,
                                                  size: 25.0,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  if (fullScreen) {
                                                    setState(() {
                                                      SystemChrome
                                                          .setPreferredOrientations([
                                                        DeviceOrientation
                                                            .portraitUp,
                                                        DeviceOrientation
                                                            .portraitDown,
                                                        DeviceOrientation
                                                            .landscapeLeft,
                                                        DeviceOrientation
                                                            .landscapeRight,
                                                      ]);
                                                      SystemChrome
                                                          .setEnabledSystemUIMode(
                                                              SystemUiMode
                                                                  .manual,
                                                              overlays: [
                                                            SystemUiOverlay.top,
                                                            SystemUiOverlay
                                                                .bottom
                                                          ]);
                                                      fullScreen = false;
                                                    });
                                                  } else {
                                                    Navigator.pop(context);
                                                  }
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        controlsVisible = true;
                                      });
                                    },
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                  fullScreen
                      ? Container()
                      : Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          height: 70,
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 13.0, left: 30.0),
                                  child: Text(
                                    widget._channel.chName,
                                    style: TextStyle(
                                        color: AppTheme.purple, fontSize: 17),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 35.0, left: 30.0),
                                  child: Text(
                                    "USA",
                                    style: TextStyle(
                                        color: AppTheme.grey, fontSize: 15),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10.0),
                                  child: IconButton(
                                    icon: (Icon(
                                      Icons.favorite_border_rounded,
                                      size: 25,
                                      color: AppTheme.purple,
                                    )),
                                    onPressed: () {},
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                  fullScreen
                      ? Container()
                      : Container(
                          height: 50,
                          margin: const EdgeInsets.only(
                              top: 15, left: 20, right: 20),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Related Channels",
                                  style: TextStyle(
                                    color: AppTheme.purple,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Material(
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
                                            ? "assets/icons/list_checked.svg"
                                            : "assets/icons/list_unchecked.svg",
                                        height: 27,
                                        width: 27,
                                      )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 35),
                                  child: Material(
                                    clipBehavior: Clip.antiAlias,
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (AppConstants.list) {
                                              AppConstants.list = false;
                                            }
                                          });
                                        },
                                        splashColor: AppTheme.lightGrey,
                                        child: SvgPicture.asset(
                                          AppConstants.list
                                              ? "assets/icons/grid_unchecked.svg"
                                              : "assets/icons/grid_checked.svg",
                                          height: 27,
                                          width: 27,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  fullScreen
                      ? Container()
                      : Expanded(
                          child: FutureBuilder(
                              future: relatedChannels,
                              builder: (BuildContext ctx,
                                      AsyncSnapshot<List<Channel>> snapshot) =>
                                  snapshot.hasData
                                      ? AppConstants.list
                                          ? Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 15.0),
                                              child: ListView.builder(
                                                  itemCount:
                                                      snapshot.data!.length,
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return GestureDetector(
                                                        onTap: () {
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      LiveStreamScreen(
                                                                          snapshot
                                                                              .data![index])));
                                                        },
                                                        child: Container(
                                                          height: 57,
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20,
                                                                  right: 17,
                                                                  top: 5.0),
                                                          child: Row(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                child: Stack(
                                                                  children: [
                                                                    Image.asset(
                                                                      "assets/images/channel_bg.png",
                                                                      height:
                                                                          50,
                                                                      width: 50,
                                                                    ),
                                                                    Container(
                                                                      margin: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              10,
                                                                          top:
                                                                              10),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            30,
                                                                        imageUrl: "https://livetvi.com/dashboard/images/channel_images/" +
                                                                            snapshot.data![index].chName +
                                                                            ".png",
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                  child: Card(
                                                                child:
                                                                    Container(
                                                                  height: 50,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                          flex:
                                                                              8,
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 10.0, right: 10.0),
                                                                            child:
                                                                                (Text(
                                                                              snapshot.data![index].chName,
                                                                              style: TextStyle(color: AppTheme.purple, fontWeight: FontWeight.bold, fontSize: 16),
                                                                              maxLines: 1,
                                                                              overflow: TextOverflow.ellipsis,
                                                                            )),
                                                                          )),
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .play_arrow_rounded,
                                                                          size:
                                                                              30,
                                                                          color:
                                                                              AppTheme.purple,
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
                                          : Container(
                                              margin: const EdgeInsets.only(
                                                  left: 13,
                                                  right: 13,
                                                  bottom: 15),
                                              child: GridView.builder(
                                                  shrinkWrap: false,
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 3,
                                                          childAspectRatio: 1),
                                                  itemCount:
                                                      snapshot.data!.length,
                                                  itemBuilder:
                                                      (BuildContext ctx,
                                                          index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    LiveStreamScreen(
                                                                        snapshot
                                                                            .data![index])));
                                                      },
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .all(8.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child: Stack(
                                                            children: [
                                                              Image.asset(
                                                                "assets/images/channel_bg.png",
                                                              ),
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(20),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  imageUrl: "https://livetvi.com/dashboard/images/channel_images/" +
                                                                      snapshot
                                                                          .data![
                                                                              index]
                                                                          .chName +
                                                                      ".png",
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }))
                                      : Center(
                                          child: Center(
                                              child: Lottie.asset(
                                                  'assets/json/loading_animation.json',
                                                  height: 150.0)),
                                        )),
                        )
                ],
              )),
            )
          ])),
    );
  }
}
