import 'package:flutter/material.dart';

class DefaultCalendar extends StatefulWidget {
  @override
  _DefaultCalendarState createState() => new _DefaultCalendarState();
}

class _DefaultCalendarState extends State<DefaultCalendar>
    with SingleTickerProviderStateMixin {
  var selectedYear;
  var selectedMonth;
  var selectedDay;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showPicker() {
    showDatePicker(
        context: context,
        firstDate: new DateTime(1940),
        initialDate: new DateTime(2018),
        lastDate: DateTime.now()).then((DateTime dt) {
      selectedDay = dt.day;
      selectedMonth = dt.month;
      selectedYear = dt.year;
      sendDate();
    });
  }

  void sendDate() {
    setState(() {
      print(selectedDay);
      print(selectedMonth);

      print(selectedYear);

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Age Calculator"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new OutlineButton(
              child: new Text(selectedYear != null
                  ? selectedYear.toString()
                  : "Select your year of birth"),
              borderSide: new BorderSide(color: Colors.black, width: 3.0),
              color: Colors.white,
              onPressed: _showPicker,
            ),
            new Padding(
              padding: const EdgeInsets.all(20.0),
            ),
          ],
        ),
      ),
    );
  }
}
