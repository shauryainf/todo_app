import 'package:flutter/material.dart';

class AppLogic {
  static late Function updatePendingList;

  static List<Widget> widgetList = [];

  AppLogic(Function updatePendingListRecieved) {
    AppLogic.updatePendingList = updatePendingListRecieved;
    widgetList.add(CustomListTile(
      title: "Understand Basics of Flutter",
      isChecked: false,
      updatePendingList: updatePendingList,
    ));

    widgetList.add(CustomListTile(
      title: "Exploring State of a Widget",
      isChecked: false,
      updatePendingList: updatePendingList,
    ));
  }

  static void handelListTileTap() {
    updatePendingList();
  }
}

class CustomListTile extends StatefulWidget {
  String title;
  bool isChecked;
  Function updatePendingList;

  CustomListTile(
      {required this.title,
      this.isChecked = false,
      required this.updatePendingList});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(widget.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              decoration: widget.isChecked ? TextDecoration.lineThrough : null,
            )),
        value: widget.isChecked,
        onChanged: (value) {
          print(value.toString() + " : " + widget.title);
          setState(() {
            widget.isChecked = value!;
          });
          // AppLogic.handelListTileTap();
        });
  }
}
