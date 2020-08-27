import 'package:flutter/material.dart';
import 'package:tba/constants.dart';

class DeviceInfo {
  static double getScreenWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static double getShortestSide(context) {
    return MediaQuery.of(context).size.shortestSide;
  }

  static bool isDesktopLike(context) {
    return (getShortestSide(context) > tabletBreakpoint);
  }
}