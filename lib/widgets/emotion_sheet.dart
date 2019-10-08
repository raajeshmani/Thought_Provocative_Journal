import 'package:flutter/material.dart';
import '../theme_data.dart';
import '../data/data.dart';

import 'dart:convert';

class EmotionSheet extends StatefulWidget {
  @override
  _EmotionSheetState createState() => _EmotionSheetState();
}

class _EmotionSheetState extends State<EmotionSheet> {
  List<String> basicEmotions;
  List<String> deepEmotions;
  List<String> finalEmotions;
  List<dynamic> tooDeepEmotions;
  Color colorVal;

  bool deep = false;
  bool toodeep = false;
  @override
  void initState() {
    basicEmotions = [];
    deepEmotions = [];
    finalEmotions = [];
    tooDeepEmotions = [];

    iterateJson(jsonStr);
    print(basicEmotions);
    super.initState();
  }

  void iterateJson(String jsonStr) {
    Map<String, dynamic> myMap = json.decode(jsonStr);
    List<dynamic> emotions = myMap["emotions"];
    emotions.forEach((emotion) {
      (emotion as Map<String, dynamic>).forEach((key, value) {
        basicEmotions.add(key);
      });
    });
  }

  void findDeep(String getval) {
    Map<String, dynamic> myMap = json.decode(jsonStr);
    List<dynamic> emotions = myMap["emotions"];
    emotions.forEach((emotion) {
      (emotion as Map<String, dynamic>).forEach((key, value) {
        if (key == getval) {
          (value as Map<String, dynamic>).forEach((key2, value2) {
            deepEmotions.add(key2);
            tooDeepEmotions.add(value2);
          });
        }
      });
    });
    print(deepEmotions);
    print(tooDeepEmotions);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Text(
                'How did you feel then ?',
                style: Ui.sheetHeadingStyle,
              ),
            ),
          ),
          Divider(thickness: 1.0,),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Spacer(),
                getTextWidgets(basicEmotions),
                Spacer(),
                getDeepTextWidgets(deepEmotions),
                Spacer(),
                getFinalTextWidgets(finalEmotions),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getTextWidgets(List<String> strings) {
    return new Column(
      children: strings
          .map((item) => new FlatButton(
                child: Text(
                  item,
                  style: Ui.whiteButtonTextStyle,
                ),
                onPressed: () => {
                  setState(() {
                    deepEmotions = [];
                    finalEmotions = [];
                    findDeep(item);
                    deep = false;
                    colorVal =
                        Color(coloredEmotions[basicEmotions.indexOf(item)]);
                  }),
                },
                shape: Ui.borderDefined,
                color: Color(coloredEmotions[basicEmotions.indexOf(item)]),
              ))
          .toList(),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Widget getDeepTextWidgets(List<String> strings) {
    List<String> tempList;
    return new Column(
      children: strings
          .map((item) => new FlatButton(
                child: Text(
                  item,
                  style: Ui.whiteButtonTextStyle,
                ),
                onPressed: () => {
                  tempList = [],
                  for (var i = 0; i < deepEmotions.length; i++)
                    {
                      if (item == deepEmotions[i])
                        {
                          for (var j = 0; j < 2; j++)
                            {
                              tempList.add(tooDeepEmotions[i][j]),
                            },
                        },
                    },
                  finalEmotions = tempList,
                  setState(() {
                    deep = true;
                  }),
                },
                shape: Ui.borderDefined,
                color: colorVal,
              ))
          .toList(),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Widget getFinalTextWidgets(List<String> strings) {
    return new Column(
      children: strings
          .map((item) => new FlatButton(
                child: Text(
                  item,
                  style: Ui.whiteButtonTextStyle,
                ),
                onPressed: () => {
                  print('Final Emotion is : ' + item),
                  Navigator.pop(context),
                },
                shape: Ui.borderDefined,
                color: colorVal,
              ))
          .toList(),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
