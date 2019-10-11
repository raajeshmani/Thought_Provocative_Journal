import 'package:flutter/material.dart';
import '../theme_data.dart';
import '../data/data.dart';
import '../tools/text_input_screen.dart';

import 'dart:convert';

class EmotionSheet extends StatefulWidget {
  @override
  _EmotionSheetState createState() => _EmotionSheetState();
}

class _EmotionSheetState extends State<EmotionSheet> {
  List<String> basicEmotions;
  List<String> deepEmotions;
  List<String> tooDeepEmotions;
  List<String> result;
  Color colorVal;

  String selectedBasicEmotion;
  String selectedDeepEmotion;
  @override
  void initState() {
    basicEmotions = emotionMapper.keys.toList();
    deepEmotions = [];
    tooDeepEmotions = [];
    result = [];

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Spacer(),
              FlatButton(
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.red, fontSize: 17.0),
                ),
                onPressed: () => {
                  emotionsForSegment = result,
                  Navigator.pop(context),
                  bringingInEmotions(),
                },
              ),
            ],
          ),
          SizedBox(
            height: 40.0,
            child: result.isEmpty
                ? Container(
                    child: Text(
                      'How did you feel then ?',
                      style: Ui.sheetHeadingStyle,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: userSelectedEmotionsWidget(),
                  ),
          ),
          Divider(
            thickness: 1.0,
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Spacer(),
                basicEmotionWidget(basicEmotions),
                Spacer(),
                deepEmotionWidget(deepEmotions),
                Spacer(),
                tooDeepEmotionWidget(tooDeepEmotions),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget basicEmotionWidget(List<String> strings) {
    return Column(
      children: strings
          .map(
            (basicEmotion) => InkWell(
              onLongPress: () => setState(() {
                result.add(basicEmotion);
              }),
              onTap: () => setState(() {
                selectedBasicEmotion = basicEmotion;
                deepEmotions = [];
                tooDeepEmotions = [];
                deepEmotions = emotionMapper[basicEmotion].keys.toList();
                print("Deep Emotions are :");
                print(deepEmotions);
                colorVal = Ui.emotionColors[basicEmotion];
              }),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  basicEmotion,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Ui.emotionTextFontSize,
                    color: Ui.emotionColors[basicEmotion],
                  ),
                ),
              ),
            ),
          )
          .toList(),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Widget deepEmotionWidget(List<String> strings) {
    return Column(
      children: strings
          .map((deepEmotion) => InkWell(
                onLongPress: () => setState(() {
                  print('Deep Emotion ' + deepEmotion + ' Added !!');
                  result.add(deepEmotion);
                }),
                onTap: () => setState(() {
                  selectedDeepEmotion = deepEmotion;
                  tooDeepEmotions = [];
                  tooDeepEmotions =
                      emotionMapper[selectedBasicEmotion][deepEmotion];
                  print("Too Deep Emotions are :");
                  print(tooDeepEmotions);
                }),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    deepEmotion,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Ui.emotionTextFontSize,
                      color: colorVal,
                    ),
                  ),
                ),
              ))
          .toList(),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Widget tooDeepEmotionWidget(List<String> strings) {
    return Column(
      children: strings
          .map((finalEmotion) => InkWell(
                onLongPress: () => setState(() {
                  result.add(finalEmotion);
                }),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    finalEmotion,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Ui.emotionTextFontSize,
                      color: colorVal,
                    ),
                  ),
                ),
              ))
          .toList(),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Widget userSelectedEmotionsWidget() {
    return Row(
      children: result
          .map((item) => Text(
                item,
                style: TextStyle(
                  color: Ui.emotionColors[allEmotionsMappedToBase[item]],
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                ),
              ))
          .toList(),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
