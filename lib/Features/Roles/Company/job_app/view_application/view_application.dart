
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ViewApplication extends StatefulWidget {
  const ViewApplication({super.key});

  @override
  State<ViewApplication> createState() => _ViewApplicationState();
}

class _ViewApplicationState extends State<ViewApplication> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: const EmpcoAppBar(
              automaticallyImplyLeading: true,
              title: Text(
                'Application Details',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 40, top: 40, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Basic Info',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.person_outline,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Name',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Ahmad Wa',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Color(0xff224A79),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.email_outlined,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Email',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        'ahmadwa@gmail.com',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Color(0xff224A79),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Resume',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade300),
                    width: 300,
                    height: 380,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MainActionButton(
                          textColor: AppColors.red,
                          text: 'Reject',
                          buttonColor: const Color(0xffEFF2F5),
                          width: 104,
                          height: 32,
                          blurRadius: 3.71,
                          yAxisOffset: 3.71,
                          shadowColor: AppColors.black.withOpacity(0.25),
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
                          shadowColor:AppColors.black.withOpacity(0.25),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
