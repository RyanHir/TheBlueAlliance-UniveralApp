import 'package:flutter/material.dart';
import 'package:tba/Tools/apiFetch.dart';

class Teams extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TeamState();
  }
}

class TeamState extends State<StatefulWidget> {
  bool _firstLoad = true;
  bool _loading = true;
  List teams = [];

  void _fetch() async {
    int page = 0;
    while (true) {
      var buf = await fetch("teams/$page/simple", {});
      assert(buf is List);
      teams += buf;
      if (buf.length != 0) {
        page++;
      } else {
        break;
      }
    }

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
            itemCount: teams.length,
            itemBuilder: (context, item) {
              print(teams[item]);
              return ListTile(
                title: Text(
                    "${teams[item]["team_number"]}: ${teams[item]["nickname"]}"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => print(teams[item]["name"]),
              );
            }));
  }
}
