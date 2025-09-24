part of '../profile_cubit.dart';

@immutable
abstract class ProfileState extends GeneralProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileModel profile;

  ProfileSuccess(this.profile);
}

class ProfileFail extends ProfileState {
  final String error;

  ProfileFail(this.error);
}
