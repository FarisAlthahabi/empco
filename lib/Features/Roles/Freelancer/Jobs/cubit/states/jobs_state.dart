part of '../jobs_cubit.dart';

@immutable
abstract class JobsState extends GeneralJobsState {}

final class JobsInitial extends JobsState {}

class JobsLoading extends JobsState {}

class JobsSuccess extends JobsState {
  final List<JobModel> jobs;
  JobsSuccess({
    required this.jobs,
  });
}

class JobsEmpty extends JobsState {
  final String error;
  JobsEmpty({
    required this.error,
  });
}


class JobsFail extends JobsState {
  final String error;
  JobsFail({
    required this.error,
  });
}
