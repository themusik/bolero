import 'package:bolero/views/calendar.view.dart';
import 'package:flutter/material.dart';
import 'package:bolero/views/addData/addData.view.dart';
import 'package:bolero/views/more.view.dart';
import 'package:bolero/views/settings/goalOverview.view.dart';
import 'package:bolero/views/settings/settings.view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: <Widget>[
            PopupMenuButton<int>(
              onSelected: _popupMenuSelected,
              itemBuilder: (BuildContext context) {
                return _getItemBuilder();
              },
            )
          ],
        ),
        body: const Calendar());
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
      case MoreMenu.setting:
        return const SettingsPage();
      case MoreMenu.editGraphs:
        return const GoalOverview();
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
}
