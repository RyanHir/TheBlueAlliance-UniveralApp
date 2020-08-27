import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        children: [
          ListTile(
            title: Text("Login to myTBA"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => Navigator.pushNamed(context, "/settings/login"),
          )
        ],
      )
    );
  }
}