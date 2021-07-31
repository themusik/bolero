import 'dart:async';
import 'dart:developer';

import 'package:bolero/settings/graphOverview.page.dart';
import 'package:bolero/settings/settings.page.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:bolero/home/more.component.dart';
import 'package:bolero/addData/addData.page.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageState();
}

class PageState extends State<Home> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: _popupMenuSelected,
            itemBuilder: (BuildContext context) {
              return _getItemBuilder();
            },
          )
        ],
      ),
      // body: _bodyBuilder()
      // body: GraphWebView(),
      body: WebView(
        initialUrl: 'https://www.google.com',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(_createAddDataPage());
        },
        label: Text('add data'),
        icon: Icon(Icons.add),
      ),
    );
  }

  void _popupMenuSelected(int index) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(displayString(MoreMenu.values[index])),
          ),
          body: _pageSelector(index),
        );
      }),
    );
  }

  Widget _pageSelector(int index) {
    switch (MoreMenu.values[index]) {
      case MoreMenu.SETTING:
        log('Setting is selected.');
        return SettingsPage();
        break;
      case MoreMenu.EDIT_GRAPHS:
        log('Edit graph is selected');
        return GraphOverview();
        break;
      default:
        return ListView();
    }
  }

  List<PopupMenuEntry<int>> _getItemBuilder() {
    return MoreMenu.values
        .map((item) => PopupMenuItem<int>(
              value: item.index,
              child: Text(displayString(item)),
            ))
        .toList();
  }

  Route _createAddDataPage() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => AddData(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          var curve = Curves.ease;
          var curveTween = CurveTween(curve: curve);
          var tween = Tween(begin: begin, end: end).chain(curveTween);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        });
  }
}
