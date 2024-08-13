import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Resources/Constants/font_weights.dart';
import 'package:empco/Core/Resources/Constants/shadows.dart';
import 'package:empco/Core/Resources/Constants/text_styles.dart';
import 'package:empco/Core/Resources/Constants/texts.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/jop_post_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({
    super.key,
    required this.onTypeSelected,
    required this.onWorkNatureSelected,
    required this.onLocationChanged,
    required this.onLocationSubmitted,
    required this.locationFocusNode,
    required this.onMinimumSalaryChanged,
    required this.onMinimumSalarySubmitted,
    required this.minimumSalaryFocusNode,
    required this.onCancelTap,
    required this.onApplyFiltersTap,
  });

  final VoidCallback onTypeSelected;
  final VoidCallback onWorkNatureSelected;
  final ValueSetter<String> onLocationChanged;
  final ValueSetter<String> onLocationSubmitted;
  final FocusNode locationFocusNode;
  final ValueSetter<String> onMinimumSalaryChanged;
  final ValueSetter<String> onMinimumSalarySubmitted;
  final FocusNode minimumSalaryFocusNode;
  final VoidCallback onCancelTap;
  final VoidCallback onApplyFiltersTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(
            child: Divider(
              color: AppColors.black,
              thickness: 2,
              endIndent: 130,
              indent: 130,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Row(
            children: [
              SvgPicture.asset(filterSearchIcon),
              const SizedBox(
                width: 10,
              ),
              Text(
                filterText,
                style: TextStyles.labelLarge,
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            typeText,
            style: TextStyles.labelLarge
                .copyWith(fontSize: 15, fontWeight: weightlevel6),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              MainActionButton(
                text: fullTimeText,
                textStyle: TextStyles.bodyLarge,
                width: 85,
                height: 30,
                buttonColor: AppColors.darkBlue,
              ),
              const SizedBox(width: 20),
              MainActionButton(
                text: partTimeText,
                textStyle: TextStyles.bodyLarge.copyWith(color: AppColors.black),
                width: 85,
                height: 30,
                buttonColor: AppColors.whiteShade,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            workNatureText,
            style: TextStyles.labelLarge
                .copyWith(fontSize: 15, fontWeight: weightlevel6),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              MainActionButton(
                text: onSiteText,
                textStyle: TextStyles.bodyLarge,
                width: 85,
                height: 30,
                buttonColor: AppColors.darkBlue,
              ),
              const SizedBox(width: 20),
              MainActionButton(
                text: remoteText,
                textStyle: TextStyles.bodyLarge.copyWith(color: AppColors.black),
                width: 85,
                height: 30,
                buttonColor: AppColors.whiteShade,
              ),
              const SizedBox(width: 20),
              MainActionButton(
                text: hybridText,
                textStyle: TextStyles.bodyLarge.copyWith(color: AppColors.black),
                width: 85,
                height: 30,
                buttonColor: AppColors.whiteShade,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            locationText,
            style: TextStyles.labelLarge
                .copyWith(fontSize: 15, fontWeight: weightlevel6),
          ),
          const SizedBox(
            height: 10,
          ),
          MainTextField(
            focusNode: locationFocusNode,
            onChanged: onLocationChanged,
            onSubmitted: onLocationSubmitted,
            hintText: syriaText,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            minimumSalaryText,
            style: TextStyles.labelLarge
                .copyWith(fontSize: 15, fontWeight: weightlevel6),
          ),
          const SizedBox(
            height: 10,
          ),
          MainTextField(
            focusNode: minimumSalaryFocusNode,
            onChanged: onMinimumSalaryChanged,
            onSubmitted: onMinimumSalarySubmitted,
            hintText: minimumSalaryExampleText,
          ),
          const SizedBox(
            height: 40,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MainActionButton(
                  onTap: onCancelTap,
                  buttonColor: AppColors.whiteShade,
                  width: 100,
                  height: 32,
                  text: cancelText,
                  blurRadius: 3.5,
                  yAxisOffset: 3.5,
                  shadow: AppShadows.boxShadow1,
                  textStyle: TextStyles.bodyLarge.copyWith(
                    color: AppColors.black,
                    fontWeight: weightlevel7,
                  ),
                ),
                const SizedBox(width: 10),
                MainActionButton(
                  onTap: onApplyFiltersTap,
                  width: 100,
                  height: 32,
                  text: applyFiltersText,
                  blurRadius: 3.5,
                  yAxisOffset: 3.5,
                  shadow: AppShadows.boxShadow1,
                  textStyle: TextStyles.bodyLarge.copyWith(
                    color: AppColors.white,
                    fontWeight: weightlevel7,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
