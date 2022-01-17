import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewController controller;



  @override
  Widget build(BuildContext context) {
    String url = 'https://politecnicoguarda.pt/';
    return WillPopScope(
      child: Scaffold(
        body: Column(
          children: [Expanded(child: WebView(
            initialUrl: url,
            javascriptMode:  JavascriptMode.unrestricted,
            onWebViewCreated: (controller){
              this.controller = controller;
            },
          ))],
        ),
      ),
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
          return false;
        }
        return false;
      },
    );
  }
}
