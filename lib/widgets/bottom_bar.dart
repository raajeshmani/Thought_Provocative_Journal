import 'package:flutter/material.dart';
import 'package:thought_provocative_journal/tools/text_input_screen.dart';
import '../theme_data.dart';
import '../tools/text_input_screen.dart';

class BottomBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // 0.07 would be perfect but the touch reading of top of fab is read by tile 
        height: MediaQuery.of(context).size.height * 0.1,
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            elevation: 8.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 58.0,
              child: Row(children: <Widget>[
                IconButton(
                  onPressed: () => textInputSheet(context),
                  icon: Icon(Icons.menu),
                ),
                Spacer(),
                IconButton(
                  onPressed: () => textInputSheet(context),
                  icon: Icon(Ui.penIcon),
                )
              ]),
            ),
          ),
        ));
  }
}
