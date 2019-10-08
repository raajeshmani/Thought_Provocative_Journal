import 'package:flutter/material.dart';
import '../theme_data.dart';
import 'package:flutter/services.dart';
import '../data/data.dart';

import './show_emotion_sheet.dart';

TextEditingController _textController = new TextEditingController();

void textInputSheet(context) {
  showModalBottomSheet<void>(
      context: context,
      shape: Ui.borderDefined,
      builder: (BuildContext context) {
        return Padding(
          //Important as This auto adjusts with the keyboard view
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 20.0, right: 20.0),
                child: TextField(
                  controller: _textController,
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
                      ClipboardData data =
                          await Clipboard.getData('text/plain');
                      _textController.text = data.text;
                    },
                  ),
                  FlatButton(
                      child: Text('Fini', style: Ui.buttonTextStyle),
                      onPressed: () {
                        Navigator.pop(context);
                        onFiniPressed();
                      }),
                ],
              ),
            ],
          ),
        );
      });
}

void onFiniPressed() {
  events.add(_textController.text);
  _textController.clear();
}