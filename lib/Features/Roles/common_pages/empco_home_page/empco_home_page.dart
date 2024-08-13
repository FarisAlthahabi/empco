import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Resources/Constants/font_weights.dart';
import 'package:empco/Core/Resources/Constants/text_styles.dart';
import 'package:empco/Core/Resources/Constants/texts.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/filter_bottom_sheet.dart';
import 'package:empco/Core/Widgets/filter_icon_button.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/Widgets/main_error_widget.dart';
import 'package:empco/Core/Widgets/main_show_bottom_sheet.dart';
import 'package:empco/Core/Widgets/notification_icon.dart';
import 'package:empco/Core/Widgets/search_text_field.dart';
import 'package:empco/Core/Widgets/job_details_contact.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/extensions/date_time_x.dart';
import 'package:empco/Core/repos/user_repo.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Features/Auth/View/Login/login_page.dart';
import 'package:empco/Features/Auth/bloc/auth_bloc.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/cubit/jobs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class EmpcoHomePageCallBacks {
  void onAccountVerifyTap();

  void onJobApplicationsTap();

  void onProfileTap();

  void onSettingsTap();

  void onLogoutTap();

  void onCategorySelected(int index);

  void onSearchChaged(String title);

  void onSearchSubmitted(String title);

  void onTryAgainTap();

  void onFilterTap();

  void onTypeSelected();

  void onWorkNatureSelected();

  void onLocationChanged(String location);

  void onLocationSubmitted(String location);

  void onMinimumSalaryChanged(String minimumSalary);

  void onMinimumSalarySubmitted(String minimumSalary);

  void onCancelTap();

  void onApplyFiltersTap();

  void onPostAJobsTap();

  void onMyApplicationsTap();

  void onFreelanceProjectsTap();

  void onSavedPostsTap();

  void onFollowingsTap();

  void onOrderedServicesTap();
}

class EmpcoHomePageView extends StatelessWidget {
  const EmpcoHomePageView({
    super.key,
    required this.searchJobController,
    required this.onNotificationTap,
    this.onDeleteTap,
    this.onEditTap,
    required this.haveNewNotification,
    required this.screenWidth,
    required this.intSideBar,
  });

  final TextEditingController searchJobController;
  final VoidCallback onNotificationTap;
  final VoidCallback? onDeleteTap;
  final VoidCallback? onEditTap;
  final bool haveNewNotification;
  final double screenWidth;
  final int intSideBar; // 1 (COMPANY) 2 (FREELANCER) ELSE (CUSTOMER)

  @override
  Widget build(BuildContext context) {
    return EmpcoHomePage(
      haveNewNotification: haveNewNotification,
      intSideBar: intSideBar,
      onNotificationTap: onNotificationTap,
      screenWidth: screenWidth,
      searchJobController: searchJobController,
      onDeleteTap: onDeleteTap,
      onEditTap: onEditTap,
    );
  }
}

class EmpcoHomePage extends StatefulWidget {
  const EmpcoHomePage({
    super.key,
    required this.intSideBar,
    required this.onNotificationTap,
    required this.searchJobController,
    required this.haveNewNotification,
    required this.screenWidth,
    this.onDeleteTap,
    this.onEditTap,
  });

  final TextEditingController searchJobController;
  final VoidCallback onNotificationTap;
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
  late final AuthBloc authBloc = context.read();

  late final JobsCubit jobsCubit = context.read();

  late final UserRepo userRepo = context.read();

  final locationFocusNode = FocusNode();

  final minimumSalaryFocusNode = FocusNode();

  @override
  void initState() {
    jobsCubit.getJobs();
    super.initState();
  }

  @override
  void onApplyFiltersTap() {
    // TODO: implement onApplyFiltersTap
  }

  @override
  void onCancelTap() {
    Navigator.pop(context);
  }

  @override
  void onCategorySelected(int index) {
    jobsCubit.getJobsByCategory(index);
  }

  @override
  void onFilterTap() {
    mainShowBottomSheet(
      context,
      backgroundColor: AppColors.greyShade,
      widget: FilterBottomSheet(
        locationFocusNode: locationFocusNode,
        minimumSalaryFocusNode: minimumSalaryFocusNode,
        onLocationChanged: onLocationChanged,
        onLocationSubmitted: onLocationSubmitted,
        onMinimumSalaryChanged: onMinimumSalaryChanged,
        onMinimumSalarySubmitted: onMinimumSalarySubmitted,
        onTypeSelected: onTypeSelected,
        onWorkNatureSelected: onWorkNatureSelected,
        onCancelTap: onCancelTap,
        onApplyFiltersTap: onApplyFiltersTap,
      ),
    );
  }

