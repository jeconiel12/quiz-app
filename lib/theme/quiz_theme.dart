import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'quiz_color.dart';

class QuizTheme {
  const QuizTheme._();

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: QuizColor.darkBlue,
    appBarTheme: AppBarTheme(
      backgroundColor: QuizColor.darkBlue,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      titleTextStyle: GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: QuizColor.lightBlue,
        padding: const EdgeInsets.all(16),
        shape: const StadiumBorder(),
        textStyle: GoogleFonts.nunito(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        side: const BorderSide(
          color: QuizColor.lightBlue,
          width: 2,
        ),
        shape: const StadiumBorder(),
        foregroundColor: QuizColor.lightBlue,
        textStyle: GoogleFonts.nunito(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    ),
    textTheme: GoogleFonts.nunitoTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
  );
}
