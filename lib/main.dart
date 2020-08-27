import 'package:flutter/material.dart';
import 'package:tba/UI/Views/Home.dart';
import 'package:tba/UI/Views/Settings.dart';
import 'package:tba/constants.dart';

void main() {
  runApp(MyApp());
}

var kRoutes = {
  "/": (_) => Home(),
  "/settings": (_) => Settings(),
  "/settings/login": (_) => throw UnimplementedError(),
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppNameShort,
      theme: kThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: kRoutes,
    );
  }
}