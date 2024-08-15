import 'package:empco/Core/Resources/Constants/Font_Weights.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceMainInfoCustomer extends StatelessWidget {
  const ServiceMainInfoCustomer({
    super.key,
    required this.screenWidth,
    required this.onExpandJopTap,
    required this.onFavoriteTap,
    required this.onMessageTap,
    required this.onOrderTap,
    required this.job,
  });

  final double screenWidth;
  final VoidCallback onExpandJopTap;
  final VoidCallback onFavoriteTap;
  final VoidCallback onMessageTap;
  final VoidCallback onOrderTap;
  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: 0.90 * screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(colors: [
              Color(0xFF202840),
              Color(0xFF58308B),
            ]),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 0.83 * screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          job.title,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: weightlevel7,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      InkWell(
                        onTap: onExpandJopTap,
                        child: SvgPicture.asset(
                          width: 20,
                          // ignore: deprecated_member_use
                          color: AppColors.white,
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
                  width: 0.73 * screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            SvgPicture.asset(
                              personServiceIcon,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              job.title,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: AppColors.white,
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
                            // ignore: deprecated_member_use
                            color: AppColors.white,
                            width: 20,
                            'lib/Core/Resources/assets/SVG/favorite-list.svg',
                            semanticsLabel: 'My SVG Image',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: 0.73 * screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            // const Icon(
                            //   Icons.location_on,
                            //   size: 15,
                            //   color: AppColors.white,
                            // ),
                            // const SizedBox(
                            //   width: 5,
                            // ),
                            // Text(
                            //   job.location,
                            //   style: GoogleFonts.poppins(
                            //     textStyle: const TextStyle(
                            //         color: AppColors.white,
                            //         fontSize: 10,
                            //         fontWeight: weightlevel7),
                            //   ),
                            //   textAlign: TextAlign.center,
                            // ),
                            const SizedBox(
                              width: 8,
                            ),
                            SvgPicture.asset(
                              width: 15,
                              // ignore: deprecated_member_use
                              color: AppColors.white,
                              'lib/Core/Resources/assets/SVG/salary.svg',
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              job.salary.toString(),
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: AppColors.white,
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
                                // ignore: deprecated_member_use
                                color: AppColors.white,
                                width: 20,
                                'lib/Core/Resources/assets/SVG/chat.svg')),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: 0.73 * screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            SvgPicture.asset(
                              // ignore: deprecated_member_use
                              color: AppColors.white,
                              timeIcon,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              job.location,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 10,
                                      fontWeight: weightlevel7)),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            // Container(
                            //   padding: const EdgeInsets.all(5),
                            //   decoration: BoxDecoration(
                            //       color: AppColors.white,
                            //       borderRadius: BorderRadius.circular(5)),
                            //   child: Text(
                            //     job.jobType,
                            //     style: GoogleFonts.poppins(
                            //       textStyle: const TextStyle(
                            //         color: AppColors.white,
                            //         fontSize: 10,
                            //         fontWeight: weightlevel7,
                            //       ),
                            //     ),
                            //     textAlign: TextAlign.center,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        // Apply Button
                        padding: const EdgeInsets.only(right: 5),
                        child: MainActionButton(
                            icon: const Icon(
                              Icons.add_shopping_cart,
                              size: 14,
                            ),
                            textColor: AppColors.black,
                            buttonColor: AppColors.white,
                            width: 65.85,
                            height: 25.02,
                            text: 'Order',
                            blurRadius: 1.36,
                            yAxisOffset: 1.36,
                            shadowColor: AppColors.boxShadowColor2,
                            fontSize: 8.81,
                            onTap: onOrderTap),
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
