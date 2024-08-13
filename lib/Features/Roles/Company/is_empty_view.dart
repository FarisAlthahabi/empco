import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Resources/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key,
  required this.textt});
  final String textt;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(isEmptyImage)),
          SizedBox(
            height: 20,
          ),
          Text(
            textt,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: black, fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 250,
          )
        ],
      ),
    );
  }
}
