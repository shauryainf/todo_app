import 'package:flutter/material.dart';
import 'package:todo_app/app_logic.dart';

class AddTaskButton extends StatelessWidget {
  String inputText = "";

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        print("AddTaskButton Widget : ON Pressed Called");
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Add Task'),
              content: TextField(
                // Cursor will be automatically focused on the text field
                autofocus: true,

                // When the user presses the enter / done button
                onSubmitted: (value) {
                  AppLogic.addNewTask(value);
                  Navigator.of(context).pop();
                },
                onChanged: (value) {
                  inputText = value;
                },
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    AppLogic.addNewTask(inputText);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Icon(Icons.add, color: Colors.white),
      backgroundColor: Colors.red,
    );
  }
}
