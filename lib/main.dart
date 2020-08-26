import 'package:flutter/material.dart';
import 'const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Blue Alliance',
      theme: ThemeData(
        primarySwatch: materialColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text("The Blue Alliance")),
      body: Center(child: Text("Test"),),
      bottomNavigationBar: null,
    );
  }
}