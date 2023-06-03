import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class Heatmap extends StatefulWidget {
  @override
  State createState() => _HeatmapState();
}

class _HeatmapState extends State<Heatmap> {
  @override
  Widget build(BuildContext context) {
    return HeatMapCalendar(
      defaultColor: Colors.white,
      flexible: true,
      colorMode: ColorMode.opacity,
      datasets: {
        DateTime(2023, 6, 6): 3,
        DateTime(2023, 6, 7): 7,
        DateTime(2023, 6, 8): 10,
        DateTime(2023, 6, 9): 13,
        DateTime(2023, 6, 13): 6,
      },
      colorsets: const{
        1: Colors.red
      },
      onClick: (value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
      },
    );
  }
}