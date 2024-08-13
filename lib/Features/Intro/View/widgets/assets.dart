// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/empcoIcon_and_empcoText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroPageAssets extends StatelessWidget {
  final double screenHeight;
  final int index;
  const IntroPageAssets({
    super.key,
    required this.index,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: EmpcoIconAndEmpcoText(
            width: 90,
            hight: 120,
            fontsize: 23.52,
            scale: 1.5,
            color: AppColors.blue,
          ),
        ),
        Center(
          child: SvgPicture.asset(
            introImage[index],
            height: index != 1 ? 0.35 * screenHeight : 0.31 * screenHeight ,
          ),
        ),
        Visibility(
          visible: index == 1 ? true : false,
          child: Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                fit: BoxFit.fill,
                iconIntro[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
