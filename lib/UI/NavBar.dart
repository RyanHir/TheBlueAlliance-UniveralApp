import 'package:flutter/material.dart';

const _items = [
  Tab(
    icon: Icon(Icons.calendar_today),
  ),
  Tab(
    icon: Icon(Icons.people),
  ),
  Tab(
    icon: Icon(Icons.group_work),
  ),
  Tab(
    icon: Icon(Icons.star),
  ),
  // BottomNavigationBarItem(
  //   icon: Icon(Icons.settings),
  //   title: Text("Settings"),
  // ),
];

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(tabs: _items);
  }
}
