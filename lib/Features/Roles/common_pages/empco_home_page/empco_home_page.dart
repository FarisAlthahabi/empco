import 'package:empco/Core/Config/Shared_Preferences.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Resources/Constants/colors.dart';
import 'package:empco/Core/Resources/Constants/font_weights.dart';
import 'package:empco/Core/Resources/Constants/texts.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/filter_icon_button.dart';
import 'package:empco/Core/Widgets/notification_icon.dart';
import 'package:empco/Core/Widgets/search_text_field.dart';
import 'package:empco/Core/Widgets/job_details_contact.dart';

import 'package:empco/Features/Auth/bloc/auth_bloc.dart';
import 'package:empco/Features/Roles/Company/apply_job/apply_job.dart';
import 'package:empco/Features/Roles/Company/job_app/job_app_view.dart';
import 'package:empco/Features/Roles/Company/my_app/my_appliction.dart';
import 'package:empco/Features/Roles/Company/jop_post/view/job_post_view.dart';
import 'package:empco/Features/Roles/Company/saved_post/saved_post_view.dart';


import 'package:empco/Features/Roles/Freelancer/Verification/VerificationVerified.dart';
import 'package:empco/Features/Roles/Freelancer/navigator_profile/navigator_company_profile.dart';


import 'package:empco/Features/Roles/Freelancer/profile_employee/profile.dart';
import 'package:empco/Features/Roles/common_pages/empco_home_page/drawer_company.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class EmpcoHomePageCallBacks {
  void onAccountVerifyTap();

  void onJobApplicationsTap();

  void onProfileTap();

  void onSettingsTap();

  void onLogoutTap();

  void onPostAJobsTap();

  void onMyApplicationsTap();

  void onFreelanceProjectsTap();

  void onSavedPostsTap();

  void onFollowingsTap();

  void onOrderedServicesTap();
}

class EmpcoHomePage extends StatefulWidget {
  const EmpcoHomePage({
    super.key,
    required this.intSideBar,
    required this.onNotificationTap,
    required this.searchJobController,
    required this.onFilterTap,
    this.onDeleteTap,
    this.onEditTap,
    required this.haveNewNotification,
    required this.screenWidth,
  });

  final TextEditingController searchJobController;
  final VoidCallback onNotificationTap;
  final VoidCallback onFilterTap;
  final VoidCallback? onDeleteTap;
  final VoidCallback? onEditTap;
  final bool haveNewNotification;
  final double screenWidth;
  final int intSideBar; // 1 (COMPANY) 2 (FREELANCER) ELSE (CUSTOMER)

  @override
  State<EmpcoHomePage> createState() => _EmpcoHomePageState();
}

