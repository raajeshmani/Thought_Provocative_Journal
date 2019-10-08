import 'package:flutter/material.dart';
import '../theme_data.dart';
import 'package:flutter_selectable_text/flutter_selectable_text.dart'
    as selectable;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../router.dart';

class WriteDiary extends StatefulWidget {
  @override
  _WriteDiaryState createState() => _WriteDiaryState();
}

class _WriteDiaryState extends State<WriteDiary> {
  final TextEditingController textEditingController =
      new TextEditingController();

  FocusNode focusNode;
  bool change;
  @override
  void initState() {
    textEditingController.addListener(() {
      setState(() {});
    });
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  showCalendar() {
    
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.calendarPlus,
                  color: Colors.white,
                ),
                onPressed: () => {}),
              FlatButton(
                child: Text(
                  'Done',
                  style: Theme.of(context).textTheme.display1,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: SelectableText(
                        textEditingController.text,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                  ),
                ),
                // buildInput(),
                
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          )),
    );
  }

  Widget buildInput() {
    return Container(
      child: Row(
        children: <Widget>[
          // Edit text
          Flexible(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: textEditingController,
                  style: Ui.textFieldStyle,
                  minLines: 1,
                  maxLines: 5,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: Ui.hintText,
                    hintStyle: Ui.hintStyle,
                    border: InputBorder.none,
                  ),
                  focusNode: focusNode,
                ),
              ),
            ),
          ),

          // Button send message
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
              color: primaryColor,
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
              topLeft: new Radius.circular(14.0),
              topRight: new Radius.circular(14.0)),
          // border:
          //     new Border(top: new BorderSide(color: greyColor2, width: 0.5)),
          color: Colors.white),
    );
  }
}
