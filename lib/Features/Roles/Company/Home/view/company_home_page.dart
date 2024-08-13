import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/filter_bottom_sheet.dart';
import 'package:empco/Core/Widgets/main_show_bottom_sheet.dart';
import 'package:empco/Core/Widgets/show_dialog.dart';
import 'package:empco/Features/Roles/common_pages/empco_home_page/empco_home_page.dart';
import 'package:flutter/material.dart';

abstract class CompanyHomePageCallBacks {
  void onNotificationTap();

  void onFilterTap();

  void onDeleteTap();

  void onEditTap();

  void onTypeSelected();

  void onWorkNatureSelected();

  void onLocationChanged(String location);

  void onLocationSubmitted(String location);

  void onMinimumSalaryChanged(String minimumSalary);

  void onMinimumSalarySubmitted(String minimumSalary);

  void onCancelTap();

  void onApplyFiltersTap();
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
  final locationFocusNode = FocusNode();

  final minimumSalaryFocusNode = FocusNode();

  @override
  void onDeleteTap() {
    empcoShowDialog(context);
  }

  @override
  void onEditTap() {}

  @override
  void onApplyFiltersTap() {
    // TODO: implement onApplyFiltersTap
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
    return EmpcoHomePage(
        onNotificationTap: onNotificationTap,
        onFilterTap: onFilterTap,
        onDeleteTap: onDeleteTap,
        onEditTap: onEditTap,
        searchJobController: searchJobController,
        haveNewNotification: haveNewNotification,
        screenWidth: screenWidth);
  }
}
