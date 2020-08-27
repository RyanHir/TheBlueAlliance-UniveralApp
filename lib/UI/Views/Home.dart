import 'package:flutter/material.dart';
import 'package:tba/constants.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<StatefulWidget> {
  // ignore: unused_field
  int _position = 0;

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: AppBar(title: Text(kAppNameLong), actions: [
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, "/settings"))
      ]),
      body: Center(
        child: Text("Position: $_position"),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
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
        ],
        onTap: (position) => setState(() => _position = position),
        currentIndex: _position,
      ),
    );
  }
}