  @override
  void onFollowingsTap() {
    // TODO: implement onFollowingsTap
  }

  @override
  void onFreelanceProjectsTap() {
    // TODO: implement onFreelanceProjectsTap
  }

  @override
  void onLocationChanged(String location) {
    jobsCubit.setLocation(location);
  }

  @override
  void onLocationSubmitted(String location) {
    // TODO: implement onLocationSubmitted
  }

  @override
  void onMinimumSalaryChanged(String minimumSalary) {
    // TODO: implement onMinimumSalaryChanged
  }

  @override
  void onMinimumSalarySubmitted(String minimumSalary) {
    // TODO: implement onMinimumSalarySubmitted
  }

  @override
  void onMyApplicationsTap() {
    // TODO: implement onMyApplicationsTap
  }

  @override
  void onOrderedServicesTap() {
    // TODO: implement onOrderedServicesTap
  }

  @override
  void onPostAJobsTap() {
    // TODO: implement onPostAJobsTap
  }

  @override
  void onSavedPostsTap() {
    // TODO: implement onSavedPostsTap
  }

  @override
  void onSearchChaged(String title) {
    jobsCubit.setTitle(title);
  }

  @override
  void onSearchSubmitted(String input) {
    jobsCubit.getSearchedJobs();
  }

  @override
  void onSettingsTap() {
    // TODO: implement onSettingsTap
  }

  @override
  void onTypeSelected() {
    // TODO: implement onTypeSelected
  }

