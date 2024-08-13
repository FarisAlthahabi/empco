// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:empco/Core/Resources/Constants/Font_Weights.dart';
import 'package:empco/Core/Resources/Constants/Texts.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:flutter/material.dart';

class InfoTextsWidget extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final int index;
  const InfoTextsWidget({
    super.key,
    required this.index,
    required this.screenWidth, required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 105.92,
          height: 24.52,
          color: AppColors.white,
          child: Center(
            child: Text(
              infoText1[index],
              style: TextStyle(
                  color: AppColors.roleColors[index],
                  fontSize: 12.38,
                  fontWeight: weightlevel7),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          width: 0.81 * screenWidth,
          child: Text(
            infoText2[index],
            style: TextStyle(
                color: AppColors.black,
                fontSize: 0.025 * screenHeight,
                fontWeight: weightlevel8),
            textAlign: TextAlign.center,
          ),
        ),
        // Text(
        //   infoText3[index],
        //   style: TextStyle(color: black, fontSize: 12, fontWeight: weightlevel8),
        //   textAlign: TextAlign.center,
        // ),
      ],
    );
  }
}
