import 'package:empco/Core/Theme/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:empco/Core/Resources/Constants/Font_Weights.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Features/Auth/View/Register/widgets/Texts.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalTextButton extends StatelessWidget {
  final String text1;
  final String? text2;
  final VoidCallback onTap;
  const GlobalTextButton({
    super.key,
    required this.text1,
    this.text2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
            style: const TextStyle(
                color: AppColors.blue, fontSize: 12, fontWeight: weightlevel8),
            text: text1,
            children: [
              if (text2 != null)
                TextSpan(
                    text: text2,
                    style: const TextStyle(
                        color: AppColors.bottomAuthPageTextColor2)),
            ]),
      ),
    );
  }
}

class ContinueWithGoogleBotton extends StatelessWidget {
  final VoidCallback onTap;
  const ContinueWithGoogleBotton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 233.05,
        height: 37.88,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(233.83),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              googleIcon,
            ),
            const Padding(
                padding: EdgeInsets.only(right: 20),
                child: ContinueWithGoogleText()),
          ],
        ),
      ),
    );
  }
}

class MainActionButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final double? blurRadius;
  final double? yAxisOffset;
  final Color? shadowColor;
  final double? fontSize;
  final Widget? icon;
  final Color? buttonColor;
  final Border? border;
  final Color? textColor;
  final VoidCallback? onTap;
  final double? borderRadius;
  final TextStyle? textStyle;
  final List<BoxShadow>? shadow;
  final String? SvgImage;

  const MainActionButton({
    this.SvgImage,
    super.key,
    required this.text,
    this.fontSize,
    this.border,
    this.icon,
    this.textColor,
    this.buttonColor,
    this.onTap,
    this.width,
    this.height,
    this.blurRadius,
    this.yAxisOffset,
    this.shadowColor,
    this.borderRadius,
    this.textStyle,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: buttonColor ?? AppColors.blue,
            borderRadius: BorderRadius.circular(borderRadius ?? 327.16),
            boxShadow: shadow ??
                [
                  BoxShadow(
                      offset: Offset(0, yAxisOffset ?? 0),
                      spreadRadius: 0,
                      blurRadius: blurRadius ?? 0,
                      color: shadowColor ?? AppColors.white)
                ]),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                style: textStyle ??
                    GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: textColor ?? AppColors.white,
                          fontSize: fontSize,
                          fontWeight: weightlevel7),
                    ),
                textAlign: TextAlign.center,
              ),
              // SvgPicture.asset(SvgImage),
              if (icon != null) icon!
            ],
          ),
        ),
      ),
    );
  }
}

class BackTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const BackTextButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 140,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.arrow_back),
            InkWell(
              onTap: onTap,
              child: Text(
                text,
                style: const TextStyle(
                    color: Color.fromRGBO(75, 72, 72, 1),
                    fontSize: 12,
                    fontWeight: weightlevel7),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
