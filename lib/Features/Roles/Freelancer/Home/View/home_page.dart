import 'package:empco/Features/Roles/VAR_GLOBAL.dart';
import 'package:empco/Features/Roles/common_pages/empco_home_page/empco_home_page.dart';
import 'package:flutter/material.dart';

late TextEditingController searchJobController;
bool haveNewNotification = true;

abstract class HomePageCallBacks {
  onNotificationTap();

  onFilterTap();
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
  onFilterTap() {}

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

    return EmpcoHomePage(
      intSideBar: sidebarr,
      haveNewNotification: haveNewNotification,
      onFilterTap: onFilterTap,
      onNotificationTap: onNotificationTap,
      screenWidth: screenWidth,
      searchJobController: searchJobController,
    );
  }
}
