import 'package:flutter/material.dart';
import 'package:tba/Tools/apiFetch.dart';
import 'package:tba/UI/Views/Menus/Districts.dart';
import 'package:tba/UI/Views/Menus/Events.dart';
import 'package:tba/UI/Views/Menus/Teams.dart';
import 'package:tba/constants.dart';

getEvents(Function(List<dynamic>) callback) async {
  final events = await fetch("events/2020", {});
  callback(events);
}

getDistricts(Function(List<dynamic>) callback) async {
  final districts = await fetch("districts/2020", {});
  callback(districts);
}

getTeams(Function(List<dynamic>) callback) async {
  List teams = List();
  int page = 0;
  while (true) {
    final buf = await fetch("teams/$page/simple", {});
    teams += buf;
    if (buf.length != 0) {
      page++;
    } else {
      break;
    }
  }

  callback(teams);
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<StatefulWidget> {
  bool _firstLoad = true;
  bool _loading = true;
  bool _online = false;
  int _position = 0;

  List events = new List();
  List teams = new List();
  List districts = new List();

  List<Widget> _screens = [];

  Widget _buildOnline(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text(kAppNameLong), actions: [
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, "/settings"))
      ]),
      body: _screens[_position],
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
      await fetch("status", {});
    } catch (e) {
      setState(() {
        _loading = false;
        _online = false;
      });
      return;
    }
    Function genScreens = () {
      _screens = [Events(events), Teams(teams), Districts(districts)];
    };
    genScreens();
    getEvents((items) {
      setState(() {
        events = items;
        genScreens();
      });
    });
    getTeams((items) {
      setState(() {
        teams = items;
        genScreens();
      });
    });
    getDistricts((items) {
      setState(() {
        districts = items;
        genScreens();
      });
    });
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cannot get connection to API. Try again later.",
                  style: kThemeData.textTheme.headline6,
                ),
                RaisedButton(
                    child: Text(
                      "Refresh",
                      style: kThemeData.textTheme.button,
                    ),
                    onPressed: () => setState(() => _firstLoad = true))
              ],
            ),
          ),
        );
        // return _buildOnline(context);
      }
    }
  }
}
