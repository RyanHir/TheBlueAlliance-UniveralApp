import 'package:flutter/material.dart';
import 'package:tba/constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text(kAppNameLong), actions: [
        IconButton(
          icon: Icon(Icons.settings), 
          onPressed: () => Navigator.pushNamed(context, "/settings"))
      ]),
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
      ]),
    );
  }
}
