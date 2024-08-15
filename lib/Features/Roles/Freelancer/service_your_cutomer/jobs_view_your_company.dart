import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/Loading_Page.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/filter_bottom_sheet.dart';
import 'package:empco/Core/Widgets/main_show_bottom_sheet.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/View/Widgets/widgets.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/cubit/jobs_cubit.dart';
import 'package:empco/Features/Roles/Freelancer/service_your_cutomer/job_main_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class JobsCallBacks {
  void onNotificationTap();

  void onExpandJopTap(BuildContext context, int jobId);

  void onFavoriteTap();

  void onMessageTap();

  void onApplyTap();

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
}

class ServiceYourCustomer extends StatelessWidget {
  const ServiceYourCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<JobsCubit>(),
      child: const JobsPage(),
    );
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
  onApplyTap() {}

  @override
  onExpandJopTap(BuildContext context, int jobId) {
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
  }

  @override
  void onCancelTap() {
  }

  @override
  void onLocationChanged(String location) {
  }

  @override
  void onLocationSubmitted(String location) {
  }

  @override
  void onMinimumSalaryChanged(String minimumSalary) {
  }

  @override
  void onMinimumSalarySubmitted(String minimumSalary) {
  }

  @override
  void onTypeSelected() {
  }

  @override
  void onWorkNatureSelected() {
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenWidth = screenSize.width;
    List<JobModel> jobs = [
      JobModel(
        id: 1,
        title: 'Software Engineer',
        body:
            'We are seeking an experienced Software Engineer to join our team.',
        requiredSkills: 'Spring',
        salary: 80000,
        jobType: 'Full-Time',
        location: 'New York, NY',
        deadTime: DateTime(2023, 12, 31),
        categoryId: 1,
        ownerId: 1,
        createdAt: DateTime(2023, 8, 1),
        updatedAt: DateTime(2023, 8, 10),
      ),
      JobModel(
        id: 1,
        title: 'Software Engineer',
        body:
            'We are seeking an experienced Software Engineer to join our team.',
        requiredSkills: 'Spring',
        salary: 80000,
        jobType: 'Full-Time',
        location: 'New , NY',
        deadTime: DateTime(2023, 12, 31),
        categoryId: 1,
        ownerId: 1,
        createdAt: DateTime(2023, 8, 1),
        updatedAt: DateTime(2023, 8, 10),
      ),
      JobModel(
        id: 1,
        title: 'Software Engineer',
        body: 'We .',
        requiredSkills: 'Spring',
        salary: 80000,
        jobType: 'Full-Time',
        location: 'Ne NY',
        deadTime: DateTime(2023, 12, 31),
        categoryId: 1,
        ownerId: 1,
        createdAt: DateTime(2023, 8, 1),
        updatedAt: DateTime(2023, 8, 10),
      ),
    ];
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
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
        body: BlocBuilder<JobsCubit, JobsState>(
          builder: (context, state) {
            if (state is JobsLoading) {
              return const LoadingPage();
            } else if (state is JobsSuccess) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      width: 0.83 * screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Services feed',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                ),
                                textAlign: TextAlign.center,
                              ), // contains : Jobs For You
                              Text(
                                'discover different choices',
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
                          itemCount: jobs.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                ServiceMainInfoCustomer(
                                  job: jobs[index],
                                  screenWidth: screenWidth,
                                  onOrderTap: () {
                                    onApplyTap();
                                  },
                                  onExpandJopTap: () {
                                    onExpandJopTap(
                                        context, state.jobs[index].id);
                                  },
                                  onFavoriteTap: () {
                                    onFavoriteTap();
                                  },
                                  onMessageTap: () {
                                    onMessageTap();
                                  },
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
