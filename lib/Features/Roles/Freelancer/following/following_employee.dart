import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';

import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Features/Roles/Company/is_empty_view.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FollowingViewCallBacks {
  void onUnFollowTap();
}

class FollowingView extends StatelessWidget {
  const FollowingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const FollowingPage();
  }
}

class FollowingPage extends StatefulWidget {
  const FollowingPage({super.key});

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage>
    implements FollowingViewCallBacks {
  @override
  void onUnFollowTap() {
  }

  List<String> list = ["Ui Ux Designer", "SofwareEn", "Ui Ux Designer"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: const EmpcoAppBar(
              automaticallyImplyLeading: true,
              title: Text(
                'Followings',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
              ),
            ),
            body: list.isNotEmpty
                ? ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 20,
                      );
                    },
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: SizedBox(
                          width: 200,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        color: AppColors.black),
                                    child: const CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage(backgroundEditProfile),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 17, bottom: 12),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 12.5,
                                            ),
                                            Text(
                                              'name persoasdasn',
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.black,
                                                    fontSize: 15),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'Sofware En',
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Color(0xff808080),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
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
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: MainActionButton(
                                              icon: const Icon(
                                                color: AppColors.white,
                                                Icons.unpublished_outlined,
                                                size: 14,
                                              ),
                                              textColor: AppColors.white,
                                              buttonColor: const Color(0xffD44E4E),
                                              width: 80.85,
                                              height: 25.02,
                                              text: 'Unfollow',
                                              blurRadius: 1.36,
                                              yAxisOffset: 1.36,
                                              shadowColor:
                                                  AppColors.boxShadowColor2,
                                              fontSize: 9.81,
                                              onTap: onUnFollowTap),
                                        ),
                                        // Row(
                                        //   children: [
                                        //     SvgPicture.asset(listicon[index]),
                                        //     SizedBox(
                                        //       width: 5,
                                        //     ),
                                        //     Text(
                                        //       listTitle[index],
                                        //       style: GoogleFonts.poppins(
                                        //         textStyle: const TextStyle(
                                        //             color: Color(0xff808080),
                                        //             fontWeight: FontWeight.bold,
                                        //             fontSize: 12.5),
                                        //       ),
                                        //     )
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    height: 2,
                                    color: const Color(0xffDDDDDD),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                : const EmptyView(
                    textt: 'You haven’t applied to any job yet!')));
  }
}
