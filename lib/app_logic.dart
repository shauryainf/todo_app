import 'package:flutter/material.dart';

class AppLogic {
  static late Function updatePendingList;

  static List<Widget> widgetList = [];

  AppLogic(Function updatePendingListRecieved) {
    AppLogic.updatePendingList = updatePendingListRecieved;
    widgetList.add(CustomListTile(
      title: "Understand Basics of Flutter",
      isChecked: false,
    ));

    widgetList.add(CustomListTile(
      title: "Exploring State of a Widget",
      isChecked: false,
    ));
  }

  static void addNewTask(String newTask) {
    widgetList.add(CustomListTile(title: newTask, isChecked: false));
    updatePendingList();
  }
}

class CustomListTile extends StatefulWidget {
  final String title;
  bool isChecked;

  CustomListTile({
    required this.title,
    this.isChecked = false,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    print("CustomListTile Widget : Building Widget : " + widget.title);
    return CheckboxListTile(
        title: Text(widget.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              decoration: widget.isChecked ? TextDecoration.lineThrough : null,
            )),
        value: widget.isChecked,
        onChanged: (value) {
          print("CustomListTile Widget : ON Change Called :  " +
              value.toString() +
              " : " +
              widget.title);
          setState(() {
            widget.isChecked = value!;
          });
        });
  }
}
