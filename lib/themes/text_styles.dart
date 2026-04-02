import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final title = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: 1.2,
  );
  // igual para subtitle y button...

  static const subtitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const button = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
