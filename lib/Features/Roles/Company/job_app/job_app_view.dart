import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';

import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Features/Roles/Company/is_empty_view.dart';
import 'package:empco/Features/Roles/Company/job_app/view_application/view_application.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class JobAppView extends StatefulWidget {
  const JobAppView({super.key});

  @override
  State<JobAppView> createState() => _JobAppViewState();
}

class _JobAppViewState extends State<JobAppView> {
  List<String> ll = ['a'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: const EmpcoAppBar(
              automaticallyImplyLeading: true,
              title: Text(
                'Jobs applications',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
              ),
            ),
            body: ll.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: ll.length,
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
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          memberIcon,
                                          width: 20,
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          'Damascus, Syria',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12.5),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 0.0,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 120,
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.delete_outline_outlined,
                                              size: 27,
                                              color: AppColors.red,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        MainActionButton(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ViewApplication(),
                                                ));
                                          },
                                          text: 'View appication',
                                          fontSize: 10.5,
                                          width: 120,
                                          height: 28,
                                          blurRadius: 3.71,
                                          yAxisOffset: 3.71,
                                          shadowColor:
                                              Colors.black.withOpacity(0.25),
                                        ),
                                        const Icon(
                                          Icons.open_in_full_rounded,
                                          size: 20,
                                          color: Color(0xff1D5BA4),
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
                : const EmptyView(textt: 'You haven’t posted any job yet!')));
  }
}
