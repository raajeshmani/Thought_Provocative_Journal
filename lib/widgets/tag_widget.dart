import 'package:flutter/material.dart';
import '../data/data.dart';
import '../theme_data.dart';

import 'dart:convert';

class TagWidget extends StatefulWidget {
  @override
  _TagWidgetState createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {
  TextEditingController editingController = TextEditingController();

  List<String> selectedEmotions;

  var duplicateEmotionItems;
  var emotionItems = List<String>();

  @override
  void initState() {
    setState(() {
      duplicateEmotionItems = allEmotions;
      selectedEmotions = [];
    });
    super.initState();
  }

  @override
  void dispose() {
    editingController.clear();
    emotionItems.clear();
    selectedEmotions = [];
    super.dispose();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateEmotionItems);
    if (query.isNotEmpty && query.startsWith("#")) {
      String emotionQuery = query.substring(1);
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(emotionQuery)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        emotionItems.clear();
        emotionItems.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        emotionItems.clear();
        emotionItems.addAll(duplicateEmotionItems);
      });
    }
  }

  void addingToSelected(String selected) {
    print(selected);
    setState(() {
      selectedEmotions.add(selected);
      duplicateEmotionItems.remove(selected);
      emotionItems.remove(selected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 13.0),
            Text(
              'Search',
              style: TextStyle(fontSize: 22.0),
            ),
            SizedBox(
              child: getEmotionsWidget(),
              height: 60.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    onChanged: (value) {
                      filterSearchResults(value);
                      if (value.isEmpty) {
                        emotionItems.clear();
                      }
                    },
                    controller: editingController,
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "Type Keyword to Search >>",
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)))),
                  ),
                  Container(
                    height: 500.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: emotionItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(
                              '${emotionItems[index]}',
                              style: TextStyle(color: Ui.emotionColors[allEmotionsMappedToBase[emotionItems[index]]]),
                            ),
                            onTap: () => addingToSelected(emotionItems[index]));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getEmotionsWidget() {
    return Row(
      children: selectedEmotions
          .map(
            (item) => new Text(item,
                style: TextStyle(
                  color: Ui.emotionColors[allEmotionsMappedToBase[item]],
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                )),
          )
          .toList(),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
