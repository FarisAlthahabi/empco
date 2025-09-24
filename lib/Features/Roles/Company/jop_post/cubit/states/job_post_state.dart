part of '../job_post_cubit.dart';

@immutable
abstract class JobPostState extends GeneralJobPostState {}

class JobPostInitial extends JobPostState {}

class JobPostLoading extends JobPostState {}

class JobPostSuccess extends JobPostState {
  final JobModel job;

  JobPostSuccess(this.job);
}

class JobPostUpdateSuccess extends JobPostState {
  final JobModel job;

  JobPostUpdateSuccess(this.job);
}

class JobPostFail extends JobPostState {
  JobPostFail(this.message);

  final String message;
}
