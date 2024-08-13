
import 'package:empco/Core/Resources/Constants/Font_Weights.dart';
import 'package:empco/Core/Resources/Constants/Texts.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:flutter/material.dart';

class OrText extends StatelessWidget {
  const OrText({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Text(
      orText,
      style:  TextStyle(
          color: AppColors.black,
          fontSize: 14.06,
          fontWeight: weightlevel8),
      textAlign: TextAlign.center,
    );
  }
}

class TitleOfPage extends StatelessWidget {
  final String text;
  const TitleOfPage({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Color.fromRGBO(25, 69, 120, 1),
          fontSize: 20,
          fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
    );
  }
}