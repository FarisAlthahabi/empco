import 'package:empco/Core/Resources/Constants/Colors.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Features/Roles/Freelancer/Verification/AccountVerification.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationVerified extends StatefulWidget {
  const VerificationVerified({
    super.key,
    required this.verificationStatus, // 1 Revewing - 2 Verified - else Rejected 
  });

  final int verificationStatus; // 1 Revewing - 2 Verified - else Rejected 

  @override
  State<VerificationVerified> createState() => _VerificationVerifiedState();
}

class _VerificationVerifiedState extends State<VerificationVerified> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              widget.verificationStatus == 1
                  ? 'Revewing'
                  : widget.verificationStatus == 2
                      ? 'Verified'
                      : 'Rejected',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: widget.verificationStatus == 1
                        ? const Color(0xff1D5BA4)
                        : widget.verificationStatus == 2
                            ? const Color(0xff4EE0BD)
                            : const Color(0xff9F2828),
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                textAlign: TextAlign.left,
                widget.verificationStatus == 1
                    ? 'Your verification request is being reviewed by the admin, you will be notified with the result soon!'
                    : widget.verificationStatus == 2
                        ? 'Your request was approved by the admin, and You are able to use all the features of this application!'
                        : 'Your verification request was rejected by the admin because your account does not meet the conditions!',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: black, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SvgPicture.asset(widget.verificationStatus == 1
                ? reviewingImage
                : widget.verificationStatus == 2
                    ? verifiedImage
                    : regectedImage),
            if (widget.verificationStatus == 3)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  MaterialButton(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 70, vertical: 8),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AccountVerification(),
                          ));
                    },
                    color: const Color(0xFFF8F8F8),
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.black,
                            width: 0.75,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      'Request again',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    ));
  }
}
