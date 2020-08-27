import 'package:flutter/material.dart';
import 'package:tba/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppNameShortened,
      theme: kThemeData,
      home: new Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text(kAppName)),
      body: Center(
        child: Text("Test"),
      ),
      bottomNavigationBar: new BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          title: Text("Events"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          title: Text("Teams"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group_work),
          title: Text("Districts"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          title: Text("myTBA"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("Settings"),
        ),
      ]),
    );
  }
}
