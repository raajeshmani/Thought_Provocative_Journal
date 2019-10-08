import 'package:flutter/material.dart';
import '../data/data.dart';
import '../pages/display.dart';
import '../theme_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:search_widget/search_widget.dart';

class LeaderBoard {
  final String username;
  final double score;

  LeaderBoard(this.username, this.score);
}

class SelectedItemWidget extends StatelessWidget {
  final LeaderBoard selectedItem;
  final VoidCallback deleteSelectedItem;

  SelectedItemWidget(this.selectedItem, this.deleteSelectedItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 4.0,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 8,
              ),
              child: Text(
                selectedItem.username,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, size: 22),
            color: Colors.grey[700],
            onPressed: deleteSelectedItem,
          ),
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  MyTextField(this.controller, this.focusNode);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: new TextStyle(fontSize: 16, color: Colors.grey[600]),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x4437474F)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme
                .of(context)
                .primaryColor),
          ),
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          hintText: "Search here...",
          contentPadding: EdgeInsets.only(
            left: 16,
            right: 20,
            top: 14,
            bottom: 14,
          ),
        ),
      ),
    );
  }
}

class NoItemsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.folder_open,
            size: 24,
            color: Colors.grey[900].withOpacity(0.7),
          ),
          SizedBox(width: 10.0),
          Text(
            "No Items Found",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[900].withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class PopupListItemWidget extends StatelessWidget {
  final LeaderBoard item;

  PopupListItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        item.username,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<LeaderBoard> list = <LeaderBoard>[
    LeaderBoard("Flutter", 54.0),
    LeaderBoard("React", 22.5),
    LeaderBoard("Ionic", 24.7),
    LeaderBoard("Xamarin", 22.1),
  ];

  TextEditingController textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Ui.lightBackgroundColor,
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 32.0, right: 32.0, top: 100.0),
                child: Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 50.0),
                        ListTile(
                          title: Text(
                            'Browse',
                            style: TextStyle(
                                fontSize: 38.0, fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            'Find stories that interest you',
                            style: Ui.welcomeMessageStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: TextField(
                              style: TextStyle(
                                fontSize: 18.0,
                                height: 2,
                              ),
                              controller: textController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '  Type Keyword ',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FlatButton(
                          onPressed: () => {
                            SearchWidget<LeaderBoard>(
                              dataList: list,
                              hideSearchBoxWhenItemSelected: false,
                              listContainerHeight:
                                  MediaQuery.of(context).size.height / 4,
                              queryBuilder:
                                  (String query, List<LeaderBoard> list) {
                                return list
                                    .where((LeaderBoard item) => item.username
                                        .toLowerCase()
                                        .contains(query.toLowerCase()))
                                    .toList();
                              },
                              popupListItemBuilder: (LeaderBoard item) {
                                return PopupListItemWidget(item);
                              },
                              selectedItemBuilder: (LeaderBoard selectedItem,
                                  VoidCallback deleteSelectedItem) {
                                return SelectedItemWidget(
                                    selectedItem, deleteSelectedItem);
                              },
                              // widget customization
                              noItemsFoundWidget: NoItemsFound(),
                              textFieldBuilder:
                                  (TextEditingController controller,
                                      FocusNode focusNode) {
                                return MyTextField(controller, focusNode);
                              },
                            )
                          },
                          child: Text('Search', style: Ui.buttonTextStyle),
                        ),
                        SizedBox(height: 40.0),
                      ],
                    ),
                    elevation: Ui.cardElevation,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 32.0, right: 32.0, top: 470.0),
                child: Center(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 40.0),
                        Text('Pick one to personify above search'),
                        SizedBox(height: 30.0),
                        Row(
                          children: <Widget>[
                            Spacer(),
                            Card(
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.grinTongue,
                                      color: Ui.iconButtonColor,
                                    ),
                                    color: Ui.iconButtonColor,
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 18.0,
                                          right: 18.0,
                                          bottom: 18.0),
                                      child: Text('Emotion'),
                                    ),
                                  ),
                                ],
                              ),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            Spacer(),
                            Card(
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.userSecret,
                                      color: Ui.iconButtonColor,
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 18.0,
                                          right: 18.0,
                                          bottom: 18.0),
                                      child: Text('Person'),
                                    ),
                                  ),
                                ],
                              ),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            Spacer(),
                            Card(
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.hashtag,
                                      color: Ui.iconButtonColor,
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 18.0,
                                          right: 18.0,
                                          bottom: 18.0),
                                      child: Text('Custom'),
                                    ),
                                  ),
                                ],
                              ),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 40.0),
                      ],
                    ),
                    elevation: Ui.cardElevation,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
