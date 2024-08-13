import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void empcoShowDialog(
  BuildContext context,
) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: SvgPicture.asset(warning),
            content: Text(
              'Are you sure you want to delete this job post?',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: AppColors.black,
                    fontSize: 13.68,
                    height: 1.2,
                    fontWeight: FontWeight.w700),
              ),
            ),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: [
              MainActionButton(
                text: 'Cancel',
                blurRadius:3.42 ,
                yAxisOffset: 3.42,
                borderRadius: 122,
                fontSize: 10.46,
                shadowColor: AppColors.boxShadowColor2,
                textColor: AppColors.black,
                buttonColor: const Color.fromRGBO(235, 235, 235, 1),
                 width: 76.89,
                onTap: (){
                  Navigator.pop(context);
                },
                ),
              MainActionButton(
                text: 'Delete',
                blurRadius:3.42 ,
                yAxisOffset: 3.42,
                borderRadius: 122,
                fontSize: 10.46,
                shadowColor: AppColors.boxShadowColor2,
                textColor: AppColors.white,
                buttonColor: const Color.fromRGBO(226, 91, 91, 1),
                 width: 76.89,
                onTap: (){
                  Navigator.pop(context);
                },
                ),
            ],
          ));
}
