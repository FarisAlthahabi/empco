import 'package:flutter/material.dart';
import 'package:empco/Core/Resources/Constants/Colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class IconWithText extends StatelessWidget {
  final String icon;
  final String text;
  final double sizetext;
  final double sizeicon;
  final String? colortext;
  final Color? coloricon;
  const IconWithText(
      {super.key,
      required this.icon,
      required this.text,
      required this.sizetext,
      required this.sizeicon,
      this.coloricon,
      this.colortext});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: sizeicon,
          color: coloricon
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: black, fontWeight: FontWeight.bold, fontSize: sizetext),
          ),
        )
      ],
    );
  }
}
