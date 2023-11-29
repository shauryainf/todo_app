import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/add_task_button.dart';
import 'package:todo_app/app_logic.dart';
import 'package:todo_app/history_list.dart';

// The runApp() function is a Flutter function that takes as its argument a Widget which the framework inflates and attaches to the screen's root to render it.
void main() {
  runApp(TodoApp());
}

// build is a method that describes what the widget looks like by returning a new widget tree. This method is called every time Flutter needs to render the widget or when the state of your widget changes.

// MaterialApp is a predefined class in flutter which is the root of your app. It provides many functionalities like theming, navigation, and title.
class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      home: BaseWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Scaffold is the basic setup for a page in your app. It's like a blank canvas where you can place different widgets to build your UI. Hover over the Scaffold widget to get more information about it.
class BaseWidget extends StatefulWidget {
  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  int currentIndex = 0;

  final pages = [
    PendingList(),
    HistoryList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List',
            style: GoogleFonts.comicNeue(
              textStyle: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            )),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 10,
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.redAccent,
                Colors.purple,
              ],
            ),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      floatingActionButton: AddTaskButton(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
    );
  }
}

// Stateful widgets are widgets that can change their state over time. These widgets are useful when the UI changes dynamically, like when you want to update the UI in response to user actions or when some data changes.
class PendingList extends StatefulWidget {
  @override
  State<PendingList> createState() => _PendingListState();
}

class _PendingListState extends State<PendingList> {
  @override
  void initState() {
    // TODO: implement initState
    AppLogic(updatePendingList);
    super.initState();
  }

  void updatePendingList() {
    setState(() {
      print("PendingList Widget: SetState called");
    });
  }

  @override
  Widget build(BuildContext context) {
    print('PendingList Widget: Building Widget');

    // ListView.builder is a better choice when dealing with a large number of items because it only builds those items that are currently visible on the screen, which can greatly improve the performance of your app.
    return Container(
      padding: EdgeInsets.only(top: 25),
      child: ListView.builder(
        itemCount: AppLogic.pendingWidgetList.length,
        itemBuilder: (context, index) {
          return AppLogic.pendingWidgetList[index];
        },
      ),
    );
  }
}





/*

SCAFFOLD:

  The Scaffold widget in Flutter provides a framework with a number of features that help in creating a consistent visual structure for an application. Here are some of its main features:

  appBar: This is a widget that is typically displayed at the top of the page as a header. It can contain a title, actions, and other widgets.

  body: This is the primary content of the scaffold. It takes up most of the screen space.

  floatingActionButton: This is a button that is displayed over the body widget, usually in the bottom right corner. It's typically used for a primary action in the application.

  drawer: This is a slide-out menu that is typically used for navigation. It's usually hidden off-screen and can be displayed by swiping from the left edge of the screen or by pressing the menu button in the appBar.

  bottomNavigationBar: This is a bar that appears at the bottom of the screen that can be used for navigation. It usually contains multiple items that can be selected to navigate between different views in the application.

  snackBar: This is a temporary notification that can be displayed at the bottom of the scaffold. It can contain a message and an action.

  backgroundColor: This is the color of the surface of the scaffold.

  resizeToAvoidBottomInset: This determines whether the body should resize when the keyboard appears.

  These are just some of the features provided by the Scaffold widget. It's a very flexible widget that can be customized to suit the needs of your application.

 */
