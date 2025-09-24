import 'package:empco/Core/Resources/Constants/font_weights.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 abstract class TextStyles{
 static TextStyle labelLarge = TextStyle(
  fontFamily: GoogleFonts.poppins().fontFamily,
  fontWeight: weightlevel7,
  fontSize: 16,
  height: 1.23,
  color: AppColors.black
);

static TextStyle bodyLarge = TextStyle(
  fontFamily: GoogleFonts.inter().fontFamily,
  fontWeight: weightlevel5,
  fontSize: 11,
  height: 1.15,
  color: AppColors.white
);
}

