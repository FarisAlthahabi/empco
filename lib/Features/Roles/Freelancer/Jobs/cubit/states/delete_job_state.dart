part of '../jobs_cubit.dart';

@immutable
abstract class DeleteJobState extends GeneralJobsState {}

class DeleteJobSuccess extends DeleteJobState {
  DeleteJobSuccess();
}

class DeleteJobLoading extends DeleteJobState {}

class DeleteJobFail extends DeleteJobState {
  DeleteJobFail(this.message);

  final String message;
}
