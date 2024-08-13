import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class UploadLicenceViewCallBacks {
  void onUploadTap();
}

@RoutePage()
class UploadLicenceView extends StatelessWidget {
  const UploadLicenceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const UploadLicencePage();
  }
}

class UploadLicencePage extends StatefulWidget {
  const UploadLicencePage({super.key});

  @override
  State<UploadLicencePage> createState() => _UploadLicencePageState();
}

class _UploadLicencePageState extends State<UploadLicencePage>
    implements UploadLicenceViewCallBacks {
  @override
  void onUploadTap() {
    // TODO: implement onUploadTap
  }

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
                    color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 20),
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
                  textStyle: const TextStyle(color: AppColors.black, fontSize: 13),
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
