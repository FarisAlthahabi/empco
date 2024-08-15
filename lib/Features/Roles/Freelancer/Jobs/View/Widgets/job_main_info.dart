import 'package:empco/Core/Resources/Constants/Font_Weights.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class JobMainInfo extends StatelessWidget {
  const JobMainInfo({
    super.key,
    required this.screenWidth,
    required this.onExpandJopTap,
    required this.onFavoriteTap,
    required this.onMessageTap,
    required this.onApplyTap,
    required this.job,
  });

  final double screenWidth;
  final VoidCallback onExpandJopTap;
  final VoidCallback onFavoriteTap;
  final VoidCallback onMessageTap;
  final VoidCallback onApplyTap;
  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.favorite,
          size: 0.14 * screenWidth,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: 0.73 * screenWidth,
          decoration: BoxDecoration(
            color: const Color(0xFFF8F8F8),
            borderRadius: BorderRadius.circular(11.42),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 0.63 * screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          job.title,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color:AppColors. blue,
                              fontSize: 20,
                              fontWeight: weightlevel7,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        onTap: onExpandJopTap,
                        child: SvgPicture.asset(
                          'lib/Core/Resources/assets/SVG/expand.svg',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: 0.63 * screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 80,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            SvgPicture.asset(
                              'lib/Core/Resources/assets/SVG/company.svg',
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              job.title,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color.fromRGBO(15, 50, 91, 1),
                                    fontSize: 12,
                                    fontWeight: weightlevel7),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 28),
                        child: InkWell(
                          onTap: onFavoriteTap,
                          child: SvgPicture.asset(
                            'lib/Core/Resources/assets/SVG/favorite-list.svg',
                            semanticsLabel: 'My SVG Image',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: 0.63 * screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            const Icon(
                              Icons.location_on,
                              size: 15,
                              color: Color.fromRGBO(155, 155, 155, 1),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              job.location,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color:
                                        Color(0xFF373737),
                                    fontSize: 10,
                                    fontWeight: weightlevel7),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'lib/Core/Resources/assets/SVG/salary.svg',
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              job.salary.toString(),
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color:
                                        Color(0xFF373737),
                                    fontSize: 10,
                                    fontWeight: weightlevel7),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 27),
                        child: InkWell(
                          onTap: onMessageTap,
                          child: SvgPicture.asset(
                            'lib/Core/Resources/assets/SVG/chat.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: 0.63 * screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            SvgPicture.asset(
                              'lib/Core/Resources/assets/SVG/work-site.svg',
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              job.workNature.displayName,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color(0xFF373737),
                                      fontSize: 10,
                                      fontWeight: weightlevel7)),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: const Color(0x0F325B12),
                                borderRadius: BorderRadius.circular(5)
                                ),
                              child: Text(
                                job.jobType.displayName,
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Color(0xFF373737),
                                    fontSize: 10,
                                    fontWeight: weightlevel7,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        // Apply Button
                        padding: const EdgeInsets.only(right: 5),
                        child: MainActionButton(
                            width: 57.85,
                            height: 18.02,
                            text: 'Apply',
                            blurRadius: 1.36,
                            yAxisOffset: 1.36,
                            shadowColor: AppColors.boxShadowColor2,
                            fontSize: 6.81,
                            onTap: onApplyTap),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
