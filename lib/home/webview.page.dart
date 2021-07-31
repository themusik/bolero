/*
import 'dart:async';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class GraphWebView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WebViewState();
}

class WebViewState extends State<GraphWebView> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://pixe.la/v1/users/a-know/graphs/test-graph',
        // initialUrl: 'https://www.google.com',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
 */