class _EmpcoHomePageState extends State<EmpcoHomePage>
    implements EmpcoHomePageCallBacks {
  List<String> companytitles = [
    'Post a job',
    'Account Verification',
    'Jobs Applications',
    'Profile',
    'Settings',
    'Log out'
  ];
  List<String> freelancertitles = [
    'Account Verification',
    'My applications',
    'Freelance projects',
    'Saved posts ',
    'Followings',
    'Profile',
    'Settings',
    'Log out'
  ];
  List<String> customertitles = [
    'Ordered services',
    'Profile',
    'Settings',
    'Log out'
  ];
  List<String> freelancericons = [
    verifiedIcon,
    applyIcon,
    freelancerProjectIcon,
    savedIcon,
    followingsIcon,
    profileIcon,
    settingsIcon,
    logoutIcon
  ];
  List<String> companyicons = [
    addPostIcon,
    verifiedIcon,
    applyIcon,
    profileIcon,
    settingsIcon,
    logoutIcon
  ];
  List<String> customericons = [
    orderedServicesIcon,
    profileIcon,
    settingsIcon,
    logoutIcon
  ];
  late List<VoidCallback> freelancerCallBacks = [
    onAccountVerifyTap,
    onMyApplicationsTap,
    onFreelanceProjectsTap,
    onSavedPostsTap,
    onFollowingsTap,
    onProfileTap,
    onSettingsTap,
    onLogoutTap,
  ];

  late List<VoidCallback> companyCallBacks = [
    onPostAJobsTap,
    onAccountVerifyTap,
    onJobApplicationsTap,
    onProfileTap,
    onSettingsTap,
    onLogoutTap,
  ];

  late List<VoidCallback> customerCallBacks = [
    onOrderedServicesTap,
    onProfileTap,
    onSettingsTap,
    onLogoutTap,
  ];

  @override
  void onAccountVerifyTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VerificationVerified(
            verificationStatus: 3,
          ),
        ));
  }

  @override
  void onJobApplicationsTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const JobAppView(),
        ));
    if (config.get<SharedPreferences>().getString(role) == 'freelancer') {
    } else if (config.get<SharedPreferences>().getString(role) == 'company') {
    } else {}
  }

  @override
  void onLogoutTap() {
    BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
  }

  @override
  void onProfileTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileEmployeeView(),
        ));
    // context.go('$mainRoute$introRoute/$profileRoute');
  }

  @override
  void onSettingsTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ApplyJob(),
        ));
  }

  @override
  void onPostAJobsTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const JobPostView(),
        ));
  }

  @override
  void onMyApplicationsTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyApplictionView(),
        ));
  }

  @override
  void onFreelanceProjectsTap() {}

  @override
  void onSavedPostsTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SavedPostView(),
        ));
  }

  @override
  void onFollowingsTap() {}

  @override
  void onOrderedServicesTap() {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: SafeArea(
          child: Scaffold(
        drawer: widget.intSideBar == 1
            ? FreelancerDrawer(
                callBacks: companyCallBacks,
                titles: companytitles,
                icons: companyicons,
                image: companyBackground)
            : widget.intSideBar == 2
                ? FreelancerDrawer(
                    callBacks: freelancerCallBacks,
                    titles: freelancertitles,
                    icons: freelancericons,
                    image: freelancerBackround)
                : FreelancerDrawer(
                    callBacks: customerCallBacks,
                    titles: customertitles,
                    icons: customericons,
                    image: customerBackground),
        appBar: EmpcoAppBar(
          centerTitle: true,
          title: SearchTextField(
            searchJobController: widget.searchJobController,
            screenWidth: widget.screenWidth,
          ), // Search TextField
          actions: [
            const SizedBox(
              width: 25,
            ),
            NotificationIcon(
                //   Notification Icon Button
                haveNewNotification: widget.haveNewNotification,
                onTap: widget.onNotificationTap),
            const SizedBox(
              width: 25,
            ),
          ],
        ),
        body: Column(
          children: [
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Posts Feed',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: black,
                        fontSize: 18.64,
                        fontWeight: weightlevel7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              trailing: FilterIconButton(
                // Filter Button
                onTap: () {
                  widget.onFilterTap();
                },
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NavigatorProfileView(),
                                  ));
                            },
                            child: const CircleAvatar(
                              radius: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('DEWARE Company',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: black,
                                    fontSize: 6.63,
                                    fontWeight: FontWeight.w700),
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('1h',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color.fromRGBO(131, 131, 131, 1),
                                    fontSize: 7.72,
                                    fontWeight: FontWeight.w400),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 319,
                      height: 380,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(250, 250, 250, 1),
                          border: Border.all(
                              color: const Color.fromRGBO(125, 118, 118, 0.62),
                              width: 0.11)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text('Front-End Developer',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: black,
                                          fontSize: 13.48,
                                          fontWeight: FontWeight.w700),
                                    )),
                                if (widget.onEditTap != null)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 85),
                                    child: SizedBox(
                                      width: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                              onTap: widget.onEditTap,
                                              child: const Icon(
                                                  Icons.edit_outlined)),
                                          InkWell(
                                              onTap: widget.onDeleteTap,
                                              child: const Icon(Icons
                                                  .delete_outline_outlined)),
                                        ],
                                      ),
                                    ),
                                  )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 230,
                              height: 110,
                              child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          size: 15,
                                          color:
                                              Color.fromRGBO(236, 227, 227, 1),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text.rich(
                                          textAlign: TextAlign.center,
                                          TextSpan(
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: blue,
                                                    fontSize: 7.97,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              text: jobDetailsTitle[index],
                                              children: const [
                                                TextSpan(
                                                    text: ':',
                                                    style: TextStyle(
                                                        fontSize: 10.53)),
                                              ]),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          jobDetailsData[index],
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: black,
                                                fontSize: 8.87,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 7,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 96.39,
                              height: 18.45,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(102, 161, 231, 0.07)),
                              child: Center(
                                child: Text(
                                  'Description',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: black,
                                        fontSize: 10.82,
                                        fontWeight: weightlevel7),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 250,
                              child: Text(
                                'As a Front-End Developer at Deware, you will be responsible for creating visually appealing and user-friendly web applications. You will work closely with our design and back-end development teams to deliver high-quality user experiences. If you are passionate about web technologies and have a keen eye for design, we would love to meet you!',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: black,
                                      fontSize: 9.26,
                                      fontWeight: weightlevel4),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const JobContactDetails(
                              title: 'Contact Info',
                              width: 75,
                              fontSize: 11,
                              iconSize: 12.5,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            )),
          ],
        ),
      )),
    );
  }
}
