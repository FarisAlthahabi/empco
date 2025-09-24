import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class VerificationStatusViewCallBacks {
  void onRequestAgainTap();
}

@RoutePage()
class VerificationStatusView extends StatelessWidget {
  const VerificationStatusView({
    super.key,
    required this.verificationStatus,
    required this.userType,
  });

  final String verificationStatus;
  final String userType;
  @override
  Widget build(BuildContext context) {
    return VerificationStatusPage(
      verificationStatus: verificationStatus,
      userType: userType,
    );
  }
}

class VerificationStatusPage extends StatefulWidget {
  const VerificationStatusPage({
    super.key,
    required this.verificationStatus,
    required this.userType,
  });

  final String verificationStatus;
  final String userType;

  @override
  State<VerificationStatusPage> createState() => _VerificationStatusPageState();
}

class _VerificationStatusPageState extends State<VerificationStatusPage>
    implements VerificationStatusViewCallBacks {
  @override
  void onRequestAgainTap() {
    if (widget.userType == 'freelancer') {
      context.go(
        '$loginRoute/$freelancerHomePageRoute/${uploadLicenceRoute.replaceFirst(
          ':userType',
          widget.userType,
        )}',
      );
    } else if (widget.userType == 'owner') {
      context.go(
        '$loginRoute/$companyHomePageRoute/${uploadLicenceRoute.replaceFirst(
          ':userType',
          widget.userType,
        )}',
      );
    } 
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const EmpcoAppBar(
          automaticallyImplyLeading: true,
          title: Text(
            'Account Verfication',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff1D5BA4),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                widget.verificationStatus == 'pending'
                    ? 'Revewing'
                    : widget.verificationStatus == 'approved'
                        ? 'Verified'
                        : 'Rejected',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: widget.verificationStatus == 'pending'
                        ? const Color(0xff1D5BA4)
                        : widget.verificationStatus == 'approved'
                            ? const Color(0xff4EE0BD)
                            : const Color(0xff9F2828),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  textAlign: TextAlign.left,
                  widget.verificationStatus == 'pending'
                      ? 'Your verification request is being reviewed by the admin, you will be notified with the result soon!'
                      : widget.verificationStatus == 'approved'
                          ? 'Your request was approved by the admin, and You are able to use all the features of this application!'
                          : 'Your verification request was rejected by the admin because your account does not meet the conditions!',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SvgPicture.asset(
                widget.verificationStatus == 'pending'
                    ? reviewingImage
                    : widget.verificationStatus == 'approved'
                        ? verifiedImage
                        : regectedImage,
              ),
              if (widget.verificationStatus == 'rejected')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    MaterialButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 8),
                      onPressed: onRequestAgainTap,
                      color: const Color(0xFFF8F8F8),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.black,
                            width: 0.75,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Request again',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
