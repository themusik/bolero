import 'dart:developer';

import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:bolero/settings/graphOverview.page.dart';
import 'package:bolero/settings/settings.page.dart';
import 'package:bolero/home/more.component.dart';
import 'package:bolero/addData/addData.page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // calender settings
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();

  CalendarCarousel _calendarCarouselNoHeader;

  @override
  Widget build(BuildContext context) {
    // --------------
    //  calender
    // --------------
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.grey.shade100,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      // thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      firstDayOfWeek: 1,
      // markedDatesMap: _markedDateMap,
      height: 460.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          CircleBorder(side: BorderSide(color: Colors.yellow)),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      todayButtonColor: Colors.grey.shade100,
      selectedDayTextStyle: TextStyle(
        color: Colors.white,
      ),
      selectedDayButtonColor: Colors.deepPurple.shade200,
      selectedDayBorderColor: Colors.deepPurple.shade300,
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.grey.shade200,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    // --------------
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: _popupMenuSelected,
            itemBuilder: (BuildContext context) {
              return _getItemBuilder();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                  bottom: 16.0,
                  right: 16.0,
                  left: 16.0,
                ),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                          icon: const Icon(Icons.arrow_left_outlined),
                          onPressed: () {
                            setState(() {
                              _targetDateTime = DateTime(_targetDateTime.year,
                                  _targetDateTime.month - 1);
                              _currentMonth =
                                  DateFormat.yMMM().format(_targetDateTime);
                            });
                          }),
                      Text(_currentMonth,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0)),
                      IconButton(
                          icon: const Icon(Icons.arrow_right_outlined),
                          onPressed: () {
                            setState(() {
                              _targetDateTime = DateTime(_targetDateTime.year,
                                  _targetDateTime.month + 1);
                              _currentMonth =
                                  DateFormat.yMMM().format(_targetDateTime);
                            });
                          }),
                    ]),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarouselNoHeader,
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(_createAddDataPage());
        },
        label: Text('add data'),
        icon: Icon(Icons.add),
      ),
    );
  }

  void _popupMenuSelected(int index) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(displayString(MoreMenu.values[index])),
          ),
          body: _pageSelector(index),
        );
      }),
    );
  }

  Widget _pageSelector(int index) {
    switch (MoreMenu.values[index]) {
      case MoreMenu.SETTING:
        log('Setting is selected.');
        return SettingsPage();
        break;
      case MoreMenu.EDIT_GRAPHS:
        log('Edit graph is selected');
        return GraphOverview();
        break;
      default:
        return ListView();
    }
  }

  List<PopupMenuEntry<int>> _getItemBuilder() {
    return MoreMenu.values
        .map((item) => PopupMenuItem<int>(
              value: item.index,
              child: Text(displayString(item)),
            ))
        .toList();
  }

  Route _createAddDataPage() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => AddData(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          var curve = Curves.ease;
          var curveTween = CurveTween(curve: curve);
          var tween = Tween(begin: begin, end: end).chain(curveTween);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        });
  }
}
