import 'package:auto_route/auto_route.dart';
import 'package:empco/Features/Roles/Freelancer/Chat/View/Chat_Page.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/View/jobs_view.dart';
import 'package:empco/Features/Roles/Freelancer/Home/View/home_page.dart';
import 'package:empco/Features/Roles/Freelancer/Services/View/Show_Services_Page.dart';
import 'package:empco/Features/Roles/common_pages/empco_navigation_bar/empco_navigation_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FreelancerNavigationBarView extends StatelessWidget {
  const FreelancerNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return EmpcoNavigationBarView(pages: pages);
  }
}
final List<Widget>pages = [
  const FreelancerHomePage(),
  const JobsView(),
  const ChatPage(),
  const ShowServicesPage()
];
