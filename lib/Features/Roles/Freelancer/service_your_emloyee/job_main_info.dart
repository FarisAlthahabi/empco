import 'package:empco/Core/Resources/Constants/Font_Weights.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Features/Roles/Freelancer/service_your_emloyee/model/service_model/service_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceMainInfoEmployee extends StatelessWidget {
  const ServiceMainInfoEmployee({
    super.key,
    required this.screenWidth,
    required this.onExpandJopTap,
    required this.onEditTap,
    required this.onDeleteTap,
    required this.onApplyTap,
    required this.serviceModel,
  });

  final double screenWidth;
  final VoidCallback onExpandJopTap;
  final VoidCallback onEditTap;
  final VoidCallback onDeleteTap;
  final VoidCallback onApplyTap;
  final ServiceModel serviceModel;

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
                          serviceModel.name,
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
                              serviceModel.description,
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
                            onTap: onEditTap,
                            child: const Icon(
                              Icons.edit,
                              color: AppColors.white,
                            )),
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
                              serviceModel.price.toString(),
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
                            onTap: onDeleteTap,
                            child: const Icon(
                              Icons.delete_outline_sharp,
                              color: AppColors.white,
                              size: 25,
                            )),
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
                              serviceModel.description,
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
                          
                          ],
                        ),
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
