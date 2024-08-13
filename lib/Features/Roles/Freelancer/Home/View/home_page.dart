import 'package:empco/Core/di/di.dart';
import 'package:empco/Features/Auth/bloc/auth_bloc.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/cubit/jobs_cubit.dart';
import 'package:empco/Features/Roles/common_pages/empco_home_page/empco_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late TextEditingController searchJobController;
bool haveNewNotification = true;

abstract class HomePageCallBacks {
  void onNotificationTap();
}

class FreelancerHomePage extends StatefulWidget {
  const FreelancerHomePage({super.key});

  @override
  State<FreelancerHomePage> createState() => _FreelancerHomePageState();
}

class _FreelancerHomePageState extends State<FreelancerHomePage>
    implements HomePageCallBacks {
  @override
  void initState() {
    searchJobController = TextEditingController();
    super.initState();
  }

  @override
  onNotificationTap() {
    setState(() {
      haveNewNotification = !haveNewNotification;
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenWidth = screenSize.width;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => config<JobsCubit>(),
        ),
        BlocProvider(
          create: (context) => config<AuthBloc>(),
        )
      ],
      child: EmpcoHomePage(
        haveNewNotification: haveNewNotification,
        onNotificationTap: onNotificationTap,
        screenWidth: screenWidth,
        searchJobController: searchJobController,
      ),
    );
  }
}
