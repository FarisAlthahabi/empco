import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Resources/Constants/texts.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/job_details_contact.dart';
import 'package:empco/Features/Roles/Company/profile/widgets/icon_and_text.dart';
import 'package:empco/Features/Roles/Freelancer/profile_employee/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileEmployeeView extends StatelessWidget {
  const ProfileEmployeeView({super.key});

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
                        color: AppColors.black),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(backgroungProfile),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 350, top: 140),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const EditProfileEmployeeView(
                                title: 'Edit Profile',
                              ),
                            ));
                      },
                      icon: const Icon(Icons.edit)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
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
                              textStyle: const TextStyle(
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
                              textStyle: const TextStyle(
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
                              textStyle: const TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
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
