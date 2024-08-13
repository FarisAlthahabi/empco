import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Resources/Constants/colors.dart';
import 'package:empco/Core/Resources/Constants/texts.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class JobDetailsMainInfo extends StatelessWidget {
  JobDetailsMainInfo({
    super.key,
    required this.screenWidth,
    this.onApplyTap,
    this.onMessageTap,
  });
  final List<String> listIcons = [
    loctionIcon,
    onstieIcon,
    salaryIcon,
    timeIcon
  ];
  final double screenWidth;
  final VoidCallback? onApplyTap;
  final VoidCallback? onMessageTap;
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
              image: AssetImage(jobDetailsBackground), fit: BoxFit.fill),
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
              padding: const EdgeInsets.only(right: 70),
              child: SizedBox(
                width: 150,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.favorite,
                      size: 50,
                      color: Colors.blue,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              companyIcon,
                            ),
                            Text(
                              'Company',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color.fromRGBO(236, 227, 227, 1),
                                    fontSize: 11.35,
                                    fontWeight: FontWeight.w700),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Text(
                          'Uzone',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.62,
                                fontWeight: FontWeight.w700),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Technology and Software',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 6.35,
                                fontWeight: FontWeight.w700),
                          ),
                          textAlign: TextAlign.center,
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
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            listIcons[index],
                            width: 20,
                            color: Color(0xffECE3E3),
                          ),
                          SizedBox(
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
                                text: jobDetailsTitle[index],
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
                            jobDetailsData[index],
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: white,
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
                AuthMainButton(
                  width: 80,
                  height: 23,
                  text: 'Message',
                  blurRadius: 4,
                  yAxisOffset: 4,
                  shadowColor: boxShadowColor2,
                  fontSize: 8.73,
                  buttonColor: white,
                  textColor: black,
                  onTap: onMessageTap,
                ),
                const SizedBox(
                  width: 10,
                ),
                AuthMainButton(
                    width: 80,
                    height: 23,
                    text: 'Apply',
                    blurRadius: 4,
                    yAxisOffset: 4,
                    shadowColor: boxShadowColor2,
                    fontSize: 8.73,
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.exit_to_app_outlined,
                          color: white,
                          size: 12,
                        ),
                      ],
                    ),
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
