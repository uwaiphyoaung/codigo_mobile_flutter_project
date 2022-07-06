import 'package:flutter/material.dart';

class AppColors {
  static Color get primaryColor => HexColor("#2194b1");

  static Color get backgroundColor => HexColor("#f7f7f5");

}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}