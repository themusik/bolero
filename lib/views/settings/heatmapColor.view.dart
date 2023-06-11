import 'package:bolero/views/settings/settings.view.dart';
import 'package:flutter/material.dart';

class HeatmapColor {
  final String name;
  final MaterialColor color;

  const HeatmapColor(this.name, this.color);
}

final List<HeatmapColor> heatmapColors = [
  const HeatmapColor('pink', Colors.pink),
  const HeatmapColor('red', Colors.red),
  const HeatmapColor('orange', Colors.orange),
  const HeatmapColor('amber', Colors.amber),
  const HeatmapColor('yellow', Colors.yellow),
  const HeatmapColor('lightGreen', Colors.lightGreen),
  const HeatmapColor('green', Colors.green),
  const HeatmapColor('teal', Colors.teal),
  const HeatmapColor('lightBlue', Colors.lightBlue),
  const HeatmapColor('blue', Colors.blue),
  const HeatmapColor('indigo', Colors.indigo),
  const HeatmapColor('purple', Colors.purple),
  const HeatmapColor('deepPurple', Colors.deepPurple),
];

final List<int> colorCodes = <int>[500, 600, 700];

class HeatmapColorView extends StatefulWidget {
  const HeatmapColorView({super.key});

  @override
  State<HeatmapColorView> createState() => _HeatmapColorViewState();
}

class _HeatmapColorViewState extends State<HeatmapColorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView.builder(
      itemCount: heatmapColors.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () => {},
          title: Text(heatmapColors[index].name),
          tileColor: heatmapColors[index].color[300],
        );
      },
    )));
  }
}
