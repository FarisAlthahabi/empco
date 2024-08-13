import 'package:empco/Core/Resources/Constants/colors.dart';
import 'package:empco/Features/Roles/Company/jop_post/view/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobPostOptionWidget extends StatelessWidget {
  const JobPostOptionWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 25),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            border: Border.all(width: 0.55, color: const Color(0XFF1B3A68)),
            borderRadius: BorderRadius.circular(3)),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: black,
            ),
            SizedBox(
              width: 5,
            ),
            JobPostOptionTitle(
              text: text,
            ),
          ],
        ),
      ),
    );
  }
}
