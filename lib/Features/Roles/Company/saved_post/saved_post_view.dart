import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';

import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Features/Roles/Company/is_empty_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedPostView extends StatefulWidget {
  const SavedPostView({super.key});

  @override
  State<SavedPostView> createState() => _SavedPostViewState();
}

class _SavedPostViewState extends State<SavedPostView> {
  List<String> LL = ['a'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const EmpcoAppBar(
          automaticallyImplyLeading: true,
          title: Text(
            'Saved posts',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
          ),
        ),
        body: LL.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: LL.length,
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
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
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
                                          Icons.cancel_outlined,
                                          size: 25,
                                          color: AppColors.black,
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    MainActionButton(
                                      text: 'View',
                                      fontSize: 12.5,
                                      width: 80,
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
            : const EmptyView(textt: 'You haven’t saved any posts yet!'),
      ),
    );
  }
}
