import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thought_provocative_journal/data/data.dart' as prefix0;

import './theme_data.dart';
import './router.dart';
import './pages/write_diary.dart';
import './pages/display.dart';
import './pages/search_page.dart';
import './widgets/story_card.dart';
import './widgets/calendar.dart';
import './widgets/pie.dart';
import './widgets/default_calendar.dart';


import 'view_pages.dart';
import './data/data.dart';

import './tools/text_input_screen.dart';

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
        Router.writeDiary: (context) => WriteDiary(),
        Router.display: (context) => Display(),
        Router.viewPages: (context) => ViewPages(),
        '/Search': (context) => SearchPage(),
        '/Pie': (context) => Pie(),
        '/DefaultCalendar': (context) => DefaultCalendar(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Ui.lightBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Spacer(),
            Container(
              height: 500.0,
              child: Center(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 130.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Column(
                          children: <Widget>[
                            Spacer(),
                            Text(
                              'Story Arc',
                              style: TextStyle(
                                  fontSize: 32.0, fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0, right: 12.0, bottom: 15.0),
                              child: Divider(thickness: 1.0,),
                            ),
                            Container(
                              height: 150.0,
                              child: ListView(
                                padding: const EdgeInsets.only(left: 5.0, top: 20.0),
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    child: Text('Travelling'),
                                  ),
                                  Container(
                                    height: 40,
                                    child: Text('Favourites'),
                                  ),
                                  Container(
                                    height: 40,
                                    child: Text('Workout'),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        // separatorBuilder: (BuildContext context, int index) =>
                        //     SizedBox(width: 20.0),
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return StoryCard(
                            storyTitle: storyTitle[index],
                            storyTagLine: storyTagLine[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 12.0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          height: 80.0,
          child: Row(children: <Widget>[
            IconButton(
              onPressed: () => Navigator.pushNamed(context, Router.viewPages),
              icon: Icon(FontAwesomeIcons.layerGroup,
                color: Ui.iconButtonColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 30.0),
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/Pie'),
              icon: Icon(
                FontAwesomeIcons.chartPie,
                color: Ui.iconButtonColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 30.0),
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/Search'),
              icon: Icon(
                FontAwesomeIcons.search,
                color: Ui.iconButtonColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 30.0),
            ),
            Spacer(),
            IconButton(
              onPressed: () => textInputSheet(context),
              icon: Icon(
                Ui.penIcon,
                color: Ui.purpleButtonColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 30.0),
            ),
          ]),
        ),
      ),
    );
  }
}
