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
import 'package:empco/Core/Widgets/show_dialog.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/bloc/licence_cubit/cubit/licence_cubit.dart';
import 'package:empco/Core/extensions/date_time_x.dart';
import 'package:empco/Core/models/licence_status_model/licence_status_model.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Features/Auth/cubit/auth_cubit.dart';
import 'package:empco/Features/Roles/Company/jop_post/models/job_category_enum/job_category_enum.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/cubit/jobs_cubit.dart';
import 'package:empco/Features/Roles/common_pages/empco_home_page/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';

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

  void onDeleteTap(int id);

  void onAcceptDeleteTap(int jobPostId);

  void onCancelDeleteTap();

  void onEditTap(JobModel job);
}

class EmpcoHomePageView extends StatelessWidget {
  const EmpcoHomePageView({
    super.key,
    required this.searchJobController,
    required this.onNotificationTap,
    required this.haveNewNotification,
    required this.screenWidth,
    required this.userType,
  });

  final TextEditingController searchJobController;
  final VoidCallback onNotificationTap;
  final bool haveNewNotification;
  final double screenWidth;
  final String userType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LicenceCubit, GeneralLicenceState>(
      builder: (context, state) {
        LicenceStatusModel? licenceStatusModel;
        if (state is LicenceSuccess) {
          licenceStatusModel = state.licence;
        }
        return EmpcoHomePage(
          haveNewNotification: haveNewNotification,
          userType: userType,
          onNotificationTap: onNotificationTap,
          screenWidth: screenWidth,
          searchJobController: searchJobController,
          licenceStatusModel: licenceStatusModel,
        );
      },
    );
  }
}

class EmpcoHomePage extends StatefulWidget {
  const EmpcoHomePage({
    super.key,
    required this.userType,
    required this.onNotificationTap,
    required this.searchJobController,
    required this.haveNewNotification,
    required this.screenWidth,
    this.licenceStatusModel,
  });

  final TextEditingController searchJobController;
  final VoidCallback onNotificationTap;
  final bool haveNewNotification;
  final double screenWidth;
  final String userType;
  final LicenceStatusModel? licenceStatusModel;

  @override
  State<EmpcoHomePage> createState() => _EmpcoHomePageState();
}

