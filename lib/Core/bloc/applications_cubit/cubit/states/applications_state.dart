part of '../applications_cubit.dart';

@immutable
abstract class ApplicationsState extends GeneralApplicationsState {}

final class ApplicationsInitial extends ApplicationsState {}

class ApplicationsLoading extends ApplicationsState {}

class ApplicationsSuccess extends ApplicationsState {
  final List<ApplicationModel> applications;
  ApplicationsSuccess({
    required this.applications,
  });
}

class ApplicationsEmpty extends ApplicationsState {
  final String error;
  ApplicationsEmpty({
    required this.error,
  });
}

class ApplicationsFail extends ApplicationsState {
  final String error;
  ApplicationsFail({
    required this.error,
  });
}
