import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/jop_post_text_field.dart';
import 'package:empco/Core/Widgets/notification_icon.dart';
import 'package:empco/Features/Roles/Company/jop_post/view/widgets/job_post_option_widget.dart';
import 'package:empco/Features/Roles/Company/jop_post/view/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

bool haveNewNotification = true;

abstract class JobPostViewCallBacks {
  void onNotificationTap();

  void onTitleChanged(String title);

  void onTitleSubmitted(String title);

  void onDescriptionChanged(String description);

  void onDescriptionSubmitted(String description);

  void onLocationChanged(String location);

  void onLocationSubmitted(String location);

  void onSalaryChanged(String salary);

  void onSalarySubmitted(String salary);

  void onPostTap();

  void onResetTap();

  void onDatePicked();

  void onTypeChosen();

  void onWorkNatureChosen();
}

class JobPostView extends StatefulWidget {
  const JobPostView({super.key});

  @override
  State<JobPostView> createState() => _JobPostViewState();
}

class _JobPostViewState extends State<JobPostView>
    implements JobPostViewCallBacks {
  @override
  void onNotificationTap() {
    setState(() {
      haveNewNotification = !haveNewNotification;
    });
  }

  @override
  void onTypeChosen() {}

  @override
  void onWorkNatureChosen() {}

  @override
  void onDatePicked() {}

  @override
  void onDescriptionChanged(String description) {}

  @override
  void onDescriptionSubmitted(String description) {
    locationFocusNode.requestFocus();
  }

  @override
  void onLocationChanged(String location) {}

  @override
  void onLocationSubmitted(String location) {
    salaryFocusNode.requestFocus();
  }

  @override
  void onPostTap() {}

  @override
  void onResetTap() {}

  @override
  void onSalaryChanged(String salary) {}

  @override
  void onSalarySubmitted(String salary) {}

  @override
  void onTitleChanged(String title) {}

  @override
  void onTitleSubmitted(String title) {
    descriptionFocusNode.requestFocus();
  }

  @override
  void dispose() {
    titleFocusNode.dispose();
    descriptionFocusNode.dispose();
    locationFocusNode.dispose();
    salaryFocusNode.dispose();
    super.dispose();
  }

  final titleFocusNode = FocusNode();

  final descriptionFocusNode = FocusNode();

  final locationFocusNode = FocusNode();

  final salaryFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        appBar: EmpcoAppBar(
          automaticallyImplyLeading: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: NotificationIcon(
                  haveNewNotification: haveNewNotification,
                  onTap: onNotificationTap),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleWidget(text: 'Job title'),
                const SizedBox(height: 8),
                const SubTitleWidget(
                    text: 'Use a title that describes one position only'),
                const SizedBox(height: 8),
                MainTextField(
                  focusNode: titleFocusNode,
                  onChanged: onTitleChanged,
                  onSubmitted: onTitleSubmitted,
                  hintText: 'e.g. “Front-End Developer”',
                ),
                const SizedBox(height: 25),
                const TitleWidget(text: 'Description'),
                const SizedBox(height: 8),
                const SubTitleWidget(
                    text:
                        'Provide a short description about the job, use key points.'),
                const SizedBox(height: 8),
                MainTextField(
                  focusNode: descriptionFocusNode,
                  onChanged: onDescriptionChanged,
                  onSubmitted: onDescriptionSubmitted,
                  hintText: '250 words',
                  height: 300,
                  width: 330,
                ),
                const SizedBox(height: 25),
                const TitleWidget(text: 'Type'),
                const SizedBox(height: 12),
                const SubTitleWidget(text: 'Select the type of the Job'),
                const SizedBox(height: 12),
                Row(
                  children: [
                    JobPostOptionWidget(
                      text: 'Full-time',
                      icon: Icons.abc,
                      onTap: onTypeChosen,
                    ),
                    const SizedBox(width: 12),
                    JobPostOptionWidget(
                      text: 'Full-time',
                      icon: Icons.abc,
                      onTap: onTypeChosen,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const TitleWidget(text: 'Work nature'),
                const SizedBox(height: 12),
                const SubTitleWidget(text: 'Select the nature of the Job'),
                const SizedBox(height: 12),
                Row(
                  children: [
                    JobPostOptionWidget(
                      text: 'On-Site',
                      icon: Icons.abc,
                      onTap: onWorkNatureChosen,
                    ),
                    const SizedBox(width: 12),
                    JobPostOptionWidget(
                      text: 'On-Site',
                      icon: Icons.abc,
                      onTap: onWorkNatureChosen,
                    ),
                    const SizedBox(width: 12),
                    JobPostOptionWidget(
                      text: 'On-Site',
                      icon: Icons.abc,
                      onTap: onWorkNatureChosen,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const TitleWidget(text: 'Deadline'),
                const SizedBox(height: 12),
                const SubTitleWidget(text: 'set a date as a deadline to apply'),
                const SizedBox(height: 12),
                Row(
                  children: [
                    JobPostOptionWidget(
                      text: 'Pick Date',
                      onTap: onDatePicked,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const TitleWidget(text: 'Location'),
                const SizedBox(height: 8),
                const SubTitleWidget(text: 'Select the Location of the Job'),
                const SizedBox(height: 8),
                MainTextField(
                  focusNode: locationFocusNode,
                  onChanged: onLocationChanged,
                  onSubmitted: onLocationSubmitted,
                  hintText: 'e.g. “Damascus, Syria”',
                ),
                const SizedBox(height: 25),
                const TitleWidget(text: 'Salary'),
                const SizedBox(height: 8),
                const SubTitleWidget(
                    text: 'What will the Salary for this job be?'),
                const SizedBox(height: 8),
                MainTextField(
                  focusNode: salaryFocusNode,
                  onChanged: onSalaryChanged,
                  onSubmitted: onSalarySubmitted,
                  hintText: 'e.g. 20,000',
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MainActionButton(
                        onTap: onResetTap,
                        text: 'Reset',
                        fontSize: 12.3,
                        textColor: AppColors.black,
                        buttonColor: const Color.fromRGBO(239, 242, 245, 1),
                        blurRadius: 176,
                        width: 92,
                        height: 30,
                      ),
                      const SizedBox(width: 15),
                      MainActionButton(
                        onTap: onPostTap,
                        text: 'Post',
                        fontSize: 12.3,
                        textColor: AppColors.white,
                        buttonColor: AppColors.blue,
                        blurRadius: 176,
                        width: 92,
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
