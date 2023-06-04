import 'package:flutter/material.dart';

class GraphDetail extends StatelessWidget {
  const GraphDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Graph Title'),
        )
      ],
    ));
  }
}
