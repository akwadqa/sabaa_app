// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// import '../color_manager/app_colors.dart';

// part 'app_theme.g.dart';

// abstract class AppTheme {
//   // Define shared styles to avoid repetition
//   static const TextStyle _baseTextStyle = TextStyle(
//     color: AppColors.black900,
//     fontFamily: "Rubic",
//     fontWeight: FontWeight.w700,
//   );

//   static const EdgeInsets _buttonPadding = EdgeInsets.all(16);

//   static OutlineInputBorder _outlineBorder(Color borderColor) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8),
//       borderSide: BorderSide(color: borderColor),
//     );
//   }

//   static ThemeData lightTheme() {
//     return ThemeData(
//       colorScheme:
//           ColorScheme.fromSwatch(primarySwatch: AppColors.primarySwatch),
//       // fontFamily: FontFamily.tajawal,
//       fontFamily: "Rubic",
//       // textTheme: textTheme,
//       // textTheme: GoogleFonts.interTextTheme(textTheme),
//       // textTheme: TextTheme(
//       //   displayLarge: _baseTextStyle.copyWith(fontSize: 24),
//       //   displayMedium: _baseTextStyle.copyWith(fontSize: 20),
//       //   displaySmall: _baseTextStyle.copyWith(fontSize: 16),
//       //   bodyLarge: _baseTextStyle.copyWith(fontSize: 14),
//       //   bodyMedium: _baseTextStyle.copyWith(fontSize: 12),
//       // ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           textStyle: _baseTextStyle.copyWith(fontSize: 22),
//           elevation: 0,
//           backgroundColor: AppColors.primary,
//           foregroundColor: Colors.white,
//           padding: _buttonPadding,
//         ),
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         enabledBorder: _outlineBorder(AppColors.lightGray02),
//         border: _outlineBorder(AppColors.lightGray02),
//         labelStyle: _baseTextStyle.copyWith(
//           color: AppColors.black900,
//           fontSize: 16,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//       textButtonTheme: TextButtonThemeData(
//         style: TextButton.styleFrom(
//           foregroundColor: AppColors.black900,
//           textStyle: _baseTextStyle.copyWith(fontSize: 18),
//         ),
//       ),
//       scaffoldBackgroundColor: Colors.white,
//     );
//   }
// }

// @Riverpod(keepAlive: true)
// ThemeData appTheme(Ref ref) {
//   return AppTheme.lightTheme();
// }
