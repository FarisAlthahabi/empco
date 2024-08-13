import 'package:empco/Core/Theme/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.color,
    this.width,
    this.height,
    this.size = 24,
  });

  final Color? color;
  final double? width;
  final double? height;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: SpinKitThreeBounce(
        size: size,
        color: color ?? AppColors.blue,
      ),
    );
  }
}