import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> goals = [
  'Eat breakfast',
  'Get excersise',
  'Get sleep'
]; // To be replaced

class GoalOverview extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: goals.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: FutureBuilder(
          future: _getGoals(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text((index + 1).toString()),
                  TextField(
                    // decoration: InputDecoration(labelText: snapshot.data[index]),
                    decoration: InputDecoration(
                        labelText: 'Goal ' + (index + 1).toString(),
                        prefixText: goals[index]),
                  )
                ],
              );
            } else {
              return Center(
                  child: Column(
                children: [Text('something else')],
              ));
            }
          },
        ));
      },
    );
  }

  Future<List<String>?> _getGoals() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList('CustomList', goals);
    return pref.getStringList('CustomList');
  }
}