  @override
  void onWorkNatureSelected() {
    // TODO: implement onWorkNatureSelected
  }

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
    context.go(
        '$loginRoute/$freelancerHomePageRoute/${accountVerificationRoute.replaceFirst(':verificationStatus', '3')}');
  }

  @override
  void onJobApplicationsTap() {}

  @override
  void onLogoutTap() {
    authBloc.add(LogoutEvent());
  }

  @override
  void onProfileTap() {
    context.go('$mainRoute/$loginRoute/$freelancerHomePageRoute/$profileRoute');
  }

  @override
  void onTryAgainTap() {
    jobsCubit.getJobs();
  }

  List<bool> isCategorySelected = List.generate(
    5,
    (index) => false,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    drawerBackgroundImage,
                  ),
                  fit: BoxFit.cover,
                )),
                child: Center(
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage(notionImage),
                    ),
                    title: Text(
                      'Notion',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: weightlevel7,
                          height: 1.30,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      'Technology and Software',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Color(0xFFDDDDDD),
                          fontSize: 13,
                          fontWeight: weightlevel7,
                          height: 1.20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    List<String> icons = [
                      verifiedIcon,
                      applyIcon,
                      profileIcon,
                      settingsIcon,
                      logoutIcon
                    ];
                    List<String> titles = [
                      'Account Verification',
                      'Jobs Applications',
                      'Profile',
                      'Settings',
                      'Log out'
                    ];
                    List<VoidCallback> callBacks = [
                      onAccountVerifyTap,
                      onJobApplicationsTap,
                      onProfileTap,
                      onSettingsTap,
                      onLogoutTap,
                    ];
                    return ListTile(
                      leading: BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is SuccessToLogoutState) {
                            userRepo.setKey(isLogin, false);
                            if (index == 4) {
                              showSnackBarMethod(context,
                                  'Logout out Successfully', AppColors.green);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginView(),
                                  ));
                            }
                          } else if (state is FailedToLogoutState) {
                            if (index == 4) {
                              showSnackBarMethod(
                                  context, state.error, AppColors.red);
                            }
                          }
                        },
                        builder: (context, state) {
                          if (state is LoadingState) {
                            if (index != 4) {
                              return SvgPicture.asset(icons[index]);
                            } else {
                              return const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: AppColors.red,
                                ),
                              );
                            }
                          }
                          return SvgPicture.asset(icons[index]);
                        },
                      ),
                      onTap: index == 4
                          ? () {
                              BlocProvider.of<AuthBloc>(context)
                                  .add(LogoutEvent());
                            }
                          : callBacks[index],
                      title: Text(
                        titles[index],
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color(0xFF393939),
                            fontSize: 14.5,
                            fontWeight: weightlevel6,
                            height: 1.21,
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
        appBar: EmpcoAppBar(
          centerTitle: true,
          title: SearchTextField(
            onChanged: onSearchChaged,
            onSubmitted: onSearchSubmitted,
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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Job Posts Feed',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: AppColors.black,
                          fontSize: 18.64,
                          fontWeight: weightlevel7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                trailing: FilterIconButton(
                    // Filter Button
                    onTap: onFilterTap),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.abc),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Categories',
                    style:
                        TextStyles.labelLarge.copyWith(color: AppColors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return MainActionButton(
                      onTap: () => onCategorySelected(index),
                      text: 'hello',
                      textColor: isCategorySelected[index]
                          ? const Color(0xFF0B2244)
                          : const Color(0xFFF6F6F6),
                      buttonColor: isCategorySelected[index]
                          ? const Color(0xFFF6F6F6)
                          : const Color(0xFF0B2244),
                      width: 100,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 5,
                    );
                  },
                ),
              ),
              BlocBuilder<JobsCubit, JobsState>(
                builder: (context, state) {
                  if (state is JobsLoading) {
                    return const Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        LoadingIndicator(),
                      ],
                    );
                  } else if (state is JobsSuccess) {
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.jobs.length,
                              itemBuilder: (context, index) {
                                final item = state.jobs[index];
                                return Column(
                                  children: [
                                    SizedBox(
                                      width: 300,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const CircleAvatar(
                                            radius: 14,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(item.title,
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: AppColors.black,
                                                    fontSize: 6.63,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                              '${item.deadTime.hour.toString()} h',
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Color.fromRGBO(
                                                        131, 131, 131, 1),
                                                    fontSize: 7.72,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                          color: const Color.fromRGBO(
                                              250, 250, 250, 1),
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  125, 118, 118, 0.62),
                                              width: 0.11)),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                Text(item.title,
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              fontSize: 13.48,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                    )),
                                                if (widget.onEditTap != null)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 85),
                                                    child: SizedBox(
                                                      width: 50,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: widget
                                                                .onEditTap,
                                                            child: const Icon(Icons
                                                                .edit_outlined),
                                                          ),
                                                          InkWell(
                                                            onTap: widget
                                                                .onDeleteTap,
                                                            child: const Icon(Icons
                                                                .delete_outline_outlined),
                                                          ),
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
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: 5,
                                                itemBuilder: (context, index) {
                                                  List<String> jobDetailsData =
                                                      [
                                                    item.location,
                                                    item.location,
                                                    '${item.salary} SP',
                                                    item.jobType,
                                                    item.createdAt
                                                        .formatMMddYYYY
                                                  ];
                                                  return SizedBox(
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.location_on,
                                                          size: 15,
                                                          color: Color.fromRGBO(
                                                              236, 227, 227, 1),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text.rich(
                                                          textAlign:
                                                              TextAlign.center,
                                                          TextSpan(
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle: const TextStyle(
                                                                  color:
                                                                      AppColors
                                                                          .blue,
                                                                  fontSize:
                                                                      7.97,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                            text:
                                                                jobDetailsTitle[
                                                                    index],
                                                            children: const [
                                                              TextSpan(
                                                                text: ':',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.53),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          jobDetailsData[index],
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle: const TextStyle(
                                                                color: AppColors
                                                                    .black,
                                                                fontSize: 8.87,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                separatorBuilder:
                                                    (BuildContext context,
                                                        int index) {
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
                                                  color: Color.fromRGBO(
                                                      102, 161, 231, 0.07)),
                                              child: Center(
                                                child: Text(
                                                  'Description',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: AppColors.black,
                                                        fontSize: 10.82,
                                                        fontWeight:
                                                            weightlevel7),
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
                                                item.body,
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      color: AppColors.black,
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
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state is JobsEmpty) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 200,
                        ),
                        MainErrorWidget(
                          error: state.error,
                        ),
                      ],
                    );
                  } else if (state is JobsFail) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 200,
                        ),
                        MainErrorWidget(
                          error: state.error,
                          onTap: onTryAgainTap,
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
