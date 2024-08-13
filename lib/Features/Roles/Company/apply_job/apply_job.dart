
import 'package:empco/Core/Resources/Constants/assets.dart';

import 'package:empco/Core/Widgets/Buttons.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Features/Roles/Freelancer/profile_company/widgets/TextFormFieldToProfile.dart';

import 'package:empco/Features/Roles/Freelancer/profile_company/widgets/icon_and_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplyJob extends StatefulWidget {
  const ApplyJob({super.key});

  @override
  State<ApplyJob> createState() => _ApplyJobState();
}

class _ApplyJobState extends State<ApplyJob> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const EmpcoAppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Apply to Job',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
        ),
      ),
      body: Stack(
        children: [
          SvgPicture.asset(
            applyImage,
            fit: BoxFit.cover,
            width: 430,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 65, left: 200, right: 20),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Please Answer the following questions to ',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                TextSpan(
                  text: 'Apply',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Color(0xff70CCFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 220,
                ),
                Text(
                  'Basic Info',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const IconWithText(
                  coloricon: Colors.black,
                  icon: personIcon,
                  text: 'Name',
                  sizetext: 15,
                  sizeicon: 18,
                ),
                const SizedBox(
                  height: 3,
                ),
                TextFormFieldToProfile(
                  width: 400,
                  height: 45,
                ),
                const SizedBox(
                  height: 18,
                ),
                const IconWithText(
                  coloricon: Colors.black,
                  icon: emailIcon,
                  text: 'Email',
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
                  height: 10,
                ),
                Text(
                  'Resume',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Text(
                  'upload a full resume that includes a portfolio link if you have one.',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: AuthMainButton(
                    fontSize: 18,
                    border: Border.all(color: Colors.black, width: 20),
                    icon: const Icon(
                      size: 40,
                      Icons.file_upload_rounded,
                      color: Color(0xff174377),
                    ),
                    textColor: const Color(0xff174377),
                    text: 'Upload resume',
                    buttonColor: const Color(0xffEFF2F5),
                    width: 400,
                    height: 55,
                    blurRadius: 1.71,
                    yAxisOffset: 1.71,
                    shadowColor: Colors.black.withOpacity(0.25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 5),
                  child: Text(
                    'DOC PDF only',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AuthMainButton(
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
                    AuthMainButton(
                      text: 'Apply',
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
    ));
  }
}
