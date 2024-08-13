import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/job_details_contact.dart';
import 'package:empco/Features/Roles/common_pages/empco_job_details/widgets/widgets.dart';
import 'package:flutter/material.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({
    super.key,
    this.onAddToFavoriteTap,
    this.onApplyTap,
    this.onMessageTap,
    required this.screenWidth,
    this.onEdit,
    this.onDelete,
  });

  final VoidCallback? onAddToFavoriteTap;
  final VoidCallback? onApplyTap;
  final VoidCallback? onMessageTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const EmpcoAppBar(
        height: 30,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            JobDetailsHead(
              onDelete: onDelete,
              onEdit: onEdit,
              onAddToFavoriteTap: onAddToFavoriteTap,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: JobDetailsMainInfo(
                    screenWidth: screenWidth,
                    onApplyTap: onApplyTap,
                    onMessageTap: onMessageTap,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: JobDetailsDescription(
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
