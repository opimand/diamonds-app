import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static const Color primaryColor = Color(0xFF3A2513);
  static const Color secondaryColor = Color(0xFFF5F0E9);
  static const Color iconsColor = Color(0xFFD2AB8B);
  static const Color buttonsColor = Color(0xFF57371C);
  static const Color buttonsActiveColor = Color(0xFFF4EAE2);
  static const Color textFieldHint = Color(0xFFBFBFBF);

  static ThemeData theme(BuildContext context) {
    return Theme.of(context).copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: AppTheme.primaryColor,
          ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.questrial(
          fontSize: 49,
          fontWeight: FontWeight.w400,
          color: primaryColor,
        ),
        titleLarge: GoogleFonts.questrial(fontSize: 30, color: primaryColor),
        bodyMedium: GoogleFonts.questrial(fontSize: 16, color: primaryColor),
        displaySmall: GoogleFonts.questrial(fontSize: 15, color: buttonsColor),
      ),
    );
  }
}
