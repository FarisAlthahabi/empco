part of '../following_cubit.dart';

@immutable
abstract class AddFollowState extends GeneralFollowingState {}

final class AddFollowInitial extends AddFollowState {}

class AddFollowLoading extends AddFollowState {}

class AddFollowSuccess extends AddFollowState {
  final FollowingModel following;

  AddFollowSuccess(this.following);
}


class AddFollowFail extends AddFollowState {
  final String error;

  AddFollowFail(this.error);
}
