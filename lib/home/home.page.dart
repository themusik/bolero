
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:bolero/home/more.component.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => PageState();
}

class PageState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    log('PageState.build called');
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: _selected,
            itemBuilder: (BuildContext context) {
              return _getItemBuilder();
            },
          )
        ],
      ),
    );
  }

  void _selected(int index) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(displayString(MoreMenu.values[index])),
              ),
              body: _pageSelector(index),
            );
          }
      ),
    );
  }

  List<PopupMenuEntry<int>> _getItemBuilder() {
    return MoreMenu.values.map((item) => PopupMenuItem<int>(
      value: item.index,
      child: Text(displayString(item)),
    ))
        .toList();
  }

  Widget _pageSelector(int index) {
    switch(MoreMenu.values[index]) {
      case MoreMenu.SETTING:
        log('Setting is selected');
        break;
      case MoreMenu.EDIT_GRAPHS:
        log('Edit graph is selected');
        break;
    }
    return ListView(); // return empty page for now

  }
}
