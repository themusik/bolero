// import 'dart:collection';

import 'package:flutter/material.dart';

class AddData extends StatelessWidget {
  const AddData({super.key});

  void saveAchievement(String str) {
    print(str);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            child: SafeArea(top: true, child: title())),
        Container(
            alignment: Alignment.center,
            child: SafeArea(
              child: _dailyGoals(context),
            )),
        SafeArea(
          child: ElevatedButton(
              onPressed: () => saveAchievement('TODO'),
              child: const Text('data')),
        ),
        SafeArea(
          child: commitButton(context),
        )
      ],
    )));
  }

  Widget title() {
    var now = DateTime.now();
    var formatDate =
        "${now.year.toString()} / ${now.month.toString()} / ${now.day.toString()}";

    return Text(
      formatDate,
      style: const TextStyle(
        fontSize: 30,
      ),
    );
  }

  Widget commitButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          minimumSize: const Size(100, 50),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)))),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('Commit and Push'),
    );
  }

  Widget _dailyGoals(BuildContext context) {
    // get daily goals in array and return on/off for today's results
    return const Text(
      'Hello',
    );
  }
}
