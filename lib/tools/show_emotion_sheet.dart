import 'package:flutter/material.dart';
import '../theme_data.dart';
import '../widgets/emotion_sheet.dart';

// import 'dart:convert';

// void iterateJson(String jsonStr) {
//   Map<String, dynamic> myMap = json.decode(jsonStr);
//   List<dynamic> emotions = myMap["emotions"];
//   emotions.forEach((emotion) {
//     print(emotion);
//     (emotion as Map<String, dynamic>).forEach((key, value) {
//       print(key);
//       print(value);
//       (value as Map<String, dynamic>).forEach((key2, value2) {
//         print(key2);
//         print(value2);
//       });
//     });
//   });
// }

void showEmotionSheet(context) {
  showModalBottomSheet(
      context: context,
      shape: Ui.borderDefined,
      builder: (BuildContext _) {
        return EmotionSheet();
      });
}
