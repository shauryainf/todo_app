import 'package:flutter/material.dart';
import 'package:todo_app/app_logic.dart';

class HistoryList extends StatefulWidget {
  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  void initState() {
    // TODO: implement initState
    AppLogic.initializeHistoryList(updateHistoryList);
    super.initState();
  }

  void updateHistoryList() {
    setState(() {
      print("HistoryList Widget: SetState called");
    });
  }

  @override
  Widget build(BuildContext context) {
    print('HistoryList Widget: Building Widget');

    // ListView.builder is a better choice when dealing with a large number of items because it only builds those items that are currently visible on the screen, which can greatly improve the performance of your app.
    return ListView.builder(
      itemCount: AppLogic.historyWidgetList.length,
      itemBuilder: (context, index) {
        return AppLogic.historyWidgetList[index];
      },
    );
  }
}
