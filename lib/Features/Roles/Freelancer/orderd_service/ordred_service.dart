import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';

import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Features/Roles/Company/is_empty_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class OrdredService extends StatelessWidget {
  OrdredService({super.key});
  List<String> list = ["Ui Ux Designer", "SofwareEn", "Ui Ux Designer"];
  List<String> listicon = [ordredIcon, completedIcon, inProgressIcon];
  List<String> listTitle = ["ordred", "completed", "InProgress"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: const EmpcoAppBar(
              automaticallyImplyLeading: true,
              title: Text(
                'Ordered services ',
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
                                        SvgPicture.asset(
                                          laptopIcon,
                                          width: 25,
                                        ),
                                        const SizedBox(
                                          width: 12.5,
                                        ),
                                        Text(
                                          list[index],
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
                                        Container(
                                          width: 25,
                                          height: 25,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50)),
                                              color: AppColors.black),
                                          child: const CircleAvatar(
                                            radius: 30,
                                            backgroundImage: AssetImage(
                                                backgroundEditProfile),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12.5,
                                        ),
                                        Text(
                                          'name person',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black,
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 9,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          color: Color(0xffACACAC),
                                          salaryIcon,
                                          width: 15,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          '100,000 SYP',
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
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 3.0,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(listicon[index]),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          listTitle[index],
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                color: Color(0xff808080),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.5),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })
                : const EmptyView(
                    textt: 'You haven’t applied to any job yet!')));
  }
}
