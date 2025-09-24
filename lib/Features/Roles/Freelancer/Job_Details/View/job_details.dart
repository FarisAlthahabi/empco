import 'package:empco/Core/di/di.dart';
import 'package:empco/Features/Roles/Freelancer/Job_details/cubit/job_details_cubit.dart';
import 'package:empco/Features/Roles/common_pages/empco_job_details/empco_job_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class JobDetailsCallBacks {
  onAddToFavoriteTap();

  onMessageTap();

  onApplyTap();
}

class FreelancerJobDetailsView extends StatelessWidget
    implements JobDetailsCallBacks {
  const FreelancerJobDetailsView({
    super.key,
    required this.jobId,
  });

  final int jobId;

  @override
  onAddToFavoriteTap() {}

  @override
  onApplyTap() {}

  @override
  onMessageTap() {}

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenWidth = screenSize.width;
    return BlocProvider(
      create: (context) => config<JobDetailsCubit>(),
      child: JobDetailsView(
        jobId: jobId,
        onAddToFavoriteTap: onAddToFavoriteTap,
        onApplyTap: onApplyTap,
        onMessageTap: onMessageTap,
        screenWidth: screenWidth,
      ),
    );
  }
}
