import 'package:empco/Core/Resources/Constants/Colors.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';

import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Features/Roles/Company/is_empty_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MyApplictionView extends StatelessWidget {
  MyApplictionView({super.key});
  List<String> list = ['a'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: const EmpcoAppBar(
              automaticallyImplyLeading: true,
              title: Text(
                'My applications',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
              ),
            ),
            body: list.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xff3F5772), width: 4),
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffF8F8F8)),
                          width: 200,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, left: 17, bottom: 12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(JobSearchIcon),
                                        const SizedBox(
                                          width: 12.5,
                                        ),
                                        Text(
                                          'Ui Ux Designer',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                color: Color(0xff3F5772),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          empcoIcon,
                                          width: 20,
                                        ),
                                        const SizedBox(
                                          width: 12.5,
                                        ),
                                        Text(
                                          'name company',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: black,
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          loctionIcon,
                                          width: 15,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          'Damascus, Syria',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                color: Color(0xff808080),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        SvgPicture.asset(
                                          onstieIcon,
                                          width: 15,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          'On-Site',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                color: Color(0xff808080),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 120,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 3.0,
                                ),
                                child: Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.cancel_outlined,
                                          size: 25,
                                          color: black,
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })
                : const EmptyView(textt: 'You haven’t applied to any job yet!')));
  }
}
