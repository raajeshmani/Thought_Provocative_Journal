import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:thought_provocative_journal/tools/text_input_screen.dart';

import './theme_data.dart';
import './pages/display.dart';
import './widgets/tag_widget.dart';
import './widgets/pie.dart';
import './widgets/default_calendar.dart';
import 'home_page.dart';


import 'view_pages.dart';


import './widgets/bottom_bar.dart';

void main() => {
      // debugPaintLayerBordersEnabled = true,
      // debugPaintBaselinesEnabled = true,
      runApp(MyApp()),
    };

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thought Provoking Journal',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: MyHomePage(title: 'Home Page'),
      // home: ViewPages(),
      initialRoute: '/',
      routes: {
        Router.display: (context) => Display(),
        Router.viewPages: (context) => ViewPages(),
        Router.textInputScreen: (context) => TextInputScreen(),
        '/Tag': (context) => TagWidget(),
        '/Pie': (context) => Pie(),
        '/DefaultCalendar': (context) => DefaultCalendar(),
      },
    );
  }
}
