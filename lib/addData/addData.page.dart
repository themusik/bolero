
import 'package:flutter/material.dart';

class AddData extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack (
        children: <Widget>[
          new Positioned(
            child: Align(
              alignment: Alignment.topCenter,
              child: SafeArea(
                top:true,
                child: title()
              )
            ),
          ),
          new Positioned(
              child: Align(
                alignment: Alignment.center,
                child: SafeArea(
                  child: _dailyGoals(context),
                )
              )
          ),
          new Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: commitButton(context)
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget title() {
    var now = new DateTime.now();
    var formatDate = "${now.year.toString()} / ${now.month.toString()} / ${now.day.toString()}";

    return Text(
        formatDate,
        style: TextStyle(
          fontSize: 30,
        ),
    );
  }

  Widget commitButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        // TODO dismiss animation
        Navigator.of(context).pop();
      },
      child: const Text('Commit and Push', style: TextStyle(fontSize: 30)),
      // TODO button styling
      color: Colors.blue,
      textColor: Colors.white,
      elevation: 5,
    );
  }

  Widget _dailyGoals(BuildContext context) {
    // get daily goals in array and return on/off for today's results
    return Text(
      'Hello',
    );
  }
}


