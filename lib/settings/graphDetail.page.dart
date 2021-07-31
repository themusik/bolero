
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GraphDetail extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Graph Title'
              ),
            )
          ],
        )
    );
  }
}