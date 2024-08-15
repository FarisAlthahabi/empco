import 'package:empco/Core/Resources/Constants/assets.dart';

import 'package:empco/Core/Resources/Constants/texts.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/job_details_contact.dart';

import 'package:empco/Features/Roles/Company/profile_company/widgets/icon_and_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class NavigatorProfileEmployeeViewCallBacks {
  void onMessageTap();
  void onFollowTap();
  void onShowTap();
}

class NavigatorProfileEmployeeView extends StatelessWidget {
  const NavigatorProfileEmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavigatorProfileEmployeePage();
  }
}

class NavigatorProfileEmployeePage extends StatefulWidget {
  const NavigatorProfileEmployeePage({super.key});

  @override
  State<NavigatorProfileEmployeePage> createState() =>
      _NavigatorProfileEmployeePageState();
}

class _NavigatorProfileEmployeePageState
    extends State<NavigatorProfileEmployeePage>
    implements NavigatorProfileEmployeeViewCallBacks {
  @override
  void onMessageTap() {
    // TODO: implement onMessageTap
  }

  @override
  void onFollowTap() {
    // TODO: implement onOrderTap
  }
  @override
  void onShowTap() {
    // TODO: implement onOrderTap
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: const EmpcoAppBar(
              automaticallyImplyLeading: true,
              title: Text(
                profile,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
              ),
            ),
            body: Stack(
              children: [
                const Image(
                  image: AssetImage(backgroungProfile),
                  fit: BoxFit.cover,
                  width: 1200,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 75, left: 25),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.black),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(backgroungProfile),
                    ),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 150, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MainActionButton(
                          onTap: onMessageTap,
                          icon: const Icon(
                            Icons.messenger_outline,
                            color: Color(0xff002245),
                            size: 20,
                          ),
                          fontSize: 10,
                          textColor: const Color(0xff002245),
                          text: 'Message',
                          buttonColor: const Color(0xffEFF2F5),
                          width: 100,
                          height: 30,
                          blurRadius: 3.71,
                          yAxisOffset: 3.71,
                          shadowColor: Colors.black.withOpacity(0.25),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        MainActionButton(
                          onTap: onFollowTap,
                          icon: Icon(
                            Icons.library_add_rounded,
                            color: AppColors.white,
                            size: 20,
                          ),
                          textColor: AppColors.white,
                          text: 'Follow',
                          width: 100,
                          height: 30,
                          blurRadius: 3.71,
                          yAxisOffset: 3.71,
                          shadowColor: Colors.black.withOpacity(0.25),
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 180,
                      ),
                      Row(
                        children: [
                          Text(
                            'Elon Mask',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '200',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            'followers',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Text(
                            'show services',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Color(0xff1D5BA4),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                          Icon(
                            Icons.open_in_new_outlined,
                            color: Color(0xff1D5BA4),
                            size: 13,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const IconWithText(
                        iconColor: Color(0xff15416F),
                        icon: workIcon,
                        text: 'Front-end developer',
                        textSize: 15,
                        iconSize: 30,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const IconWithText(
                        icon: companyIcon,
                        text: 'Ggdev company',
                        textSize: 15,
                        iconSize: 25,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const IconWithText(
                        icon: loctionIcon,
                        text: ' Damascus, Syria',
                        textSize: 15,
                        iconSize: 25,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const IconWithText(
                        icon: dateIcon,
                        text: '19/2/2000',
                        textSize: 15,
                        iconSize: 25,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const IconWithText(
                        icon: aboutIcon,
                        text: 'Brief',
                        textSize: 20,
                        iconSize: 25,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 15, left: 8),
                        child: Text(
                            'As a passionate front-end developer, I specialize in creating dynamic and visually appealing user interfaces. With a strong foundation in HTML, CSS, and JavaScript, I,m open to new opportunities.'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 190, top: 30),
                        child: JobContactDetails(
                          fontSize: 15,
                          title: 'Contact info',
                          width: 100,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
