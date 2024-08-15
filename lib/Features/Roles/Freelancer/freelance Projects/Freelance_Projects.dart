import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';

import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Features/Roles/Company/is_empty_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class FreelanceProjects extends StatefulWidget {
  FreelanceProjects({super.key});

  @override
  State<FreelanceProjects> createState() => _FreelanceProjectsState();
}

class _FreelanceProjectsState extends State<FreelanceProjects> {
  List<String> list = ["Ui Ux Designer", "SofwareEn", "Ui Ux Designer"];

  List<String> listicon = [ordredIcon, completedIcon, inProgressIcon];

  List<String> listTitle = ["ordred", "completed", "InProgress"];

  @override
  Widget build(BuildContext context) {
    int? selectRadio;
    return SafeArea(
        child: Scaffold(
            appBar: const EmpcoAppBar(
              automaticallyImplyLeading: true,
              title: Text(
                'Freelance Projects',
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
                                          width: 20,
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
                                                fontSize: 17),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          personServiceIcon,
                                          width: 20,
                                          color: Color(0xffDD5A5A),
                                        ),
                                        const SizedBox(
                                          width: 15.5,
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
                                child:  SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        title: const Text('Dark'),
                                        leading: Radio<int>(
                                          value: 1,
                                          groupValue: selectRadio,
                                          onChanged: (value) {
                                            setState(() {
                                              selectRadio = value;
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: const Text('Light'),
                                        leading: Radio<int>(
                                          value: 2,
                                          groupValue: selectRadio,
                                          onChanged: (value) {
                                            setState(() {
                                              selectRadio = value;
                                            });
                                          },
                                        ),
                                      )
                                    ],
                                  ),
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
