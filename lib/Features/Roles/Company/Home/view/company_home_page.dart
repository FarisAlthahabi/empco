import 'package:empco/Core/Widgets/show_dialog.dart';
import 'package:empco/Features/Roles/common_pages/empco_home_page/empco_home_page.dart';
import 'package:flutter/material.dart';

abstract class CompanyHomePageCallBacks {
  void onNotificationTap();

  void onDeleteTap();

  void onEditTap();
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
        onDeleteTap: onDeleteTap,
        onEditTap: onEditTap,
        searchJobController: searchJobController,
        haveNewNotification: haveNewNotification,
        screenWidth: screenWidth);
  }
}
