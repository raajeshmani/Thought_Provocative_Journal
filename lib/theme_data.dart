import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:collection';

ThemeData themeData = ThemeData(
  primaryColor: Ui.purpleButtonColor,
  fontFamily: 'Google Sans',
  textTheme: TextTheme(
    display1: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 17.0,
      color: Colors.white,
    ),
    body1: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 17.0,
      color: Ui.titleBlackColor,
    ),
  ),
);

final primaryColor = Color(0xff203152);
final greyColor = Color(0xffaeaeae);
final greyColor2 = Color(0xffE8E8E8);

class EmotionsData {
  String name;
  Color colorData;

  EmotionsData(this.name, this.colorData);
}

class Ui {
  static final hintText = "Compose one";
  // var emotionColors = new Map();
  static final emotionColors = {
    'surprised': Color(0xFF00a8ff),
    'happy': Color(0xFF44bd32),
    'sad': Color(0xFF5f27cd),
    'disgusted': Color(0xFF60a3bc),
    'angry': Color(0xFFe84118),
    'fearful': Color(0xFFfa983a),
    'bad': Color(0xFF78e08f)
  };
  //Icons
  static final penIcon = FontAwesomeIcons.penNib;
  static final pasteIcon = FontAwesomeIcons.paste;
  static final sendIcon = Icons.send;
  static final qrIcon = FontAwesomeIcons.qrcode;
  static var heartIcon = FontAwesomeIcons.heart;

  static final double cardElevation = 5.0;
  static final double storyCardElevation = 10.0;

// Colors
  static final Color titleBlackColor = Color(0xff202124);
  static final Color appBarBackgroundColor = Colors.white;
  static final Color accentColor = Color(0xff5481F7);
  static final Color dividerColor = Color(0x2f5F6368);
  static final Color borderColor = Color(0x4f5F6368);
  static final Color progressIndicatorColor = Color(0x4f247AEC);
  static final Color greyButtonColor = Color(0xff5F6368);
  static final Color emoticonButtonColor = Color(0xff7253FE);
  static final Color buttonColor = Color(0xff1A73E8);
  static final Color purpleButtonColor = Color(0xff7253FE);
  static final Color primaryColor = Color(0xff5481F7);
  static final Color snackBarColor = Colors.white;
  static final Color darkBacgroundColor = Color(0xff121212);
  static final Color lightBackgroundColor = Color(0xffF1F7FC);
  static final Color iconButtonColor = Color(0xff3c4043);

  static final gradientColors = [
    // Color(0xffd399c1),
    // Color(0xff9b5acf),
    // Color(0xff611cdf),
    Color(0xffb462ff),
    Color(0xffa46cff),
    Color(0xff8780ff),
  ];

  static final colorList = [
    Color(0xFF1e3799),
    Color(0xFFfad390),
    Color(0xFF6a89cc),
    Color(0xFF60a3bc),
    Color(0xFFeb2f06),
    Color(0xFFfa983a),
    Color(0xFF78e08f),
  ];

  static final TextStyle welcomeMessageStyle = TextStyle(
    fontSize: 14.0,
  );

  static final TextStyle titleStyle = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 24.0, color: Ui.titleBlackColor);

  static final TextStyle storyTextStyle = TextStyle(
    color: Ui.titleBlackColor,
    fontWeight: FontWeight.w500,
    fontSize: 28.0,
  );
  static final TextStyle dateTextStyle = TextStyle(
    color: Ui.titleBlackColor,
    fontWeight: FontWeight.w900,
    fontSize: 32.0,
  );
  static final TextStyle monthTextStyle = TextStyle(
    color: Ui.titleBlackColor,
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
  );
  static final TextStyle yearTextStyle = TextStyle(
    color: Ui.greyButtonColor,
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  );
  static final TextStyle sheetHeadingStyle = TextStyle(
    color: Ui.titleBlackColor,
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
  );
  static final TextStyle titleFieldStyle = TextStyle(
    color: Ui.titleBlackColor,
    fontWeight: FontWeight.w600,
    fontSize: 26.0,
  );
  static final TextStyle whiteButtonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16.0,
  );
  static final TextStyle buttonTextStyle = TextStyle(
    color: Ui.purpleButtonColor,
    fontSize: 16.0,
  );
  static const TextStyle hintStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  );
  static const TextStyle textFieldStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  );
  static final TextStyle pastebuttonTextStyle = TextStyle(
    color: Ui.greyButtonColor,
    fontSize: 16.0,
  );
  static final TextStyle emoticonButtonTextStyle = TextStyle(
    color: Ui.emoticonButtonColor,
    fontSize: 16.0,
  );

  static final ShapeBorder borderDefined = RoundedRectangleBorder(
      borderRadius: new BorderRadius.only(
          topLeft: new Radius.circular(12.0),
          topRight: new Radius.circular(12.0)));

  static final ShapeBorder fullborder = RoundedRectangleBorder(
      borderRadius: new BorderRadius.all(
    Radius.circular(12.0),
  ));
}

/*
Google Blues
#247AEC
Button Blue #1A73E8
On hover #669DF6
Link #455af1
*/

/*
Linear Gradient
Purple #7253FE
Blue #1775FB
 */

/*
Googly Black
Title black #202124
Normal Text #3c4043
Grey #5F6368
*/

/*
Green #5BB974
*/
