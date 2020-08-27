// Name of application,
import 'package:flutter/material.dart';

const String kAppName = "The Blue Alliance";
const String kAppNameShortened = "TBA";

const Map<int, Color> kColorSwatch = {
  050: Color(0x193F51B5), // 10 %
  100: Color(0x333F51B5), // 20 %
  200: Color(0x4C3F51B5), // 30 %
  300: Color(0x663F51B5), // 40 %
  400: Color(0x7F3F51B5), // 50 %
  500: Color(0x993F51B5), // 60 %
  600: Color(0xB23F51B5), // 70 %
  700: Color(0xCC3F51B5), // 80 %
  800: Color(0xE53F51B5), // 90 %
  900: Color(0xFF3F51B5), // 100 %
};

final MaterialColor kMaterialColor =
    MaterialColor(kColorSwatch[900].value, kColorSwatch);

final ThemeData kThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: kMaterialColor,
    accentColor: kMaterialColor,
    iconTheme: IconThemeData(color: Colors.black),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: kColorSwatch[900],
        unselectedItemColor: Colors.black87,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 12.0),
    fontFamily: "Roboto");

const int tabletBreakpoint = 600;
