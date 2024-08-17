part of '../service_cubit.dart';

@immutable
abstract class ServiceState extends GeneralServiceState {}

final class ServiceInitial extends ServiceState {}

class ServiceLoading extends ServiceState {}

class ServiceSuccess extends ServiceState {
  final List<ServiceModel> services;
  ServiceSuccess({
    required this.services,
  });
}

class ServiceEmpty extends ServiceState {
  final String error;
  ServiceEmpty({
    required this.error,
  });
}


class ServiceFail extends ServiceState {
  final String error;
  ServiceFail({
    required this.error,
  });
}

