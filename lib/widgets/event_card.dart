import 'package:flutter/material.dart';
import '../theme_data.dart';
import '../data/data.dart';
import '../widgets/event_sheet.dart';

import 'dart:convert';

class EventCard extends StatefulWidget {
  final String event;
  final List<String> emotion;
  final int index;

  const EventCard({
    Key key,
    this.event,
    this.emotion,
    this.index,
  }) : super(key: key);

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
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
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: InkWell(
        onTap: () => showModalBottomSheet(
            context: context,
            shape: Ui.borderDefined,
            builder: (BuildContext _) {
              return EventSheet(
                  event: widget.event,
                  emotion: widget.emotion,
                  index: widget.index);
            }),
        child: Card(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 14.0, top: 25.0, bottom: 25.0),
                child: Container(
                  // child: SelectableText(widget.event),
                  child: Text(widget.event),
                ),
              ),
              Divider(),
              Container(
                height: 40.0,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    getEmotionsWidget(),
                  ],
                ),
              ),
            ],
          ),
          elevation: Ui.cardElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }

  Widget getEmotionsWidget() {
    return Expanded(
      child: Row(
        children: widget.emotion
            .map(
              (item) => new Text(
                item,
                style: TextStyle(
                  color: Ui.emotionColors[allEmotionsMappedToBase[item]],
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                ),
              ),
            )
            .toList(),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }
}
