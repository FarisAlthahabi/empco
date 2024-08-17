part of '../edit_profile_cubit.dart';

@immutable
abstract class EditProfileState extends GeneralEditProfileState {}

final class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final ProfileModel profileModel;

  EditProfileSuccess(this.profileModel);
}

class EditProfileFail extends EditProfileState {
  final String error;

  EditProfileFail(this.error);
}
