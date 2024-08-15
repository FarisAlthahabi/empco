part of '../licence_cubit.dart';

@immutable
abstract class UploadLicenceState extends GeneralLicenceState {}

final class UploadLicenceInitial extends UploadLicenceState {}

class UploadLicenceLoading extends UploadLicenceState {}

class UploadLicenceSuccess extends UploadLicenceState {
  final UploadLicenceResponseModel uploadLicenceResponseModel;

  UploadLicenceSuccess(this.uploadLicenceResponseModel);
 
}

class UploadLicenceFail extends UploadLicenceState {
  final String error;
  UploadLicenceFail({
    required this.error,
  });
}