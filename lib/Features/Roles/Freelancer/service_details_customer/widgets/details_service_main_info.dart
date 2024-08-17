import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Resources/Constants/texts.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceDetailsMainInfoCustomer extends StatelessWidget {
  ServiceDetailsMainInfoCustomer({
    super.key,
    required this.screenWidth,
    this.onApplyTap,
    this.onMessageTap,
    this.onEdit,
    this.onDelete,
    this.onAddToFavorite,
  });

  final List<String> listIcons = [salaryIcon, timeIcon];
  final double screenWidth;
  final VoidCallback? onApplyTap;
  final VoidCallback? onMessageTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onAddToFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9 * screenWidth,
      height: 225,
      decoration: BoxDecoration(
          //  color: Colors.amber,
          borderRadius: BorderRadius.circular(11.42)),
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(serviceDetailsImage), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(11.42),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 2),
                spreadRadius: 0,
                blurRadius: 2,
                color: Color.fromRGBO(0, 0, 0, 0.25))
          ],
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: SizedBox(
                width: 300,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Video edit',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w700),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Colors.black),
                              child: const CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(backgroungProfile),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Mohammad Mamdouh',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: SizedBox(
                width: 230,
                height: 100,
                child: ListView.separated(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            listIcons[index],
                            width: 20,
                            // ignore: deprecated_member_use
                            color: const Color(0xffECE3E3),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color.fromRGBO(236, 227, 227, 1),
                                      fontSize: 9.35,
                                      fontWeight: FontWeight.w700),
                                ),
                                text: serviceDetailsTitle[index],
                                children: const [
                                  TextSpan(
                                      text: ':',
                                      style: TextStyle(fontSize: 9.35)),
                                ]),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            serviceDetailsData[index],
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 9.35,
                                  fontWeight: FontWeight.w700),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 7,
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MainActionButton(
                  width: 80,
                  height: 23,
                  text: 'Message',
                  blurRadius: 4,
                  yAxisOffset: 4,
                  shadowColor: AppColors.boxShadowColor2,
                  fontSize: 8.73,
                  buttonColor: AppColors.white,
                  textColor: AppColors.black,
                  onTap: onMessageTap,
                ),
                const SizedBox(
                  width: 10,
                ),
                MainActionButton(
                    width: 80,
                    height: 23,
                    text: 'Order',
                    blurRadius: 4,
                    yAxisOffset: 4,
                    shadowColor: AppColors.boxShadowColor2,
                    fontSize: 8.73,
                    icon: orderIcon,
                    onTap: onApplyTap),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
