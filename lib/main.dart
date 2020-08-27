import 'package:flutter/material.dart';
import 'package:tba/UI/Views/Home.dart';
import 'package:tba/UI/Views/Settings.dart';
import 'package:tba/constants.dart';

void main() {
  runApp(TBAMain());
}

final Map<String, Widget Function(BuildContext)> kRoutes = {
  "/": (_) => Home(),
  "/settings": (_) => Settings(),
  "/settings/login": (_) => throw UnimplementedError(),
};

class TBAMain extends StatelessWidget {
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