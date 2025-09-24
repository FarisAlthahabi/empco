part of '../apply_job_cubit.dart';

@immutable
abstract class ApplyJobState extends GeneralApplyJobState {}

final class ApplyJobInitial extends ApplyJobState {}

class ApplyJobLoading extends ApplyJobState {}

class ApplyJobSuccess extends ApplyJobState {
  final ApplicationModel applicationModel;

  ApplyJobSuccess(this.applicationModel);
}

class ApplyJobFail extends ApplyJobState {
  final String error;

  ApplyJobFail(this.error);
 
}
