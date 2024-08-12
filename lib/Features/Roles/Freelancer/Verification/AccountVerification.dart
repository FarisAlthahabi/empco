import 'package:empco/Core/Resources/Constants/Colors.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';


import 'package:empco/Core/Widgets/empco_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountVerification extends StatelessWidget {
  const AccountVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const EmpcoAppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Account Verfication',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(uploadImage),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Upload File',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: black, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                textAlign: TextAlign.center,
                'Upload the company"s license to be reviewed for verfication',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(color: black, fontSize: 13),
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_circle_outline,
                  size: 100,
                  color: Color(0xff1D5BA4),
                ))
          ],
        ),
      ),
    ));
  }
}
