import 'package:empco/Core/Theme/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class IconWithText extends StatelessWidget {
  final String icon;
  final String text;
  final double textSize;
  final double? iconSize;
  final Color? iconColor;
  const IconWithText({
    super.key,
    required this.icon,
    required this.text,
    required this.textSize,
    this.iconSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon,
            width: iconSize ?? 25,
            // ignore: deprecated_member_use
            color: AppColors.black),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: textSize,
            ),
          ),
        )
      ],
    );
  }
}
