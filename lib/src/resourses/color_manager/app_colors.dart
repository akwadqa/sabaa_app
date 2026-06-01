import 'dart:math';

import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xFF005AAB);
  static const Color secondPrimary = Color(0xFF135BEC);
  static const Color thirdPrimary = Color(0xFFF6EAE5);
  static const Color primaryOpacity = Color(0xFFFFECDC);
  static const Color primaryBg = Color(0xFFBED3FF);
  static const Color background = Color(0xFFF6F6F8);

  static const Color chipBorder = Color(0xFFC0BAB9);

  static const Color primaryBorder = Color(0xFFE4D7D3);

  // static const Color thirdPrimary = Color(0xFFA981BB);
  static const Color purbleOpacity = Color(0xFFA0A3E3);

  static const Color grey97 = Color(0xFF979797);
  static const accent     = Color(0xFFF37B24);
  static const surface    = Colors.white;
  static const textPrimary    = Color(0xFF0F172A);
  static const textSecondary  = Color(0xFF64748B);
  static const textHeading    = Color(0xFF111418);
  static const metricPurple   = Color(0xFFCBC8FF);
  static const metricPink     = Color(0xFFFFC8CD);
  static const dateBadge      = Color(0xFFE8F3FE);
  static const navBorder      = Color(0xFFE2E8F0);
  static const cardShadow     = Color(0x19005AAB);


static const Color metricGreen = Color(0xFFD1FAE5);
static const Color metricGreenIcon = Color(0xFF15803D);

static const Color metricOrange = Color(0xFFFFEDD5);
static const Color metricOrangeIcon = Color(0xFFEA580C);

// static const Color metricPink = Color(0xFFFCE7F3);
static const Color metricPinkIcon = Color(0xFFDB2777);

// static const Color metricPurple = Color(0xFFEDE9FE);
static const Color metricPurpleIcon = Color(0xFF7C3AED);


  static const Color successGreen = Color(0xFF00721D);
  static const Color errorRed = Color(0xFFBB0101);
  static const Color warnYellow = Color(0xFF7A5800);
  static const Color filterBg = Color(0xFFF2F4F7);
  static const Color paidBg = Color(0xFFCCEACC);
  static const Color paidText = Color(0xFF4E7B4E);
  static const Color unpaidBg = Color(0xFFFFDAD6);
  static const Color unpaidText = Color(0xFF93000A);
  static const Color partlyPaidBg = Color(0xFFD1E5F7);
  static const Color partlyPaidText = Color(0xFF005B93);
  static const Color returnBg = Color(0xFFFFDCC3);
  static const Color returnText = Color(0xFFCB671E);

  // static const Color background = Color(0xffFAFAF9);

  static const Color fieldBackground = Color(0xFFEFF0F6);
  static const Color dividerColor = Color(0xFFe9e9e9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color cardWhite = Color(0xFFF5F5F5);
  static const Color shadow = Color(0x0C000000);
  static const Color darkShadow = Color(0x19000000);
  static const Color dark = Color(0xFF201C11);
  static const Color darkMedGrey = Color(0x1AA0A0A0);
  static const Color disabledButton = Color(0xFFA0A0A0);
  static const Color borderGrey = Color(0xFFe8e8e8);

  static const Color stockImageBg = Color(0xFFF3F4F6);

  static const Color stockHighBg = Color(0xFFDCFCE7);
  static const Color stockHighText = Color(0xFF15803D);
  static const Color stockMedBg = Color(0xFFFEF9C3);
  static const Color stockMedText = Color(0xFFA16207);
  static const Color stockLowBg = Color(0xFFFEE2E2);
  static const Color stockLowText = Color(0xFFB91C1C);

  // ── Customers feature — visit status badges ───────────────────

  static const Color statusOpenText = Color(0xFF9333EA);
  static const Color statusPendingBg = Color(0xFFFFEDD5);
  static const Color statusPendingText = Color(0xFFC2410C);
  static const Color statusVisitedAmount = Color(0xFF94A3B8);

  // ── Customers feature — avatar palettes ───────────────────────
  static const Color avatarOrangeText = Color(0xFFEA580C);
  static const Color avatarBlueBg = Color(0xFFDBEAFE);
  static const Color avatarBlueText = Color(0xFF2563EB);
  static const Color avatarPurpleBg = Color(0xFFF3E8FF);
  static const Color imageBorderBlue = Color(0x33137FEC);

  // ── Shared UI ─────────────────────────────────────────────────
  static const Color chevronBg         = Color(0xFFF1F5F9);
  static const Color secondCard         = Color(0xFFF0F2F4);
  static const Color blueGrey         = Color(0xFF617589);
  // ── Slider / Glass Button ───────────────
  static const Color sliderBackground = Color(0xFFE6EEF8);
  static const Color sliderBase = Color(0xFFDCE7F5);
  static const Color sliderHighlight = Color(0xFF0056B3);

  // ── Glass Border ────────────────────────
  static const Color glassBorder = Color(0xFFB6C7E3);

  // ── Gradient (Thumb / Active) ───────────
  static const List<Color> primaryGradient = [
    primary,
    secondPrimary,
    white,

  ];
        // AppColors.avatarPurpleBg,
        //                     AppColors.secondPrimary,
        //                     AppColors.avatarPurpleBg,

  // ── Optional: Soft Shadow Color ─────────
  static const Color primaryShadow = Color(0x330056B3);



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

  static const Color darkRed = Color(0xFFBC0000);
  static const Color red = Color(0xFFEF4444);
  static const Color lightRed = Color(0xFFEF4444);

  static const Color bodyColor = Color(0xFF576B74);
  static const Color black = Color(0xFF000000);
  static const Color black900 = Color(0xFF484848);
  static const Color lightGray = Color(0xFFE5E5E5);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey = Color(0xFF6B7280);
  static const Color textGrey = Color(0xFF9CA3AF);

  static const Color gray03 = Color(0xFFEdeded);
  static const Color gray04 = Color(0xFF424752);
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
  static const Color sheetBarrier = Color(0xFFF7F9FC);
  static const Color lightBlueBackground = Color(
      0xFFF2E1E3); // Matches the info message overlay in Figma if not defined
  static const Color infoIconBg = Color(0xFFF2E1E3);
  static const Color infoText = Color(0xFF727784);
  static const Color methodSelectorBorder = Color(0xFFDBE0E6);
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
