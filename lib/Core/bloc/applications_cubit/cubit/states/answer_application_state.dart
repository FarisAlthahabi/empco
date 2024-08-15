part of '../applications_cubit.dart';

@immutable
abstract class AnswerApplicationState extends GeneralApplicationsState {}

final class AnswerApplicationInitial extends AnswerApplicationState {}

class AnswerApplicationLoading extends AnswerApplicationState {}

class ApproveApplicationSuccess extends AnswerApplicationState {
  final AnswerApplicationModel answerApplicationModel;

  ApproveApplicationSuccess(this.answerApplicationModel);
  
}

class RejectApplicationSuccess extends AnswerApplicationState {
  final AnswerApplicationModel answerApplicationModel;

  RejectApplicationSuccess(this.answerApplicationModel);
  
}

class AnswerApplicationFail extends ApplicationsState {
  final String error;

  AnswerApplicationFail(this.error);
  
}
