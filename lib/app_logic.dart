import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogic {
  static late Function updatePendingList;
  static late Function updateHistoryList;

  static List<Widget> pendingWidgetList = [];
  static List<Widget> historyWidgetList = [];

  AppLogic(
    Function updatePendingListRecieved,
  ) {
    AppLogic.updatePendingList = updatePendingListRecieved;

    pendingWidgetList.add(CustomListTile(
      title: "Understand Basics of Flutter",
      isChecked: false,
    ));

    pendingWidgetList.add(CustomListTile(
      title: "Exploring State of a Widget",
      isChecked: false,
    ));

    pendingWidgetList.add(CustomListTile(
      title: "Understand Basic Navigation",
      isChecked: false,
    ));

    pendingWidgetList.add(CustomListTile(
      title: "Understand Basic Theming",
      isChecked: false,
    ));

    pendingWidgetList.add(CustomListTile(
      title: "Deploying Flutter App",
      isChecked: false,
    ));
  }

  static void initializeHistoryList(Function updateHistoryListRecieved) {
    AppLogic.updateHistoryList = updateHistoryListRecieved;
  }

  static void addNewTask(String newTask) {
    pendingWidgetList.add(CustomListTile(title: newTask, isChecked: false));
    updatePendingList();
  }

  static void dismissTask(Widget task) {
    pendingWidgetList.remove(task);
    historyWidgetList.remove(task);
    historyWidgetList.add(task);
    updateHistoryList();
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
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        print("CustomListTile Widget : On Dismissed Called : " +
            widget.title +
            " : " +
            direction.toString());

        AppLogic.dismissTask(this.widget);
        setState(() {});
        AppLogic.updatePendingList();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 9, horizontal: 18),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(
            width: 3,
            color: Colors.transparent,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 51, 7, 246), Colors.redAccent],
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(1),
          // color: Colors.white,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white),
          child: CheckboxListTile(
              title: Text(
                widget.title,
                style: GoogleFonts.comicNeue(
                    textStyle: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  decoration:
                      widget.isChecked ? TextDecoration.lineThrough : null,
                )),
              ),
              value: widget.isChecked,
              onChanged: (value) {
                print("CustomListTile Widget : ON Change Called :  " +
                    value.toString() +
                    " : " +
                    widget.title);
                setState(() {
                  widget.isChecked = value!;
                });
              }),
        ),
      ),
    );
  }
}
