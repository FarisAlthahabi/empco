import 'package:empco/Core/Theme/components/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class JobDescriptionText extends StatelessWidget {
  final FontWeight fontWeight;
  final String text;
  const JobDescriptionText(
      {super.key, required this.fontWeight, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: AppColors.black, fontSize: 8.94, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
