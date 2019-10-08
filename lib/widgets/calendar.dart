import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  static String noEventText = "No event here";
  String calendarText = noEventText;
  Color blue = Color(0xFF546de5);

  @override
  void initState() { 
    super.initState();
  }

  @override
  void dispose() { 
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          Card(
            child: CalendarCarousel(
              weekendTextStyle: TextStyle(color: Colors.red),
              weekFormat: false,
              selectedDayBorderColor: Colors.green,
              markedDatesMap: _markedDateMap,
              selectedDayButtonColor: Colors.green,
              selectedDayTextStyle: TextStyle(color: Colors.green),
              todayBorderColor: Colors.transparent,
              weekdayTextStyle: TextStyle(color: Colors.black),
              height: 420.0,
              daysHaveCircularBorder: true,
              todayButtonColor: blue,
              locale: 'en',
              onDayPressed: (DateTime date, List<Event> events) {
                this.setState(() => refresh(date));
              },
            ),
          ),
          Card(
            child: Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                child: Center(
                  child: Text(
                    calendarText,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void refresh(DateTime date) {
    print('selected date ' +
        date.day.toString() +
        date.month.toString() +
        date.year.toString() +
        ' ' +
        date.toString());
    if (_markedDateMap
        .getEvents(new DateTime(date.year, date.month, date.day))
        .isNotEmpty) {
      calendarText = _markedDateMap
          .getEvents(new DateTime(date.year, date.month, date.day))[0]
          .title;
    } else {
      calendarText = noEventText;
    }
  }
}

EventList<Event> _markedDateMap = new EventList<Event>(events: {
  new DateTime(2019, 1, 24): [
    new Event(
      date: new DateTime(2019, 1, 24),
      title: 'MR Calendar',
      icon: _eventIcon,
    )
  ]
});

Widget _eventIcon = new Container(
  decoration: new BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(1000)),
      border: Border.all(color: Colors.blue, width: 2.0)),
  child: new Icon(
    Icons.person,
    color: Colors.amber,
  ),
);
