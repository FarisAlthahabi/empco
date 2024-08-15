import 'package:empco/Features/Roles/Company/Home/view/company_home_page.dart';
import 'package:empco/Features/Roles/Company/chat/view/company_chat_page.dart';
import 'package:empco/Features/Roles/Company/jop_post/view/job_post_view.dart';
import 'package:empco/Features/Roles/Company/services/view/company_services_page.dart';
import 'package:empco/Features/Roles/common_pages/empco_navigation_bar/empco_navigation_bar.dart';
import 'package:flutter/material.dart';

class CompanyNavigationBar extends StatelessWidget {
  const CompanyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return EmpcoNavigationBarView(pages: pages);
  }
}
final List<Widget>pages = [
  const CompanyHomePage(),
  const JobPostView(),
  const CompanyChatPage(),
  const CompanyServicesPage()
];