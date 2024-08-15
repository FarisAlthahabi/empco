import 'package:empco/Core/di/di.dart';
import 'package:empco/Features/Auth/bloc/auth_bloc.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/cubit/jobs_cubit.dart';
import 'package:empco/Features/Roles/common_pages/empco_home_page/empco_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CompanyHomePageCallBacks {
  void onNotificationTap();
}

late TextEditingController searchJobController;
bool haveNewNotification = true;

class CompanyHomePage extends StatefulWidget {
  const CompanyHomePage({super.key});

  @override
  State<CompanyHomePage> createState() => _CompanyHomePageState();
}

class _CompanyHomePageState extends State<CompanyHomePage>
    implements CompanyHomePageCallBacks {
  late final JobsCubit jobsCubit = context.read();

  final locationFocusNode = FocusNode();

  final minimumSalaryFocusNode = FocusNode();

  @override
  void onNotificationTap() {
    setState(() {
      haveNewNotification = !haveNewNotification;
    });
  }

  @override
  void initState() {
    searchJobController = TextEditingController();
    super.initState();
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
      child: EmpcoHomePageView(
        userType: 'owner',
        onNotificationTap: onNotificationTap,
        searchJobController: searchJobController,
        haveNewNotification: haveNewNotification,
        screenWidth: screenWidth,
      ),
    );
  }
}
