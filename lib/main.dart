import 'package:flutter/material.dart';
import 'package:flutter_app/models/Ids.dart';
import 'Sidebar/Sidebar_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlue[100],
        primaryColor: Colors.blue,
        accentColor: Colors.lightBlueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Sidebar_layout(),
    );
  }
}

