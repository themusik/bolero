import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GraphOverview extends StatelessWidget {
  static const _numOfGraphs = 4;

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _numOfGraphs,
      itemBuilder: (context, index) {
        return ListTile(
          title: FutureBuilder(
            future: _getGraphNames(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = <Widget>[
                  Text(snapshot.data[index])
                ];
              } else {
                children = <Widget>[
                  Text('else hasData')
                ];
              }
              return Center(
                child: Column(
                  children: children,
                )
              );
            },
          )
        );
      },
    );
  }

  Future<List> _getGraphNames() async {
    // List<Map<String, dynamic>> send=[] ;

    List<String> myList = List<String>(_numOfGraphs);
    myList[0] = 'one';
    myList[1] = 'two';
    myList[2] = 'three';
    myList[3] = 'four';

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList('CustomList', myList);
    List graphList = pref.getStringList('CustomList');
    return graphList;
  }
}




