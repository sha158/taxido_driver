import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme customTextTheme = TextTheme(
  displayLarge: GoogleFonts.poppins(
    fontSize: 32,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  ),
  displayMedium: GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  ),
  bodyLarge: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  ),
  bodyMedium: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  ),
  // Add more text styles as needed
);
