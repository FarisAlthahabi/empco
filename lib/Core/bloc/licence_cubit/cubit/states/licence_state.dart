part of '../licence_cubit.dart';

@immutable
abstract class LicenceState extends GeneralLicenceState {}

final class LicenceInitial extends LicenceState {}

class LicenceLoading extends LicenceState {}

class LicenceSuccess extends LicenceState {
  final LicenceStatusModel licence;
  LicenceSuccess({
    required this.licence,
  });
}

class LicenceFail extends LicenceState {
  final String error;
  LicenceFail({
    required this.error,
  });
}

