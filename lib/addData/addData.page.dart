import 'package:flutter/material.dart';

class AddData extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: SafeArea(top: true, child: title())),
        Container(
            alignment: Alignment.center,
            child: SafeArea(
              child: _dailyGoals(context),
            )),
        Container(
            child: SafeArea(
          child: commitButton(context),
        ))
      ],
    ));
  }

  Widget title() {
    var now = new DateTime.now();
    var formatDate =
        "${now.year.toString()} / ${now.month.toString()} / ${now.day.toString()}";

    return Text(
      formatDate,
      style: TextStyle(
        fontSize: 30,
      ),
    );
  }

  Widget commitButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          minimumSize: Size(100, 50),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)))),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text('Commit and Push'),
    );
  }

  Widget _dailyGoals(BuildContext context) {
    // get daily goals in array and return on/off for today's results
    return Text(
      'Hello',
    );
  }
}
