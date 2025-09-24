import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/job_details_contact.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/Widgets/main_error_widget.dart';
import 'package:empco/Features/Roles/Freelancer/Job_details/cubit/job_details_cubit.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:empco/Features/Roles/common_pages/empco_job_details/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobDetailsView extends StatefulWidget {
  const JobDetailsView({
    super.key,
    this.onAddToFavoriteTap,
    this.onApplyTap,
    this.onMessageTap,
    this.onEdit,
    this.onDelete,
    required this.screenWidth,
    required this.jobId,
  });

  final VoidCallback? onAddToFavoriteTap;
  final VoidCallback? onApplyTap;
  final VoidCallback? onMessageTap;
  final ValueSetter<JobModel>? onEdit;
  final ValueSetter<int>? onDelete;
  final double screenWidth;
  final int jobId;

  @override
  State<JobDetailsView> createState() => _JobDetailsViewState();
}

class _JobDetailsViewState extends State<JobDetailsView> {
  late final JobDetailsCubit jobDetailsCubit = context.read();

  @override
  void initState() {
    jobDetailsCubit.getJobDetails(widget.jobId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const EmpcoAppBar(
        height: 30,
      ),
      body: BlocBuilder<JobDetailsCubit, GeneralJobDetailsState>(
        builder: (context, state) {
          if (state is JobDetailsLoading) {
            return const LoadingIndicator();
          } else if (state is JobDetailsSuccess) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JobDetailsHead(
                    job: state.job,
                    onDelete: widget.onDelete,
                    onEdit: widget.onEdit,
                    onAddToFavoriteTap: widget.onAddToFavoriteTap,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: JobDetailsMainInfo(
                          job: state.job,
                        screenWidth: widget.screenWidth,
                          onApplyTap: widget.onApplyTap,
                          onMessageTap: widget.onMessageTap,
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
                      job: state.job,
                      screenWidth: widget.screenWidth,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: JobContactDetails(
                      email: 'faris@gmail.com',
                      phoneNumber: '+963768466036',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          } else if (state is JobDetailsFail) {
            return MainErrorWidget(
              error: state.message,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    ));
  }
}
