import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:livenewspro/Theme/AppTheme.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewMain extends StatefulWidget {
  const WebViewMain({Key? key, required this.pageUrl}) : super(key: key);
  final String pageUrl;

  @override
  _WebViewMainState createState() => _WebViewMainState();
}

class _WebViewMainState extends State<WebViewMain> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  late WebViewController _webViewController;
  late bool loading = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: WebView(
              initialUrl: widget.pageUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _webViewController = webViewController;
                _controller.complete(webViewController);
              },
              onPageStarted: (initialUrl) {
                setState(() {
                  loading=false;
                });
              },

              gestureNavigationEnabled: true,
            ),
          ),
          loading
              ? Container(
            color: MediaQuery.of(context).platformBrightness ==
                Brightness.light
                ?AppTheme.backgroundColor:AppTheme.darkBackground,
            child: Center(
                child: Lottie.asset('assets/json/loading_animation.json',
                    height: 150)),
          )
              : Stack()
        ],
      ),
    );
  }
}
