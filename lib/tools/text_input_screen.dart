import 'package:flutter/material.dart';
import 'package:flutter_selectable_text/flutter_selectable_text.dart'
    as prefix0;
import '../theme_data.dart';
import 'package:flutter/services.dart';
import '../data/data.dart';
import './show_emotion_sheet.dart';
import 'dart:convert';

bool selectEmotions = false;
String data;
String sampleString;

String fullSegment;
int startIndex;
int endIndex;
List<int> startIndexArr;
List<int> endIndexArr;
var events;

class TextInputScreen extends StatefulWidget {
  @override
  _TextInputScreenState createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {
  TextEditingController textEditingController = new TextEditingController();

  FocusNode focusNode;

  @override
  void initState() {
    textEditingController.addListener(() {
      setState(() {
        sampleString = textEditingController.text;
      });
    });
    focusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    textEditingController.clear();

    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      //Important as This auto adjusts with the keyboard view
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 20.0, right: 20.0),
            child: TextField(
              controller: textEditingController,
              minLines: 1,
              maxLines: 12,
              autofocus: true,
              decoration: InputDecoration(
                hintText: Ui.hintText,
                hintStyle: Ui.hintStyle,
                border: InputBorder.none,
              ),
              // TODO: Add on submit
            ),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Pick Emotion',
                  style: Ui.emoticonButtonTextStyle,
                ),
                onPressed: () => showEmotionSheet(context),
              ),
              SizedBox(width: 75.0),
              FlatButton(
                child: Text(
                  'Paste',
                  style: Ui.pastebuttonTextStyle,
                ),
                onPressed: () async {
                  ClipboardData data = await Clipboard.getData('text/plain');
                  if (data.text.isEmpty) {
                    print("Paste called on null");
                  } else {
                    textEditingController.text =
                        textEditingController.text + data.text;
                  }
                },
              ),
              FlatButton(
                  child: Text('Fini', style: Ui.buttonTextStyle),
                  onPressed: () {
                    Navigator.pop(context);
                    // onFiniPressed();
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

void textInputSheet(context) {
  showModalBottomSheet<void>(
      context: context,
      shape: Ui.borderDefined,
      builder: (BuildContext context) {
        return TextInputScreen();
      });
}

// void onFiniPressed() {
//   events.add(_textController.text);
//   _textController.clear();
//   selectEmotions = !selectEmotions;
//   //Clear data
//   emotionsForSegment = [];
// }

works(String text) {
  fullSegment = sampleString;
  startIndex = fullSegment.indexOf(text);
  startIndexArr.add(startIndex);
  endIndex = startIndex + text.length;
  endIndexArr.add(startIndex);
}

bringingInEmotions() {
  var tagArr;
  for (var emotion in emotionsForSegment) {
    tagArr.add({"type": "EMOTION", "name": emotion});
  }

  // for (var i = 0; i < startIndexArr.length; i++) {
  events = [];
  var ev = {"start_index": startIndex, "end_index": endIndex, "tags": tagArr};
  events.add(ev);
  print(events);
}
