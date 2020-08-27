import 'package:flutter/material.dart';
import 'package:tba/constants.dart';

double _map(var x, var inMin, var inMax, var outMin, var outMax) {
  return (x - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
}

Color _fromHex(int hexString, double opacity) {
  final buffer = StringBuffer();
  int opacityMapped = _map(opacity, 0, 1, 0, 255).toInt();
  String opacityHex = opacityMapped.toRadixString(16);
  debugPrint("Opacity Hex: $opacityHex");
  if (hexString.toString().length == 6 || hexString.toString().length == 7) buffer.write(opacityHex);
  buffer.write(hexString.toString().replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

final Map<int, Color> color = {
  50: _fromHex(themeColor, 0.1),
  100: _fromHex(themeColor, 0.2),
  200: _fromHex(themeColor, 0.3),
  300: _fromHex(themeColor, 0.4),
  400: _fromHex(themeColor, 0.5),
  500: _fromHex(themeColor, 0.6),
  600: _fromHex(themeColor, 0.7),
  700: _fromHex(themeColor, 0.8),
  800: _fromHex(themeColor, 0.9),
  900: _fromHex(themeColor, 1.0),
};
class TBAThemeInfo {
  static MaterialColor getMaterialColor() {
    return new MaterialColor(themeColorPrimary, color);
  }
  static ThemeData getTheme() {
    return new ThemeData(
      brightness: Brightness.light,

      primaryColor: getMaterialColor(),
      accentColor: getMaterialColor(),

      fontFamily: "Roboto"
    );
  }
}