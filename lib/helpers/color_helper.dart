import 'package:flutter/material.dart';

class ColorManager {


  static Color scaffoldColor = HexColor.fromHex("#FF7BE9");
  static Color iconColor = HexColor.fromHex("#817BF3");
  static Color primaryColor = HexColor.fromHex("#6B8AF2");
  static Color headerColor = HexColor.fromHex("#C967E9");
  static Color DividerColor = HexColor.fromHex("#E3E3E3");
  static Color scaffoldColor2 = HexColor.fromHex("#F1F3FB");

  static Color greyBorder = HexColor.fromHex("#D8DFF2");
  static Color lightGrey = HexColor.fromHex("#F7F7F7");
  static Color lightGreyBtm = HexColor.fromHex("#707070");
  static Color grayContainer = HexColor.fromHex("#A2A2A2");

  static Color morelightGrey = HexColor.fromHex("#D3D3D3");
  static Color grey1 = HexColor.fromHex("#D4D1D1");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color offWhite = HexColor.fromHex("#FBFBFB");
  static Color facebookBlue = HexColor.fromHex("#2D609B");
  static Color twitterBlue = HexColor.fromHex("#00C3F3");

  static Color whatsUpGreen = HexColor.fromHex("#80CE13");
  static Color green = HexColor.fromHex("#1CD163");
  static Color black = HexColor.fromHex("#000000");

  static Color error = HexColor.fromHex("#e61f34"); // red color

}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}