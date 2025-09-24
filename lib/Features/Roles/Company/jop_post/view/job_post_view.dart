import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/jop_post_text_field.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/Widgets/main_drop_down_widget.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/extensions/date_time_x.dart';
import 'package:empco/Features/Roles/Company/jop_post/cubit/job_post_cubit.dart';
import 'package:empco/Features/Roles/Company/jop_post/models/job_category_enum/job_category_enum.dart';
import 'package:empco/Features/Roles/Company/jop_post/models/job_type_enum/job_type_enum.dart';
import 'package:empco/Features/Roles/Company/jop_post/models/job_work_nature_enum/job_work_nature_enum.dart';
import 'package:empco/Features/Roles/Company/jop_post/view/widgets/job_post_option_widget.dart';
import 'package:empco/Features/Roles/Company/jop_post/view/widgets/text_widgets.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

bool haveNewNotification = true;

abstract class JobPostViewCallBacks {
  void onNotificationTap();

  void onTitleChanged(String title);

  void onTitleSubmitted(String title);

  void onDescriptionChanged(String description);

  void onDescriptionSubmitted(String description);

  void onRequiredSkillsChanged(String requiredSkills);

  void onRequiredSkillsSubmitted(String requiredSkills);

  void onLocationChanged(String location);

  void onLocationSubmitted(String location);

  void onSalaryChanged(String salary);

  void onSalarySubmitted(String salary);

  void onPostTap();

  void onResetTap();

  Future<void> onDatePicked();

  void onTypeChosen(JobTypeEnum jobType);

  void onWorkNatureChosen(WorkNatureEnum workNature);

  void onJobCategorySelected(JobCategoryEnum? jobCategory);

  void onWriteWithAiTap();
}

class JobPostView extends StatelessWidget {
  const JobPostView({
    super.key,
    this.job,
  });

  final JobModel? job;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<JobPostCubit>(),
      child: JobPostPage(
        job: job,
      ),
    );
  }
}

class JobPostPage extends StatefulWidget {
  const JobPostPage({
    super.key,
    this.job,
  });

  final JobModel? job;

  @override
  State<JobPostPage> createState() => _JobPostPageState();
}

