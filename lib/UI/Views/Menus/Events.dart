import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Events extends StatelessWidget {
  Events(this.data);

  @required
  final List data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]["name"]),
          );
        });
  }
}
