import 'package:flutter/material.dart';

double _map(var x, var inMin, var inMax, var outMin, var outMax) {
  return (x - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
}

Color fromHex(int hexString, double opacity) {
  final buffer = StringBuffer();
  int opacityMapped = _map(opacity, 0, 1, 0, 255).toInt();
  String opacityHex = opacityMapped.toRadixString(16);
  debugPrint("Opacity Hex: $opacityHex");
  if (hexString.toString().length == 6 || hexString.toString().length == 7) buffer.write(opacityHex);
  buffer.write(hexString.toString().replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
