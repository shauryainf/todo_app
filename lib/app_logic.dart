import 'package:flutter/material.dart';

class AppLogic {
  static void someFunction() {
    print("You called someFunction()");
  }
}

class CustomListTile extends StatelessWidget {
  String title;
  bool isChecked;
  Function updatePendingList;

  CustomListTile(
      {required this.title,
      this.isChecked = false,
      required this.updatePendingList});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        value: isChecked,
        onChanged: (value) {
          print(value.toString() + " : " + title);
          AppLogic.someFunction();
          updatePendingList();
        });
  }
}