class _EmpcoHomePageState extends State<EmpcoHomePage>
    implements EmpcoHomePageCallBacks {
  late final AuthCubit authCubit = context.read();

  late final JobsCubit jobsCubit = context.read();

  late final UserRepo userRepo = context.read();

  late final LicenceCubit licenceCubit = context.read();

  final locationFocusNode = FocusNode();

  final minimumSalaryFocusNode = FocusNode();

  @override
  void initState() {
    licenceCubit.getLicenceStatus();
    jobsCubit.getJobs();
    super.initState();
  }

  @override
  void onApplyFiltersTap() {
    Navigator.pop(context);
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
    context.go(
      '$loginRoute/$companyHomePageRoute/$followingViewRoute',
    );
  }

  @override
  void onFreelanceProjectsTap() {
    context.go(
      '$loginRoute/$freelancerHomePageRoute/$freelanceProjectsViewRoute',
    );
  }

  @override
  void onLocationChanged(String location) {
    jobsCubit.setLocation(location);
  }

  @override
  void onLocationSubmitted(String location) {
    minimumSalaryFocusNode.requestFocus();
  }

  @override
  void onMinimumSalaryChanged(String minimumSalary) {
    // TODO ..............................
    //jobsCubit.setMinimumSalary(minimumSalary);
  }

  @override
  void onMinimumSalarySubmitted(String minimumSalary) {
    minimumSalaryFocusNode.unfocus();
  }

  @override
  void onMyApplicationsTap() {
    context.go('$loginRoute/$freelancerHomePageRoute/$myApplicationsRoute');
  }

  @override
  void onOrderedServicesTap() {}

  @override
  void onPostAJobsTap() {
    if (widget.licenceStatusModel?.status != 'approved') {
      showSnackBarMethod(
        context,
        "You don't have licence yet to post a job",
        AppColors.red,
      );
    } else {
      context.go('$loginRoute/$companyHomePageRoute/$jobPostRoute');
    }
  }

  @override
  void onSavedPostsTap() {}

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
    context.go('$loginRoute/$companyHomePageRoute/$settingsRoute');
  }

  @override
  void onTypeSelected() {}

  @override
  void onWorkNatureSelected() {}

  @override
  void onDeleteTap(int id) {
    empcoShowDialog(
      context,
      onAcceptDeleteTap,
      onCancelDeleteTap,
      id,
    );
  }

  @override
  void onAcceptDeleteTap(int jobPostId) {
    jobsCubit.deleteJobPost(jobPostId);
  }

  @override
  void onCancelDeleteTap() {
    Navigator.pop(context);
  }

  @override
  void onEditTap(JobModel job) {
    context.goNamed("jobPostView", extra: job);
  }

  @override
  void onAccountVerifyTap() async {
    final licenceStatusModel = widget.licenceStatusModel;

    print(licenceStatusModel);
    print('hello , is uploaded?');
    print(await userRepo.getKey(isLicenceUploaded));
    print('hello');

    if (await userRepo.getKey(isLicenceUploaded, defaultValue: false) == true &&
        licenceStatusModel != null) {
      if (widget.userType == 'freelancer') {
        context.goNamed(
          "freelancerAccountVerification",
          pathParameters: {
            'verificationStatus': licenceStatusModel.status,
            'userType': widget.userType
          },
        );
      } else if (widget.userType == 'owner') {
        context.goNamed(
          "companyAccountVerification",
          pathParameters: {
            'verificationStatus': licenceStatusModel.status,
            'userType': widget.userType
          },
        );
      }
    } else {
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
  }

  @override
  void onJobApplicationsTap() {
    context.go('$loginRoute/$companyHomePageRoute/$jobAppViewRoute');
  }

  @override
  void onLogoutTap() {
    authCubit.signOut();
  }

  @override
  void onProfileTap() async {
    if (widget.userType == 'freelancer') {
      if (await userRepo.getKey(isProfileCreated, defaultValue: false)) {
        //context.go('$loginRoute/$freelancerHomePageRoute/$freelancerProfileRoute');
      } else {
        //context.go('$loginRoute/$freelancerHomePageRoute/$freelancerProfileRoute')
      }
    } else if (widget.userType == 'owner') {
      if (await userRepo.getKey(isProfileCreated, defaultValue: false)) {
        context.go('$loginRoute/$companyHomePageRoute/$companyProfileRoute');
      } else {
        context.go(
            '$mainRoute/$loginRoute/$companyHomePageRoute/${editCompanyProfileRoute.replaceFirst(
          ':title',
          'create Profile',
        )}');
      }
    } else {
      if (await userRepo.getKey(isProfileCreated, defaultValue: false)) {
        //context.go('$loginRoute/$customerHomePageRoute/$customerProfileRoute');
      } else {
        //context.go('$loginRoute/$customerHomePageRoute/$customerProfileRoute');
      }
    }
  }

  @override
  void onTryAgainTap() {
    jobsCubit.getJobs();
  }

  final List<String> companyTitles = [
    'Post a job',
    'Account Verification',
    'Jobs Applications',
    'Followings',
    'Profile',
    'Settings',
  ];
  final List<String> freelancerTitles = [
    'Account Verification',
    'My applications',
    'Freelance projects',
    'Saved posts ',
    'Followings',
    'Profile',
    'Settings',
  ];
  final List<String> customerTitles = [
    'Ordered services',
    'Profile',
    'Settings',
  ];

  final List<String> freelancerIcons = [
    verifiedIcon,
    applyIcon,
    freelancerProjectIcon,
    savedIcon,
    followingsIcon,
    profileIcon,
    settingsIcon,
  ];
  final List<String> companyIcons = [
    addPostIcon,
    verifiedIcon,
    applyIcon,
    followingsIcon,
    profileIcon,
    settingsIcon,
  ];
  final List<String> customerIcons = [
    orderedServicesIcon,
    profileIcon,
    settingsIcon,
  ];

  late final List<VoidCallback> freelancerCallBacks = [
    onAccountVerifyTap,
    onMyApplicationsTap,
    onFreelanceProjectsTap,
    onSavedPostsTap,
    onFollowingsTap,
    onProfileTap,
    onSettingsTap,
  ];

  late final List<VoidCallback> companyCallBacks = [
    onPostAJobsTap,
    onAccountVerifyTap,
    onJobApplicationsTap,
    onFollowingsTap,
    onProfileTap,
    onSettingsTap,
  ];

  late final List<VoidCallback> customerCallBacks = [
    onOrderedServicesTap,
    onProfileTap,
    onSettingsTap,
  ];

  List<bool> isCategorySelected = List.generate(
    JobCategoryEnum.values.length,
    (index) => false,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MainDrawer(
          backgroundImage: widget.userType == 'freelancer'
              ? freelancerBackgroundImage
              : widget.userType == 'owner'
                  ? companyBackground
                  : customerBackground,
          logout: onLogoutTap,
          callBacks: widget.userType == 'freelancer'
              ? freelancerCallBacks
              : widget.userType == 'owner'
                  ? companyCallBacks
                  : customerCallBacks,
          icons: widget.userType == 'freelancer'
              ? freelancerIcons
              : widget.userType == 'owner'
                  ? companyIcons
                  : customerIcons,
          titles: widget.userType == 'freelancer'
              ? freelancerTitles
              : widget.userType == 'owner'
                  ? companyTitles
                  : customerTitles,
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
                  itemCount: JobCategoryEnum.values.length,
                  itemBuilder: (context, index) {
                    final item = JobCategoryEnum.values[index];
                    return MainActionButton(
                      icon: item.icon,
                      onTap: () => onCategorySelected(index),
                      text: item.name,
                      textColor: isCategorySelected[index]
                          ? const Color(0xFF0B2244)
                          : const Color(0xFFF6F6F6),
                      buttonColor: isCategorySelected[index]
                          ? const Color(0xFFF6F6F6)
                          : const Color(0xFF0B2244),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 5,
                    );
                  },
                ),
              ),
              BlocConsumer<JobsCubit, GeneralJobsState>(
                listener: (context, state) {
                  if (state is DeleteJobSuccess) {
                    context.loaderOverlay.hide();
                    showSnackBarMethod(
                      context,
                      'JobPost is deleted successfully',
                      AppColors.green,
                    );
                  } else if (state is JobsFail) {
                    context.loaderOverlay.hide();
                    showSnackBarMethod(
                      context,
                      state.error,
                      AppColors.red,
                    );
                  } else if (state is DeleteJobLoading) {
                    context.loaderOverlay.show();
                  } else if (state is DeleteJobFail) {
                    context.loaderOverlay.hide();
                    showSnackBarMethod(
                      context,
                      state.message,
                      AppColors.red,
                    );
                  }
                },
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
                                                const Spacer(),
                                                if (widget.userType == 'owner')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: SizedBox(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          InkWell(
                                                            onTap: () =>
                                                                onEditTap(item),
                                                            child: const Icon(Icons
                                                                .edit_outlined),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          InkWell(
                                                            onTap: () =>
                                                                onDeleteTap(
                                                                    item.id),
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
                                                    item.workNature.displayName,
                                                    '${item.salary} SP',
                                                    item.jobType.displayName,
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
                                              email: 'faris@gmail.com',
                                              phoneNumber: '+963768466036',
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
