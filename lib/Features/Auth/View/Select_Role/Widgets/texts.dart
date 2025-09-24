import 'package:empco/Core/Resources/Constants/Font_Weights.dart';
import 'package:empco/Core/Resources/Constants/Texts.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:flutter/material.dart';

class SelectRoleTextWidget extends StatelessWidget {
  const SelectRoleTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      selectRole,
      style: TextStyle(color: AppColors.black, fontSize: 20, fontWeight: weightlevel8),
      textAlign: TextAlign.center,
    );
  }
}

