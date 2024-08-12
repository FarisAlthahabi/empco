// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'jobs_cubit.dart';

@immutable
sealed class JobsState {}

final class JobsInitial extends JobsState {}

class JobsLoading extends JobsState {}

class JobsSuccess extends JobsState {
  final List<JobModel> jobs;
  JobsSuccess({
    required this.jobs,
  });
}

class JobsFail extends JobsState {
  final String error;
  JobsFail({
    required this.error,
  });
}
