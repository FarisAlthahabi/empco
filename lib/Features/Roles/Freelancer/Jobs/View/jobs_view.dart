import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/Loading_Page.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/filter_bottom_sheet.dart';
import 'package:empco/Core/Widgets/main_show_bottom_sheet.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/View/Widgets/widgets.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/cubit/jobs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

class JobsView extends StatelessWidget {
  const JobsView({super.key});

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
  void onSearchChaged(String input) {
  }

  @override
  void onSearchSubmitted(String input) {
  }

  @override
  void onApplyFiltersTap() {
    // TODO: implement onApplyFiltersTap
  }

  @override
  void onCancelTap() {
    // TODO: implement onCancelTap
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

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenWidth = screenSize.width;

    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        appBar: EmpcoAppBar(
          automaticallyImplyLeading: false,
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
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                JobPostDate(
                                  jobPostDate:
                                      '${state.jobs[index].deadTime.hour.toString()} hours',
                                  screenWidth: screenWidth,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                JobMainInfo(
                                  job: state.jobs[index],
                                  screenWidth: screenWidth,
                                  onApplyTap: () {
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
