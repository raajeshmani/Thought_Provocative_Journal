import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme_data.dart';
// import '../data/data.dart';

class StoryCard extends StatefulWidget {
  final String storyTitle;
  final String storyTagLine;

  const StoryCard({
    Key key,
    this.storyTitle,
    this.storyTagLine,
  }) : super(key: key);

  @override
  _StoryCardState createState() => _StoryCardState();
}

class _StoryCardState extends State<StoryCard> {
  bool tapped = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
      width: 300.0,
      child: Card(
        child: InkWell(
          onTap: () {
            print('tapped');
          },
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 25.0,
                          left: 25.0,
                        ),
                        child: Text(
                          '08',
                          style: Ui.dateTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          left: 20.0,
                        ),
                        child: Text(
                          'OCT',
                          style: Ui.monthTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 0.0,
                          left: 20.0,
                        ),
                        child: Text(
                          '2019',
                          style: Ui.yearTextStyle,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: IconButton(
                      icon: Icon(Ui.heartIcon),
                      color: Colors.red,
                      iconSize: 28.0,
                      onPressed: () {
                        tapped = !tapped;
                        setState(() {
                          Ui.heartIcon = tapped
                              ? FontAwesomeIcons.solidHeart
                              : FontAwesomeIcons.heart;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: Text(
                      widget.storyTitle,
                      style: Ui.storyTextStyle,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                    child: Text(widget.storyTagLine, style: Ui.storyTextStyle),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
        elevation: Ui.storyCardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
