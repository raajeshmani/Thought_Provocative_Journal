import 'package:flutter/material.dart';
import '../data/data.dart';
import '../widgets/event_card.dart';
import '../theme_data.dart';

class Display extends StatefulWidget {

  const Display({
    Key key,
    this.dt,
  }) : super(key: key);

  final DateTime dt;
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
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
      body: Stack(children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              pinned: false,
              backgroundColor: Colors.transparent,
              expandedHeight: 230.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 18.0, bottom: 30.0),
                title: Text('8th October 2019',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SliverList(
              // itemExtent: events.length.toDouble(),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        EventCard(
                            event: events[index],
                            emotion: emotions[index],
                            index: index),
                      ],
                    ),
                  );
                },
                childCount: events.length,
              ),
            ),
          ],
        ),
        
      ]),
    );
  }



  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         SizedBox(
  //           height: 30.0,
  //         ),
  //         Container(
  //           padding: EdgeInsets.all(14.0),
  //           child: Text('7th October 2019', style: Ui.titleFieldStyle),
  //         ),
  //         Expanded(
  //           child: ListView.separated(
  //             separatorBuilder: (_, index) => SizedBox(height: 20.0),
  //             itemCount: events.length,
  //             padding: const EdgeInsets.only(top: 10.0),
  //             itemBuilder: (context, index) {
  //               return EventCard(
  //                   event: events[index], emotion: emotions[index], index: index);
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
