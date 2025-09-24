import 'package:empco/Core/Resources/Constants/shadows.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:empco/Core/Resources/Constants/font_weights.dart';
import 'package:empco/Core/Resources/Constants/Texts.dart';

class SelectRoleButton extends StatelessWidget {
  final double screenWidth;
  final VoidCallback onTap;
  final int index;
  const SelectRoleButton({
    super.key,
    required this.onTap,
    required this.index, required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 0.91 * screenWidth,
        // width: 323.21,
        height: 49.13,
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: AppColors.roleColors[index],
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(303.3),
            boxShadow: AppShadows.boxShadow1),
        child: Center(
          child: Text(
            roleSelected[index],
            style: const TextStyle(
                color: AppColors.black, fontSize: 19.73, fontWeight: weightlevel7),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
