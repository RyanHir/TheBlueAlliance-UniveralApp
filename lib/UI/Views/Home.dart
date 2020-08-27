import 'package:flutter/material.dart';
import 'package:tba/UI/Views/Menus/Districts.dart';
import 'package:tba/UI/Views/Menus/Events.dart';
import 'package:tba/UI/Views/Menus/Teams.dart';
import 'package:tba/UI/Views/Menus/myTBA.dart';
import 'package:tba/Tools/apiFetch.dart';
import 'package:tba/constants.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<StatefulWidget> {
  // ignore: unused_field
  bool _firstLoad = true;
  bool _loading = true;
  bool _online = false;
  int _position = 0;

  Widget _getScreen() {
    switch (_position) {
      case 0:
        return Events();
        break;
      case 1:
        return Teams();
        break;
      case 2:
        return Districts();
        break;
      case 3:
        return MyTBA();
        break;
      default:
        throw UnsupportedError("Unknown Position Given!");
    }
  }

  Widget _buildOnline(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text(kAppNameLong), actions: [
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, "/settings"))
      ]),
      body: _getScreen(),
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

  void isOnline() async {
    try {
      print((await fetch("status", {})).toString());
    } catch (e) {
      setState(() {
        _loading = false;
        _online = false;
      });
      return;
    }
    setState(() {
      _loading = false;
      _online = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_firstLoad) {
      isOnline();
      _firstLoad = false;
    }
    if (_loading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    } else {
      if (_online) {
        return _buildOnline(context);
      } else {
        return Scaffold(
          body: Center(
            child: Text(
              "Cannot get connection to API. Try again later.",
              style: kThemeData.textTheme.headline1,
            ),
          ),
        );
        // return _buildOnline(context);
      }
    }
  }
}
