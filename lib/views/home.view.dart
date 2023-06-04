import 'package:flutter/material.dart';
import 'package:bolero/views/addData/addData.view.dart';
import 'package:bolero/views/more.view.dart';
import 'package:bolero/views/settings/goalOverview.view.dart';
import 'package:bolero/views/settings/settings.view.dart';
import 'package:bolero/widgets/heatmap.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
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
      body: const Heatmap(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(_createAddDataPage());
        },
        label: const Text('add data'),
        icon: const Icon(Icons.add),
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
        print('Setting is selected.');
        return const SettingsPage();
      case MoreMenu.EDIT_GRAPHS:
        print('Edit graph is selected');
        return const GoalOverview();
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
        pageBuilder: (context, animation, secondaryAnimation) =>
            const AddData(),
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
