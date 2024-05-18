import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Pagenation(),
    );
  }
}

class Pagenation extends StatefulWidget {
  const Pagenation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PagenationState createState() => _PagenationState();
}

class _PagenationState extends State<Pagenation> {
  // List holding all the items we are displaying
  List<DateTime> items = [];

  void fetchNewEvents(int year, int month) async {
    Random random = Random();

    // Custom data, requires date so we can later filter on that date
    final newItems = List<DateTime>.generate(random.nextInt(40), (index) {
      return DateTime(year, month, random.nextInt(27) + 1);
    });

    setState(() => items.addAll(newItems));
  }

  @override
  Widget build(BuildContext context) {
    return PagedVerticalCalendar(
        // To prevent the data from being reset every time a user loads or
        // unloads this widget
        addAutomaticKeepAlives: true,
        // When the new month callback fires, we want to fetch the items for this month
        onMonthLoaded: fetchNewEvents,
        dayBuilder: (context, date) {
          final eventsThisDay = items.where((e) => e == date);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(DateFormat('d').format(date)),
              Wrap(
                children: eventsThisDay.map((event) {
                  return const Padding(
                    padding: EdgeInsets.all(1),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.red,
                    ),
                  );
                }).toList(),
              )
            ],
          );
        },
        onDayPressed: (day) {
          final eventsThisDay = items.where((e) => e == day);
          print('items this day: $eventsThisDay');
        });
  }
}
