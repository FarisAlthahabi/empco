// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:empco/Core/Theme/components/colors.dart';

class TextFormFieldToProfile extends StatelessWidget {
  final String? hintText;
  final double height;
  final ValueSetter<String> onChanged;
  final ValueSetter<String> onSubmitted;
  final FocusNode focusNode;
  final String? title;
  final String? icon;
  final double? textSize;
  final double? iconSize;
  final String? prefixIcon;
  final double? paddingHorizontal;
  final Color? prefixIconColor;
  final String? initialValue;

  const TextFormFieldToProfile({
    super.key,
    this.hintText,
    required this.height,
    required this.onChanged,
    required this.onSubmitted,
    required this.focusNode,
    this.title,
    this.icon,
    this.textSize,
    this.iconSize,
    this.prefixIcon,
    this.paddingHorizontal,
    this.prefixIconColor,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    final title = this.title;
    final textSize = this.textSize;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal ?? 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null && title != null && textSize != null)
            Row(
              children: [
                SvgPicture.asset(icon,
                    width: iconSize ?? 25,
                    // ignore: deprecated_member_use
                    color: AppColors.black),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: textSize,
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            height: height,
            child: TextFormField(
              initialValue: initialValue,
              focusNode: focusNode,
              onFieldSubmitted: onSubmitted,
              onChanged: onChanged,
              textAlign: TextAlign.start,
              maxLines: null,
              expands: true,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Color(0xff898181),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Color(0xFF152B4B),
                    ),
                  ),
                  hintText: hintText,
                  prefixIcon: prefixIcon != null
                      ? SvgPicture.asset(
                          prefixIcon!,
                          // ignore: deprecated_member_use
                          color: prefixIconColor,
                        )
                      : null,
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 40,
                    minHeight: 20,
                    maxWidth: 40,
                    maxHeight: 20,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
