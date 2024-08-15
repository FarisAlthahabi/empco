import 'package:empco/Core/Theme/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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

  const TextFormFieldToProfile({
    super.key,
    required this.height,
    required this.onChanged,
    required this.onSubmitted,
    required this.focusNode,
    this.textSize,
    this.title,
    this.icon,
    this.hintText,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    final title = this.title;
    final textSize = this.textSize;
    return Padding(
      padding: const EdgeInsets.only(left: 20 , right: 20),
      child: Column(
        children: [
          if(icon !=null && title !=null && textSize !=null)
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
          Expanded(
            child: SizedBox(
              height: height,
              child: TextFormField(
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
                    hintText: hintText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
