import 'package:flutter/material.dart';
import 'package:thought_provocative_journal/tools/text_input_screen.dart';
import 'package:thought_provocative_journal/widgets/tag_widget.dart';
import './theme_data.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './widgets/story_card.dart';
import './data/data.dart';

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
                              padding: const EdgeInsets.only(
                                  top: 15.0, right: 12.0, bottom: 15.0),
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Container(
                              height: 150.0,
                              child: ListView(
                                padding:
                                    const EdgeInsets.only(left: 5.0, top: 20.0),
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
              icon: Icon(
                FontAwesomeIcons.layerGroup,
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
              onPressed: () => showModalBottomSheet(
                  context: context,
                  shape: Ui.borderDefined,
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: TagWidget(),
                    );
                  }),
              icon: Icon(
                FontAwesomeIcons.search,
                color: Ui.iconButtonColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 30.0),
            ),
            Spacer(),
            IconButton(
              onPressed: () =>textInputSheet(context),
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
