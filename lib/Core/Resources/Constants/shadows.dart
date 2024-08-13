import 'package:empco/Core/Theme/components/colors.dart';
import 'package:flutter/material.dart';

abstract class AppShadows{
 static const List<BoxShadow> boxShadow1 = [
  BoxShadow(
      blurRadius: 3.71,
      offset: Offset(0, 3.71),
      color: AppColors.boxShadowColor2,
      spreadRadius: 0)
];

static const List<BoxShadow> boxShadow2 = [
  BoxShadow(
      blurRadius: 4,
      offset: Offset(0, 4),
      color: AppColors.boxShadowColor1,
      spreadRadius: 0)
];
}