import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/Widgets/show_dialog.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/bloc/licence_cubit/cubit/licence_cubit.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/models/licence_status_model/licence_status_model.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Features/Auth/bloc/auth_bloc.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/View/Widgets/widgets.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/cubit/jobs_cubit.dart';
import 'package:empco/Features/Roles/Freelancer/job_your_company/job_main_info.dart';
import 'package:empco/Features/Roles/common_pages/empco_home_page/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class JobsCallBacks {
  void onNotificationTap();

  void onJobTap(JobModel job);

  void onExpandJopTap(int jobId);

  void onEditTap(JobModel job);

  void onDeleteTap(int jobId);

  void onAcceptDeleteTap(int jobId);

  void onCancelDeleteTap();

  void onSearchChaged(String input);

  void onSearchSubmitted(String input);

  void onAccountVerifyTap();

  void onJobApplicationsTap();

  void onProfileTap();

  void onSettingsTap();

  void onLogoutTap();

  void onFollowingsTap();

  void onPostAJobsTap();
}

class CompanyJobsView extends StatelessWidget {
  const CompanyJobsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => config<JobsCubit>(),
        ),
        BlocProvider(
          create: (context) => config<AuthBloc>(),
        )
      ],
      child: BlocBuilder<LicenceCubit, GeneralLicenceState>(
        builder: (context, state) {
          LicenceStatusModel? licenceStatusModel;
          if (state is LicenceSuccess) {
            licenceStatusModel = state.licence;
          }
          return CompanyJobsPage(
            licenceStatusModel: licenceStatusModel,
          );
        },
      ),
    );
  }
}

bool haveNewNotification = true;

class CompanyJobsPage extends StatefulWidget {
  const CompanyJobsPage({
    super.key,
    this.licenceStatusModel,
  });

  final LicenceStatusModel? licenceStatusModel;

  @override
  State<CompanyJobsPage> createState() => _CompanyJobsPageState();
}

class _CompanyJobsPageState extends State<CompanyJobsPage>
    implements JobsCallBacks {
  late final AuthBloc authBloc = context.read();

  late final JobsCubit jobsCubit = context.read();

  late final UserRepo userRepo = context.read();

  late final LicenceCubit licenceCubit = context.read();

  final List<String> companyTitles = [
    'Post a job',
    'Account Verification',
    'Jobs Applications',
    'Followings',
    'Profile',
    'Settings',
  ];

  final List<String> companyIcons = [
    addPostIcon,
    verifiedIcon,
    applyIcon,
    followingsIcon,
    profileIcon,
    settingsIcon,
  ];

  late final List<VoidCallback> companyCallBacks = [
    onPostAJobsTap,
    onAccountVerifyTap,
    onJobApplicationsTap,
    onFollowingsTap,
    onProfileTap,
    onSettingsTap,
  ];

   @override
  void onJobTap(JobModel job) {
    // TODO: implement onJobTap
  }

  @override
  void onAcceptDeleteTap(int jobId) {
    jobsCubit.deleteJobPost(jobId);
  }

  @override
  void onAccountVerifyTap() async {
    final licenceStatusModel = widget.licenceStatusModel;

    print(licenceStatusModel);

    if (await userRepo.getKey(isLicenceUploaded, defaultValue: false) == true &&
        licenceStatusModel != null) {
      context.goNamed(
        "companyAccountVerification",
        pathParameters: {
          'verificationStatus': licenceStatusModel.status,
          'userType': 'owner'
        },
      );
    } else {
      context.go(
        '$loginRoute/$companyHomePageRoute/${uploadLicenceRoute.replaceFirst(
          ':userType',
          'owner',
        )}',
      );
    }
  }

  @override
  void onCancelDeleteTap() {
    Navigator.pop(context);
  }

  @override
  void onDeleteTap(int jobId) {
    empcoShowDialog(
      context,
      onAcceptDeleteTap,
      onCancelDeleteTap,
      jobId,
    );
  }

  @override
  void onEditTap(JobModel job) {
    context.goNamed("jobPostView", extra: job);
  }

  @override
  void onFollowingsTap() {
    context.go(
      '$loginRoute/$companyHomePageRoute/$followingViewRoute',
    );
  }

  @override
  void onJobApplicationsTap() {
    context.go('$loginRoute/$companyHomePageRoute/$jobAppViewRoute');
  }

  @override
  void onLogoutTap() {
    authBloc.add(LogoutEvent());
  }

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
  void onProfileTap() async {
    if (await userRepo.getKey(isProfileCreated, defaultValue: false)) {
      context.go('$loginRoute/$companyHomePageRoute/$companyProfileRoute');
    } else {
      context.go(
          '$mainRoute/$loginRoute/$companyHomePageRoute/$companyProfileRoute/${editCompanyProfileRoute.replaceFirst(
        ':title',
        'create Profile',
      )}');
    }
  }

  @override
  void onSettingsTap() {
    context.go('$loginRoute/$companyHomePageRoute/$settingsRoute');
  }

  @override
  void initState() {
    jobsCubit.getJobs();
    super.initState();
  }

  @override
  onExpandJopTap(int jobId) {
    context.go(
      '$loginRoute/$companyHomePageRoute/${companyJobDetailsViewRoute.replaceFirst(
        ':jobId',
        jobId.toString(),
      )}',
    );
  }

  @override
  onNotificationTap() {
    haveNewNotification = !haveNewNotification;
  }

  @override
  void onSearchChaged(String input) {}

  @override
  void onSearchSubmitted(String input) {}

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenWidth = screenSize.width;
    return SafeArea(
      child: Scaffold(
        drawer: MainDrawer(
          callBacks: companyCallBacks,
          titles: companyTitles,
          icons: companyIcons,
          logout: onLogoutTap,
          backgroundImage: companyBackground,
        ),
        appBar: EmpcoAppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: const SizedBox(),
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
                          Column(
                            children: [
                              Text(
                                'Company posts',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 20.64,
                                      fontWeight: FontWeight.w700),
                                ),
                                textAlign: TextAlign.center,
                              ), // contains : Jobs For You
                              Text(
                                'you can edit or add new services',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color.fromRGBO(110, 109, 109, 1),
                                      fontSize: 9.64,
                                      fontWeight: FontWeight.w700),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              // contains : based on your career
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: state.jobs.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                JobMainInfoCompany(
                                  job: state.jobs[index],
                                  screenWidth: screenWidth,
                                  onExpandJopTap: () =>
                                      onExpandJopTap(state.jobs[index].id),
                                  onEditTap: () => onEditTap(state.jobs[index]),
                                  onDeleteTap: () =>
                                      onDeleteTap(state.jobs[index].id),
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
