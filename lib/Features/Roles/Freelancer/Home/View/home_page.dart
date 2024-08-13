import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/filter_bottom_sheet.dart';
import 'package:empco/Core/Widgets/main_show_bottom_sheet.dart';
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

  void onFilterTap();

  void onTypeSelected();

  void onWorkNatureSelected();

  void onLocationChanged(String location);

  void onLocationSubmitted(String location);

  void onMinimumSalaryChanged(String minimumSalary);

  void onMinimumSalarySubmitted(String minimumSalary);

  void onCancelTap();

  void onApplyFiltersTap();
}

class FreelancerHomePage extends StatefulWidget {
  const FreelancerHomePage({super.key});

  @override
  State<FreelancerHomePage> createState() => _FreelancerHomePageState();
}

class _FreelancerHomePageState extends State<FreelancerHomePage>
    implements HomePageCallBacks {
  final locationFocusNode = FocusNode();
  final minimumSalaryFocusNode = FocusNode();
  @override
  void initState() {
    searchJobController = TextEditingController();
    super.initState();
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
        onFilterTap: onFilterTap,
        onNotificationTap: onNotificationTap,
        screenWidth: screenWidth,
        searchJobController: searchJobController,
      ),
    );
  }
}
