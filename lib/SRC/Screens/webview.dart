import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WebViewScreen extends StatefulWidget {
  String url;
  String source;
  WebViewScreen({super.key, required this.source, required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;
  var loadingPercentage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse('${widget.url}'),
      );
  }
  // var controller = WebViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(FontAwesomeIcons.arrowLeft,color: Theme.of(context).iconTheme.color,)),
          title: Text(
            '${widget.source}',
            style:
                TextStyle(color: Theme.of(context).textTheme.titleLarge!.color),
          ),
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                icon: Icon(FontAwesomeIcons.rotateRight,
                    color: Theme.of(context).iconTheme.color),
                onPressed: () {
                  controller.reload();
                },
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            WebViewWidget(
              controller: controller,
            ),
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                value: loadingPercentage / 100.0,
              ),
          ],
        ));
  }
}
