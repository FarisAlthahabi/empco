import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/filter_bottom_sheet.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/Widgets/main_show_bottom_sheet.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Features/Auth/bloc/auth_bloc.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/View/Widgets/widgets.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/cubit/jobs_cubit.dart';
import 'package:empco/Features/Roles/common_pages/empco_home_page/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class JobsCallBacks {
  void onNotificationTap();

  void onExpandJopTap(int jobId);

  void onFavoriteTap();

  void onMessageTap();

  void onApplyTap(int jobId);

  void onFilterTap();

  void onSearchChaged(String input);

  void onSearchSubmitted(String input);

  void onTypeSelected();

  void onWorkNatureSelected();

  void onLocationChanged(String location);

  void onLocationSubmitted(String location);

  void onMinimumSalaryChanged(String minimumSalary);

  void onMinimumSalarySubmitted(String minimumSalary);

  void onCancelTap();

  void onApplyFiltersTap();

  void onAccountVerifyTap();

  void onProfileTap();

  void onSettingsTap();

  void onLogoutTap();

  void onMyApplicationsTap();

  void onFreelanceProjectsTap();

  void onSavedPostsTap();

  void onFollowingsTap();
}

class JobsView extends StatelessWidget {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) 
   {
    return MultiBlocProvider(providers: [
      BlocProvider(
      create: (context) => config<JobsCubit>(),
    ),
    BlocProvider(
      create: (context) => config<AuthBloc>(),
    ),
    ], child: const JobsPage(),);
  }
}

late TextEditingController searchJobController;
bool haveNewNotification = true;

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> implements JobsCallBacks {
  late final JobsCubit jobsCubit = context.read();

  final locationFocusNode = FocusNode();
  final minimumSalaryFocusNode = FocusNode();

  @override
  void initState() {
    jobsCubit.getJobs();
    searchJobController = TextEditingController();
    super.initState();
  }

  @override
  void onAccountVerifyTap() {
    // TODO: implement onAccountVerifyTap
  }

  @override
  void onFollowingsTap() {
    // TODO: implement onFollowingsTap
  }

  @override
  void onFreelanceProjectsTap() {
     context.go(
      '$loginRoute/$freelancerHomePageRoute/$freelanceProjectsViewRoute',
    );
  }

  @override
  void onLogoutTap() {
    // TODO: implement onLogoutTap
  }

  @override
  void onMyApplicationsTap() {
    // TODO: implement onMyApplicationsTap
  }

  @override
  void onProfileTap() {
    // TODO: implement onProfileTap
  }

  @override
  void onSavedPostsTap() {
    // TODO: implement onSavedPostsTap
  }

  @override
  void onSettingsTap() {
    // TODO: implement onSettingsTap
  }

  @override
  onApplyTap(int jobId) {
    context.go(
        '$loginRoute/$freelancerHomePageRoute/${applyJobViewRoute.replaceFirst(
      ':jobId',
      jobId.toString(),
    )}');
  }

  @override
  onExpandJopTap(int jobId) {
    context.go(
      '$loginRoute/$freelancerHomePageRoute/${jobDetailsRoute.replaceFirst(
        ':jobId',
        jobId.toString(),
      )}',
    );
  }

  @override
  onFavoriteTap() {}

  @override
  onFilterTap() {
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
  onMessageTap() {}

  @override
  onNotificationTap() {
    haveNewNotification = !haveNewNotification;
  }

  @override
  void onSearchChaged(String input) {}

  @override
  void onSearchSubmitted(String input) {}

  @override
  void onApplyFiltersTap() {
    Navigator.pop(context);
  }

  @override
  void onCancelTap() {
    Navigator.pop(context);
  }

  @override
  void onLocationChanged(String location) {
    // TODO: implement onLocationChanged
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
  void onTypeSelected() {
    // TODO: implement onTypeSelected
  }

  @override
  void onWorkNatureSelected() {
    // TODO: implement onWorkNatureSelected
  }

  final List<String> freelancerTitles = [
    'Account Verification',
    'My applications',
    'Freelance projects',
    'Saved posts ',
    'Followings',
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
  late final List<VoidCallback> freelancerCallBacks = [
    onAccountVerifyTap,
    onMyApplicationsTap,
    onFreelanceProjectsTap,
    onSavedPostsTap,
    onFollowingsTap,
    onProfileTap,
    onSettingsTap,
  ];

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenWidth = screenSize.width;

    return SafeArea(
      child: Scaffold(
        drawer: MainDrawer(
          callBacks: freelancerCallBacks,
          titles: freelancerTitles,
          icons: freelancerIcons,
          logout: onLogoutTap,
          backgroundImage: freelancerBackgroundImage,
        ),
        appBar: EmpcoAppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: SearchTextField(
            onChanged: onSearchChaged,
            onSubmitted: onSearchSubmitted,
            searchJobController: searchJobController,
            screenWidth: screenWidth,
          ), // Search TextField
          actions: [
            const SizedBox(
              width: 25,
            ),
            NotificationIcon(
              //   Notification Icon Button
              haveNewNotification: haveNewNotification,
              onTap: () {
                setState(() {
                  onNotificationTap();
                });
              },
            ),
            const SizedBox(
              width: 25,
            ),
          ],
        ),
        body: BlocBuilder<JobsCubit, GeneralJobsState>(
          builder: (context, state) {
            if (state is JobsLoading) {
              return const LoadingIndicator();
            } else if (state is JobsSuccess) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      width: 0.76 * screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            children: [
                              Text1(), // contains : Jobs For You
                              Text2(), // contains : based on your career
                            ],
                          ),
                          FilterIconButton(
                            // Filter Button
                            onTap: onFilterTap,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: state.jobs.length,
                          itemBuilder: (context, index) {
                            final item = state.jobs[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                JobPostDate(
                                  jobPostDate:
                                      '${item.deadTime.hour.toString()} hours',
                                  screenWidth: screenWidth,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                JobMainInfo(
                                  job: item,
                                  screenWidth: screenWidth,
                                  onApplyTap: () => onApplyTap(item.id),
                                  onExpandJopTap: () => onExpandJopTap(item.id),
                                  onFavoriteTap: onFavoriteTap,
                                  onMessageTap: onMessageTap,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if (state is JobsFail) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
