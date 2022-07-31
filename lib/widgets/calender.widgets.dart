// import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class Calendar extends StatefulWidget {
  @override
  State createState() => _Calender();
}

class _Calender extends State<Calendar> {
  DateTime _currentDate = DateTime.now();

  void onDayPressed(DateTime date, List<Event> events) {
    this.setState(() => _currentDate = date);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
              child: CalendarCarousel<Event>(
                onDayPressed: onDayPressed,
                weekendTextStyle: TextStyle(color: Colors.red),
                thisMonthDayBorderColor: Colors.grey,
                selectedDateTime: _currentDate,
                selectedDayTextStyle: TextStyle(color: Colors.green),
                height: 460.0,
              ),
            ),
          ]),
    );
  }
}
