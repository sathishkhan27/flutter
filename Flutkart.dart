import 'package:flutter/material.dart';
class Flutkart {
  static const String name = "TTS";
  static const String namebody = "Get cheapest goods for your daily use";
  static const String store = "Online Store\n For Everyone";
  static const String wt1 = "WELCOME";
  static const String wc1 =
      "Flutkart is Premium Online Shopping\n Platform for Everyone";
  static const String wt2 = "DISCOVER PRODUCT";
  static const String wc2 =
      "Search Latest and Featured Product\n With Best Price";
  static const String wt3 = "ADD TO CART";
  static const String wc3 =
      "Add to Cart All Product You need\n And Checkout the Order";
  static const String wt4 = "VERIFY AND RECEIVE";
  static const String wc4 =
      "We Will Verify Your Order\n Pay the bill and Receive the Product";
  static const String skip = "SKIP";
  static const String next = "NEXT";
  static const String gotIt = "GOT IT";
  static  Color color1 = HexColor("800000");
}

class HexColor extends Color{
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

}


