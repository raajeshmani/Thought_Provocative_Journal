import 'package:flutter/material.dart';
import '../theme_data.dart';
import '../data/data.dart';

import 'dart:convert';

class EventSheet extends StatefulWidget {
  final String event;
  final List<String> emotion;
  final int index;

  const EventSheet({
    Key key,
    this.event,
    this.emotion,
    this.index,
  }) : super(key: key);
  
  @override
  _EventSheetState createState() => _EventSheetState();
}

class _EventSheetState extends State<EventSheet> {
  @override
  void initState() {
    super.initState();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                widget.emotion[0] != ''
                    ? getEmotionsWidget()
                    : Padding(padding: EdgeInsets.all(12.0),child: Text('Emotion Not Tagged Yet', style: TextStyle(color: Colors.grey, fontSize: 15.0),)),
              ],
            ),
          ),
          Divider(
            thickness: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SelectableText(widget.event),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                // border: Border.all(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getBaseEmotion(String emotion) {
    Map<String, dynamic> myMap = json.decode(baseEmotionLinkJson);
    String baseEmotion = myMap[emotion];
    // print(baseEmotion);
    // print('affafaafa');
    // print(Ui.emotionColors);
    // print(Ui.emotionColors[baseEmotion]);
    return baseEmotion;
  }

  Widget getEmotionsWidget() {
    return Row(
      children: widget.emotion
          .map((item) => new FlatButton(
                child: Text(
                  item,
                  style: Ui.whiteButtonTextStyle,
                ),
                onPressed: () => {},
                shape: Ui.fullborder,
                color: Ui.emotionColors[getBaseEmotion(item)],
              ))
          .toList(),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
