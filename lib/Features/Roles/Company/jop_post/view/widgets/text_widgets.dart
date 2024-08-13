import 'package:empco/Core/Resources/Constants/font_weights.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 20,
          fontWeight: weightlevel7,
          height: 1.23,
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          color: Color(0xFF6F6F6F),
          fontSize: 9.5,
          fontWeight: weightlevel4,
          height: 1.14,
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}

class JobPostOptionTitle extends StatelessWidget {
  const JobPostOptionTitle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 9.5,
          fontWeight: weightlevel7,
          height: 1.14,
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}
