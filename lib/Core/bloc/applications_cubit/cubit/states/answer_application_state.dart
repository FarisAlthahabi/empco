part of '../applications_cubit.dart';

@immutable
abstract class AnswerApplicationState extends GeneralApplicationsState {}

final class AnswerApplicationInitial extends AnswerApplicationState {}

class AnswerApplicationLoading extends AnswerApplicationState {}

class ApproveApplicationLoading extends AnswerApplicationState {}

class RejectApplicationLoading extends AnswerApplicationState {}

class ApproveApplicationSuccess extends AnswerApplicationState {
  final AnswerApplicationModel answerApplicationModel;

  ApproveApplicationSuccess(this.answerApplicationModel);
  
}

class RejectApplicationSuccess extends AnswerApplicationState {
  final AnswerApplicationModel answerApplicationModel;

  RejectApplicationSuccess(this.answerApplicationModel);
  
}

class ApproveApplicationFail extends ApplicationsState {
  final String error;

  ApproveApplicationFail(this.error);
}

class RejectApplicationFail extends ApplicationsState {
  final String error;

  RejectApplicationFail(this.error);
}

class AnswerApplicationFail extends ApplicationsState {
  final String error;

  AnswerApplicationFail(this.error);
}
