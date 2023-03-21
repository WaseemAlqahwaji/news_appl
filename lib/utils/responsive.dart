import 'package:flutter/material.dart';

class Responsive {
  static getHeight(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return screenHeight - statusBarHeight;
  }

  static getWidth(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth;
  }
}