class _JobPostPageState extends State<JobPostPage>
    implements JobPostViewCallBacks {
  late final JobPostCubit jobPostCubit = context.read();

  JobCategoryEnum? selectedJobCategory;
  DateTime selectedDate = DateTime.now();

  bool isReset = false;

  @override
  void onNotificationTap() {
    setState(() {
      haveNewNotification = !haveNewNotification;
    });
  }

  @override
  void onTypeChosen(JobTypeEnum jobType) {
    jobPostCubit.setJobType(jobType);
  }

  @override
  void onWorkNatureChosen(WorkNatureEnum workNature) {
    jobPostCubit.setWorkNature(workNature);
  }

  @override
  Future<void> onDatePicked() async {
    final DateTime? deadTime = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (deadTime != null) {
      jobPostCubit.setDeadTime(deadTime);
      selectedDate = deadTime;
    }
  }

  @override
  void onJobCategorySelected(JobCategoryEnum? jobCategory) {
    jobPostCubit.setJobCategory(jobCategory);
  }

  @override
  void onDescriptionChanged(String description) {
    jobPostCubit.setBody(description);
    jobPostCubit.setAiDescriptionTitle(description);
  }

  @override
  void onDescriptionSubmitted(String description) {
    requiredSkillsFocusNode.requestFocus();
  }

  @override
  void onRequiredSkillsChanged(String requiredSkills) {
    jobPostCubit.setRequiredSkills(requiredSkills);
  }

  @override
  void onRequiredSkillsSubmitted(String requiredSkills) {
    locationFocusNode.requestFocus();
  }

  @override
  void onLocationChanged(String location) {
    jobPostCubit.setLocation(location);
  }

  @override
  void onLocationSubmitted(String location) {
    salaryFocusNode.requestFocus();
  }

  @override
  void onPostTap() {
    final job = widget.job;
    if (job == null) {
      jobPostCubit.addJobPost();
    } else {
      jobPostCubit.updatejobPost(job.id);
    }
  }

  @override
  void onResetTap() {
    setState(() {
      isReset = true;
    });
  }

  @override
  void onSalaryChanged(String salary) {
    jobPostCubit.setSalary(salary);
  }

  @override
  void onSalarySubmitted(String salary) {
    salaryFocusNode.unfocus();
  }

  @override
  void onTitleChanged(String title) {
    jobPostCubit.setTitle(title);
  }

  @override
  void onTitleSubmitted(String title) {
    descriptionFocusNode.requestFocus();
  }

  @override
  void onWriteWithAiTap() {
    jobPostCubit.getAiDescription();
  }

  @override
  void initState() {
    final jobPost = widget.job;
    if (jobPost != null) {
      jobPostCubit.setTitle(jobPost.title);
      jobPostCubit.setBody(jobPost.body);
      jobPostCubit.setRequiredSkills(jobPost.requiredSkills);
      jobPostCubit.setJobCategory(jobPost.jobCategory);
      jobPostCubit.setJobType(jobPost.jobType);
      jobPostCubit.setWorkNature(jobPost.workNature);
      jobPostCubit.setDeadTime(jobPost.deadTime);
      jobPostCubit.setLocation(jobPost.location);
      jobPostCubit.setSalary(jobPost.salary.toString());
    }
    super.initState();
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

  final requiredSkillsFocusNode = FocusNode();

  final locationFocusNode = FocusNode();

  final salaryFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: EmpcoAppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            widget.job == null ? 'Post a Job' : 'Edit Post Job',
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
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
                      initialValue: isReset ? null : widget.job?.title,
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
                    BlocConsumer<JobPostCubit, GeneralJobPostState>(
                      listener: (context, state) {
                        if (state is AiDescriptionFail) {
                          showSnackBarMethod(
                            context,
                            state.message,
                            AppColors.red,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AiDescriptionLoading) {
                          return const LoadingIndicator();
                        } else {
                          String? initialValue = widget.job?.body;
                          if (state is AiDescriptionSuccess) {
                            initialValue = state.aiDescriptionModel.description;
                          }
                          return MainTextField(
                            initialValue: isReset ? null : initialValue,
                            focusNode: descriptionFocusNode,
                            onChanged: onDescriptionChanged,
                            onSubmitted: onDescriptionSubmitted,
                            hintText: '250 words',
                            maxLines: 8,
                          );
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 200),
                      child: MaterialButton(
                        onPressed: onWriteWithAiTap,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              aiIcon,
                              width: 25,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'write with Ai',
                              style: TextStyle(
                                fontFamily: 'RR',
                                fontSize: 12,
                                color: Color(0xffC164D0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const TitleWidget(text: 'Required Skills'),
                    const SizedBox(height: 8),
                    const SubTitleWidget(text: 'Provide required skills'),
                    const SizedBox(height: 8),
                    MainTextField(
                      initialValue: isReset ? null : widget.job?.requiredSkills,
                      focusNode: requiredSkillsFocusNode,
                      onChanged: onRequiredSkillsChanged,
                      onSubmitted: onRequiredSkillsSubmitted,
                      hintText: 'one year experience',
                    ),
                    const SizedBox(height: 25),
                    const TitleWidget(text: 'Category'),
                    const SizedBox(height: 8),
                    MainDropDownWidget<JobCategoryEnum>(
                        text: 'Select category',
                        onChanged: onJobCategorySelected,
                        items: JobCategoryEnum.values,
                        selectedValue: selectedJobCategory),
                    const SizedBox(height: 25),
                    const TitleWidget(text: 'Type'),
                    const SizedBox(height: 12),
                    const SubTitleWidget(text: 'Select the type of the Job'),
                    const SizedBox(height: 12),
                    Row(
                      children: JobTypeEnum.values
                          .map(
                            (jobType) => Row(
                              children: [
                                JobPostOptionWidget<JobTypeEnum>(
                                  model: jobType,
                                  onTap: onTypeChosen,
                                ),
                                const SizedBox(width: 12),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 25),
                    const TitleWidget(text: 'Work nature'),
                    const SizedBox(height: 12),
                    const SubTitleWidget(text: 'Select the nature of the Job'),
                    const SizedBox(height: 12),
                    Row(
                      children: WorkNatureEnum.values
                          .map(
                            (workNature) => Row(
                              children: [
                                JobPostOptionWidget<WorkNatureEnum>(
                                  model: workNature,
                                  onTap: onWorkNatureChosen,
                                ),
                                const SizedBox(width: 12),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 25),
                    const TitleWidget(text: 'Deadline'),
                    const SizedBox(height: 12),
                    const SubTitleWidget(
                        text: 'set a date as a deadline to apply'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        InkWell(
                          onTap: onDatePicked,
                          child: Container(
                            constraints: const BoxConstraints(minHeight: 25),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.55,
                                    color: const Color(0XFF1B3A68)),
                                borderRadius: BorderRadius.circular(3)),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: JobPostOptionTitle(
                                text: 'Pick Date',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          selectedDate.formatMMddYYYY,
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    const TitleWidget(text: 'Location'),
                    const SizedBox(height: 8),
                    const SubTitleWidget(
                        text: 'Select the Location of the Job'),
                    const SizedBox(height: 8),
                    MainTextField(
                      initialValue: isReset ? null : widget.job?.location,
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
                      initialValue:
                          isReset ? null : widget.job?.salary.toString(),
                      focusNode: salaryFocusNode,
                      onChanged: onSalaryChanged,
                      onSubmitted: onSalarySubmitted,
                      hintText: 'e.g. 20,000',
                    ),
                    const SizedBox(height: 70),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
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
                      height: 30,
                    ),
                    const SizedBox(width: 15),
                    BlocConsumer<JobPostCubit, GeneralJobPostState>(
                      listener: (context, state) {
                        if (state is JobPostSuccess) {
                          showSnackBarMethod(
                            context,
                            "Job is posted successfully",
                            AppColors.green,
                          );
                          context.pop();
                        } else if (state is JobPostUpdateSuccess) {
                          showSnackBarMethod(
                            context,
                            "Job is updated successfully",
                            AppColors.green,
                          );
                          context.pop();
                        } else if (state is JobPostFail) {
                          showSnackBarMethod(
                            context,
                            state.message,
                            AppColors.red,
                          );
                        }
                      },
                      builder: (context, state) {
                        var onTap = onPostTap;
                        Widget? child;
                        if (state is JobPostLoading) {
                          onTap = () {};
                          child = const LoadingIndicator(
                            color: AppColors.black,
                          );
                        }
                        return MainActionButton(
                          onTap: onTap,
                          text: widget.job == null ? 'Post' : 'Apply Changes',
                          fontSize: 12.3,
                          textColor: AppColors.white,
                          buttonColor: AppColors.blue,
                          blurRadius: 176,
                          height: 30,
                          child: child,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
