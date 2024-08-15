import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/jop_post_text_field.dart';
import 'package:empco/Core/Widgets/notification_icon.dart';
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

class ServicePostView extends StatefulWidget {
  const ServicePostView({super.key});

  @override
  State<ServicePostView> createState() => _ServicePostViewState();
}

class _ServicePostViewState extends State<ServicePostView>
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
        appBar: EmpcoAppBar(
          title: const Text(
            'Post new service',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
          ),
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
                const TitleWidget(text: 'Service title'),
                const SizedBox(height: 8),
                const SubTitleWidget(
                    text: 'Use a title that describes the service'),
                const SizedBox(height: 8),
                MainTextField(
                  focusNode: titleFocusNode,
                  onChanged: onTitleChanged,
                  onSubmitted: onTitleSubmitted,
                  hintText: 'e.g. “Video Editing”',
                ),
                const SizedBox(height: 25),
                const TitleWidget(text: 'Description'),
                const SizedBox(height: 8),
                const SubTitleWidget(
                    text:
                        'Provide a short description about the service, use key points.'),
                const SizedBox(height: 8),
                MainTextField(
                  focusNode: descriptionFocusNode,
                  onChanged: onDescriptionChanged,
                  onSubmitted: onDescriptionSubmitted,
                  hintText: '250 words',
                  height: 300,
                  width: 330,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 200),
                //   child: MaterialButton(
                //     onPressed: () {},
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5)),
                //     child: Row(
                //       children: [
                //         Image.asset(
                //           aiIcon,
                //           width: 25,
                //         ),
                //         const SizedBox(
                //           width: 5,
                //         ),
                //         const Text(
                //           'write with Ai',
                //           style: TextStyle(
                //             fontFamily: 'RR',
                //             fontSize: 12,
                //             color: Color(0xffC164D0),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                const SizedBox(height: 25),
                const TitleWidget(text: 'Category'),
                const SizedBox(height: 25),

                const SizedBox(height: 25),
                const TitleWidget(text: 'Estimated time'),
                const SizedBox(height: 8),
                const SubTitleWidget(
                    text:
                        'set the esimated time to deliver the service (in days)'),
                const SizedBox(height: 8),
                MainTextField(
                  focusNode: locationFocusNode,
                  onChanged: onLocationChanged,
                  onSubmitted: onLocationSubmitted,
                  hintText: 'e.g. “2 day”',
                ),
                const SizedBox(height: 25),
                const TitleWidget(text: 'Price'),
                const SizedBox(height: 8),
                const SubTitleWidget(
                    text: 'What is the price of this service?'),
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
