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
      appBar: AppBar(title: Text('Todo List')),
      body: Center(child: Text('Hello World')),
    );
  }
}
