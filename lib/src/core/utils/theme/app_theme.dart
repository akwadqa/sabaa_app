import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../resourses/color_manager/app_colors.dart';

part 'app_theme.g.dart';

abstract class AppTheme {
  // Define shared styles to avoid repetition
  static const TextStyle _baseTextStyle = TextStyle(
    color: AppColors.black900,
    fontFamily: "Rubik",
    fontWeight: FontWeight.w700,
  );

  static const EdgeInsets _buttonPadding = EdgeInsets.all(16);

  static OutlineInputBorder _outlineBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: borderColor),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      // colorScheme:
      //     ColorScheme.fromSwatch(primarySwatch: AppColors.primarySwatch),
      // fontFamily: FontFamily.tajawal,
      textTheme: GoogleFonts.rubikTextTheme(textTheme),

      // textTheme: TextTheme(
      //   displayLarge: _baseTextStyle.copyWith(fontSize: 24),
      //   displayMedium: _baseTextStyle.copyWith(fontSize: 20),
      //   displaySmall: _baseTextStyle.copyWith(fontSize: 16),
      //   bodyLarge: _baseTextStyle.copyWith(fontSize: 14),
      //   bodyMedium: _baseTextStyle.copyWith(fontSize: 12),
      // ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: _baseTextStyle.copyWith(fontSize: 22),
          elevation: 0,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: _buttonPadding,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: _outlineBorder(AppColors.lightGray02),
        focusedBorder: _outlineBorder(AppColors.primary),
        border: _outlineBorder(AppColors.lightGray02),
        labelStyle: _baseTextStyle.copyWith(
          color: AppColors.black900,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.black900,
          textStyle: _baseTextStyle.copyWith(fontSize: 18),
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}

@Riverpod(keepAlive: true)
ThemeData appTheme(Ref ref) {
  return AppTheme.lightTheme();
}

final textTheme = TextTheme(
  // Display
  displayLarge: TextStyle(
    fontSize: 57,
    height: 64 / 57,
    fontWeight: FontWeight.bold,
  ),
  displayMedium: TextStyle(
    fontSize: 45,
    height: 52 / 45,
    fontWeight: FontWeight.w400,
  ),
  displaySmall: TextStyle(
    fontSize: 36,
    height: 44 / 36,
    fontWeight: FontWeight.w400,
  ),

  // Headline
  headlineLarge: TextStyle(
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w400,
  ),
  headlineMedium: TextStyle(
    fontSize: 28,
    height: 36 / 28,
    fontWeight: FontWeight.w400,
  ),
  headlineSmall: TextStyle(
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w400,
  ),

  // Title
  titleLarge: TextStyle(
    fontSize: 22,
    height: 28 / 22,
    fontWeight: FontWeight.w600, // غالباً العناوين تكون Semibold
  ),
  titleMedium: TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w600,
  ),
  titleSmall: TextStyle(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w600,
  ),

  // Body
  bodyLarge: TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w400,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
  ),
  bodySmall: TextStyle(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w400,
  ),

  // Label
  labelLarge: TextStyle(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500, // Material 3 يستعمل W500 للـ labels
  ),
  labelMedium: TextStyle(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w500,
  ),
  labelSmall: TextStyle(
    fontSize: 11,
    height: 16 / 11,
    fontWeight: FontWeight.w500,
  ),
);
