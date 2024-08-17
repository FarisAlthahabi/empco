import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/View/Widgets/widgets.dart';
import 'package:empco/Features/Roles/Freelancer/service_your_emloyee/cubit/service_cubit.dart';
import 'package:empco/Features/Roles/Freelancer/service_your_emloyee/job_main_info.dart';
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

  void onSearchChaged(String input);

  void onSearchSubmitted(String input);
}

class ServiceYourEmployee extends StatelessWidget {
  const ServiceYourEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<ServiceCubit>(),
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
  late final ServiceCubit serviceCubit = context.read();

  final locationFocusNode = FocusNode();
  final minimumSalaryFocusNode = FocusNode();

  @override
  void initState() {
    serviceCubit.getServices();
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
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenWidth = screenSize.width;
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        appBar: EmpcoAppBar(
          centerTitle: true,
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
        body: BlocBuilder<ServiceCubit, GeneralServiceState>(
          builder: (context, state) {
            if (state is ServiceLoading) {
              return const LoadingIndicator();
            } else if (state is ServiceSuccess) {
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
                                'Your Services',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                ),
                                textAlign: TextAlign.center,
                              ), // contains : Jobs For You
                              Text(
                                'you can view, edit or add new services',
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
                          itemCount: state.services.length,
                          itemBuilder: (context, index) {
                            final item = state.services[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                ServiceMainInfoEmployee(
                                  serviceModel: item,
                                  screenWidth: screenWidth,
                                  onApplyTap: () {
                                    onApplyTap();
                                  },
                                  onExpandJopTap: () {
                                    onExpandJopTap(
                                        context, item.id);
                                  },
                                  onEditTap: () {
                                    onFavoriteTap();
                                  },
                                  onDeleteTap: () {
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
            } else if (state is ServiceFail) {
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
