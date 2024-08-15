import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/job_details_contact.dart';
import 'package:empco/Features/Roles/Freelancer/service_details_employee/widgets/details_service_main_info.dart';

import 'package:empco/Features/Roles/common_pages/empco_job_details/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'widgets/details_service_description.dart';

abstract class DetailsServiceViewCallBacks {
  onAddToFavoriteTap();

  onDeleteTap();

  onEditTap();
}

class DetailsServiceViewEmployee extends StatelessWidget {
  const DetailsServiceViewEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailsServicePage();
  }
}

class DetailsServicePage extends StatefulWidget {
  const DetailsServicePage({
    super.key,
  });

  @override
  State<DetailsServicePage> createState() => _DetailsServicePageState();
}

class _DetailsServicePageState extends State<DetailsServicePage>
    implements DetailsServiceViewCallBacks {
  @override
  onAddToFavoriteTap() {
    // TODO: implement onAddToFavoriteTap
    throw UnimplementedError();
  }

  @override
  onEditTap() {
    // TODO: implement onApplyTap
    throw UnimplementedError();
  }

  @override
  onDeleteTap() {
    // TODO: implement onMessageTap
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenWidth = screenSize.width;
    return SafeArea(
        child: Scaffold(
      appBar: const EmpcoAppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Service Details',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
          ),
        ),
        height: 30,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            JobDetailsHead(
              onAddToFavoriteTap: onAddToFavoriteTap,
              title: '',
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: ServiceDetailsMainInfoEmployee(
                    screenWidth: screenWidth,
                    onEditTap: onEditTap,
                    onDeleteTap: onDeleteTap,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: DetailsServiceDescription(
                screenWidth: screenWidth,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: JobContactDetails(),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
