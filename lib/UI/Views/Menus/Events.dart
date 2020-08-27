import 'package:flutter/material.dart';
import 'package:tba/Tools/apiFetch.dart';

class Events extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventState();
  }
}

class EventState extends State<StatefulWidget> {
  bool _firstLoad = true;
  bool _loading = true;
  var events = [];

  void _fetch() async {
    events = await fetch("events/2020", {});
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_firstLoad) {
      _fetch();
      _firstLoad = false;
    }
    if (_loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Center(
        child: ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, item) {
              return ListTile(
                title: Text(events[item]["name"]),
                trailing: Icon(Icons.arrow_forward),
              );
            }));
  }
}
