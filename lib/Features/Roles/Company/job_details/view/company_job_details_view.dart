import 'package:empco/Core/Widgets/show_dialog.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Features/Roles/Freelancer/Job_details/cubit/job_details_cubit.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/cubit/jobs_cubit.dart';
import 'package:empco/Features/Roles/common_pages/empco_job_details/empco_job_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class CompanyJobDetailsCallBacks {
  void onEdit(JobModel job);

  void onDeleteTap(int id);

  void onAcceptDeleteTap(int id);

  void onCancelDeleteTap();
}

class CompanyJobDetailsView extends StatelessWidget {
  const CompanyJobDetailsView({
    super.key,
    required this.jobId,
  });

  final int jobId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<JobsCubit>(),
      child: CompanyJobDetailsPage(jobId: jobId),
    );
  }
}

class CompanyJobDetailsPage extends StatefulWidget {
  const CompanyJobDetailsPage({
    super.key,
    required this.jobId,
  });

  final int jobId;

  @override
  State<CompanyJobDetailsPage> createState() => _CompanyJobDetailsPageState();
}

class _CompanyJobDetailsPageState extends State<CompanyJobDetailsPage>
    implements CompanyJobDetailsCallBacks {
  late final JobsCubit jobsCubit = context.read();

  @override
  void onAcceptDeleteTap(int id) {
    jobsCubit.deleteJobPost(id);
  }

  @override
  void onCancelDeleteTap() {
    Navigator.pop(context);
  }

  @override
  void onDeleteTap(int id) {
    empcoShowDialog(context, onAcceptDeleteTap, onCancelDeleteTap, id);
  }

  @override
  void onEdit(JobModel job) {
    context.goNamed("jobPostView", extra: job);
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenWidth = screenSize.width;

    return BlocProvider(
      create: (context) => config<JobDetailsCubit>(),
      child: JobDetailsView(
        jobId: widget.jobId,
        onDelete: onDeleteTap,
        onEdit: onEdit,
        screenWidth: screenWidth,
      ),
    );
  }
}
