import 'package:flutter/material.dart';

const int _r = 63;
const int _g = 81;
const int _b = 181;

const Map<int, Color> color = {
  50: Color.fromRGBO(_r, _g, _b, 0.1),
  100: Color.fromRGBO(_r, _g, _b, 0.2),
  200: Color.fromRGBO(_r, _g, _b, 0.3),
  300: Color.fromRGBO(_r, _g, _b, 0.4),
  400: Color.fromRGBO(_r, _g, _b, 0.5),
  500: Color.fromRGBO(_r, _g, _b, 0.6),
  600: Color.fromRGBO(_r, _g, _b, 0.7),
  700: Color.fromRGBO(_r, _g, _b, 0.8),
  800: Color.fromRGBO(_r, _g, _b, 0.9),
  900: Color.fromRGBO(_r, _g, _b, 1.0),
};
const materialColor = MaterialColor(0xFF3f51b5, color);
