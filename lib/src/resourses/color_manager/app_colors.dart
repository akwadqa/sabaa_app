import 'dart:math';

import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xFF005AAB);
  static const Color secondPrimary = Color(0xFFF6EAE5);
  static const Color primaryOpacity = Color(0xFFFFECDC);
  static const Color background = Color(0xFFF5F5F5);
  
  static const Color chipBorder = Color(0xFFC0BAB9);

  static const Color primaryBorder = Color(0xFFE4D7D3);
  
  static const Color thirdPrimary = Color(0xFFA981BB);
  static const Color purbleOpacity = Color(0xFFA0A3E3);
  
  static const Color grey97 = Color(0xFF979797);

  // static const Color background = Color(0xffFAFAF9);

  
  static const Color fieldBackground = Color(0xFFEFF0F6);
  static const Color dividerColor = Color(0xFFe9e9e9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color cardWhite = Color(0xFFF5F5F5);
  static const Color redOpacity = Color(0xFFFFF6E5);
  static const Color orangeOpacity = Color(0xFFFFF6E5);
  static const Color greenOpacity = Color(0xFFE9F7EF);
  static const Color shadow = Color(0x3F3B41C5);
  static const Color dark = Color(0xFF201C11);
  static const Color borderGrey = Color(0xFFe8e8e8);
  static const Color borderGrey2 = Color(0xFFe2e2e2);
  static const Color switchBackground = Color(0xFFF3F4F6);

  static const MaterialColor primarySwatch = MaterialColor(
    0xFFFD4057, // Base color
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFD4057),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );
  static const Color gray = Color(0xFFAAAAAA);

  static const Color rose = Color(0xFFF8D5CC);
  static const Color darkRed = Color(0xFFBC0000);
  static const Color textDart = Color(0xFF191210);
  static const Color red = Color(0xFFBD2C06);
  static const Color lightRedBackground = Color(0xFFF6EAE5);

  static const Color bodyColor = Color(0xFF576B74);
  static const Color black = Color(0xFF000000);
  static const Color black900 = Color(0xFF484848);
  static const Color lightGray = Color(0xFFE5E5E5);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey = Color(0xFFEdeded);
  static const Color green = Color(0xFF69A94B);
  static const Color mediumGray = Color(0xFFD7D7D7);
  static const Color grayBorder = Color(0xFFCCCCCC);
  static const Color grayHint = Color(0xFF878787);
  static const Color darkGray = Color(0xFF727272);
  static const Color lightGray01 = Color(0xFFF1F1F1);
  static const Color lightGray02 = Color(0xFFD9D9D9);
  static const Color gray02 = Color(0xFF888888);
  static const Color black800 = Color(0xFF444444);
  static const Color stoneGray = Color(0xFF949494);
  static const Color offWhite = Color(0xFFF6F6F6);
  static const Color newRed = Color(0xFFD75966);
  static const Color lightPeach = Color(0xFFFFF5F1);
  static const Color dimGray = Color(0xFF555555);
  static const Color grayishCharcoal = Color(0xFF595959);

}

class AvatarColors {
  static final List<Color> _colors = [
    const Color(0xFF3F51B5), // Blue
    const Color(0xFF6D4C41), // Brown
    const Color(0xFF7CB342), // Green
    const Color(0xFF8E24AA), // Purple
    const Color(0xFF039BE5), // Light Blue
    const Color(0xFF5D4037), // Dark Brown
    const Color(0xFF455A64), // Blue Grey
  ];

  static Color random() {
    final random = Random();
    return _colors[random.nextInt(_colors.length)];
  }
}
