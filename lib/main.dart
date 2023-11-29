import 'package:flutter/material.dart';

// The runApp() function is a Flutter function that takes as its argument a Widget which the framework inflates and attaches to the screen's root to render it.
void main() {
  runApp(TodoApp());
}

// build is a method that describes what the widget looks like by returning a new widget tree. This method is called every time Flutter needs to render the widget or when the state of your widget changes.

// MaterialApp is a predefined class in flutter which is the root of your app. It provides many functionalities like theming, navigation, and title.
class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Todo List', home: BaseWidget());
  }
}

// Scaffold is the basic setup for a page in your app. It's like a blank canvas where you can place different widgets to build your UI. Hover over the Scaffold widget to get more information about it.
class BaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo List',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello', style: TextStyle(fontSize: 50)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text('Hello World 1', style: TextStyle(fontSize: 50)),
                    Text('Hello World 2', style: TextStyle(fontSize: 50)),
                    Text('Hello World 2', style: TextStyle(fontSize: 50)),
                    Text('Hello World 2', style: TextStyle(fontSize: 50)),
                    Text('Hello World 2', style: TextStyle(fontSize: 50)),
                    Text('Hello World 2', style: TextStyle(fontSize: 50)),
                    Text('Hello World 2', style: TextStyle(fontSize: 50)),
                    Text('Hello World 2', style: TextStyle(fontSize: 50)),
                  ],
                ),
              ),
              Text('Hello World 3', style: TextStyle(fontSize: 50)),
            ],
          ),
        ));
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
