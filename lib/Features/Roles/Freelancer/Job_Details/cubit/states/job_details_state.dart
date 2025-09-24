part of '../job_details_cubit.dart';

@immutable
abstract class JobDetailsState extends GeneralJobDetailsState {}

class JobDetailsInitial extends JobDetailsState {}

class JobDetailsLoading extends JobDetailsState {}

class JobDetailsSuccess extends JobDetailsState {
  final JobModel job;

  JobDetailsSuccess(this.job);
}

class JobDetailsFail extends JobDetailsState {
  JobDetailsFail(this.message);

  final String message;
}
