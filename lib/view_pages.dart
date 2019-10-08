import 'package:flutter/material.dart';
import './data/data.dart';
import './pages/display.dart';
import './theme_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewPages extends StatefulWidget {
  @override
  _ViewPagesState createState() => _ViewPagesState();
}

class _ViewPagesState extends State<ViewPages> {
  PageController pageController;
  var currentPageValue = 0.0;
  DateTime dateTime;

  static var selectedYear;
  static var selectedMonth;
  static var selectedDay;
  static var selectedWeekDay;

  @override
  void initState() {
    dateTime = DateTime.now();
    pageController = new PageController(
      initialPage: dateTime.day,
    );
    setState(() {
      selectedDay = dateTime.day;
      selectedMonth = dateTime.month;
      selectedYear = dateTime.year;
      selectedWeekDay = dateTime.weekday;
      // print(pageController.position);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        PageView.builder(
          itemBuilder: (context, position) {
            return const Display();
          },
          itemCount: 4,
          physics: ClampingScrollPhysics(),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Row(
                children: <Widget>[
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.calendarAlt,
                      color: Ui.iconButtonColor,
                    ),
                    onPressed: _showPicker,
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }

  void _showPicker() {
    showDatePicker(
            context: context,
            firstDate: new DateTime(1940),
            initialDate: DateTime.now(),
            lastDate: DateTime.now())
        .then((DateTime dt) {
      selectedDay = dt.day;
      selectedMonth = dt.month;
      selectedYear = dt.year;
      print(dt);
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
}
