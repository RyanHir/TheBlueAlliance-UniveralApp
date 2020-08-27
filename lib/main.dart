import 'package:flutter/material.dart';
import 'package:tba/constants.dart';
import 'package:tba/UI/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appNameShortened,
      theme: TBAThemeInfo.getTheme(),
      home: new Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text(appName)),
      body: Center(child: Text("Test"),),
      bottomNavigationBar: null,
    );
  }
}