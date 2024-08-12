import 'package:empco/Core/Resources/Constants/assets.dart';

import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';

import 'package:empco/Features/Roles/Freelancer/profile/widgets/TextFormFieldToProfile.dart';
import 'package:empco/Features/Roles/Freelancer/profile/widgets/icon_and_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: EmpcoAppBar(
          automaticallyImplyLeading: true,
          title: Text(
            title ?? 'Profile Setup',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
          ),
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                const Image(
                  image: AssetImage(backgroundEditProfile),
                  fit: BoxFit.cover,
                  width: 1200,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 75, left: 160),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xffE0E0E0)),
                    child: const Center(
                      child: Icon(
                        Icons.person_outline,
                        size: 80,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 185, top: 180, right: 150),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          editImageIcon,
                          width: 20,
                        ),
                        Text(
                          'edit',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color(0xff1D5BA4),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      const IconWithText(
                        coloricon: Colors.black,
                        icon: personIcon,
                        text: ' Name',
                        sizetext: 15,
                        sizeicon: 25,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormFieldToProfile(
                        width: 400,
                        height: 45,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const IconWithText(
                        coloricon: Colors.black,
                        icon: loctionIcon,
                        text: 'Location',
                        sizetext: 15,
                        sizeicon: 25,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormFieldToProfile(
                        width: 400,
                        height: 45,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const IconWithText(
                        coloricon: Colors.black,
                        icon: connectionIcon,
                        text: 'Establish Yea',
                        sizetext: 15,
                        sizeicon: 25,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormFieldToProfile(
                        width: 400,
                        height: 45,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const IconWithText(
                        coloricon: Colors.black,
                        icon: ceoIcon,
                        text: 'Ceo',
                        sizetext: 15,
                        sizeicon: 25,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormFieldToProfile(
                        width: 400,
                        height: 45,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const IconWithText(
                        coloricon: Colors.black,
                        icon: aboutIcon,
                        text: 'Overview',
                        sizetext: 20,
                        sizeicon: 25,
                      ),
                      TextFormFieldToProfile(
                        height: 125,
                        width: 400,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const IconWithText(
                        coloricon: Colors.black,
                        icon: workIcon,
                        text: 'Projects',
                        sizetext: 20,
                        sizeicon: 25,
                      ),
                      TextFormFieldToProfile(
                        height: 125,
                        width: 400,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const IconWithText(
                        coloricon: Colors.black,
                        icon: contactIcon,
                        text: 'Contact info',
                        sizetext: 20,
                        sizeicon: 25,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      TextFormFieldToProfile(width: 400, height: 45),
                      const SizedBox(
                        height: 7,
                      ),
                      TextFormFieldToProfile(width: 400, height: 45),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MainActionButton(
                            textColor: Colors.black,
                            text: 'Cancel',
                            buttonColor: const Color(0xffEFF2F5),
                            width: 104,
                            height: 32,
                            blurRadius: 3.71,
                            yAxisOffset: 3.71,
                            shadowColor: Colors.black.withOpacity(0.25),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          MainActionButton(
                            text: 'Save',
                            width: 104,
                            height: 32,
                            blurRadius: 3.71,
                            yAxisOffset: 3.71,
                            shadowColor: Colors.black.withOpacity(0.25),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
