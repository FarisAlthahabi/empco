part of '../job_post_cubit.dart';

@immutable
abstract class AiDescriptionState extends GeneralJobPostState {}

class AiDescriptionSuccess extends AiDescriptionState {
  final AiDescriptionModel aiDescriptionModel;

  AiDescriptionSuccess(this.aiDescriptionModel);
}

class AiDescriptionLoading extends AiDescriptionState {}

class AiDescriptionFail extends AiDescriptionState {
  AiDescriptionFail(this.message);

  final String message;
}
