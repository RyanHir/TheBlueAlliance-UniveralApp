import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Teams extends StatelessWidget {
  Teams(this.data);

  @required
  final List data;

  @override
  Widget build(BuildContext context) {
    print(data.toString());
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]["nickname"]),
          );
        });
  }
}
