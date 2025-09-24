part of '../following_cubit.dart';

@immutable
abstract class FollowingState extends GeneralFollowingState {}

final class FollowingInitial extends FollowingState {}

class FollowingLoading extends FollowingState {}

class FollowingSuccess extends FollowingState {
  final List<FollowingModel> followings;

  FollowingSuccess(this.followings);
}

class FollowingEmpty extends FollowingState {
  final String error;

  FollowingEmpty(this.error);
}

class FollowingFail extends FollowingState {
  final String error;

  FollowingFail(this.error);
}
