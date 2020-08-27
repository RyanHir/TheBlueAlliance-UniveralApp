import 'package:flutter/material.dart';
import 'package:tba/Tools/apiFetch.dart';

class Districts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DistrictState();
  }
}

class DistrictState extends State<Districts> {
  bool _firstLoad = true;
  bool _loading = true;
  var districts = [];

  void _fetch() async {
    districts = await fetch("districts/2020", {});
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
            itemCount: districts.length,
            itemBuilder: (context, item) {
              return ListTile(
                title: Text(districts[item]["display_name"]),
                trailing: Icon(Icons.arrow_forward),
              );
            }));
  }
}
