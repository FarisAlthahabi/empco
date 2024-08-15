import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Features/Roles/Company/jop_post/view/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class JobPostOptionWidgetItemModel {
  String get displayName;

  String get icon;
}

class JobPostOptionWidget<T extends JobPostOptionWidgetItemModel> extends StatelessWidget {
  const JobPostOptionWidget({
    super.key,
    required this.model,
    required this.onTap,
  });

  final T model;
  final ValueSetter<T> onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(model),
      child: Container(
        constraints: const BoxConstraints(minHeight: 25),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            border: Border.all(width: 0.55, color: const Color(0XFF1B3A68)),
            borderRadius: BorderRadius.circular(3)),
        child: Row(
          children: [
            SvgPicture.asset(
              model.icon,
              // ignore: deprecated_member_use
              color: AppColors.black,
            ),
            const SizedBox(
              width: 5,
            ),
            JobPostOptionTitle(
              text: model.displayName,
            ),
          ],
        ),
      ),
    );
  }
}
