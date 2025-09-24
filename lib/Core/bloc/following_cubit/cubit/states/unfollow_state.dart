part of '../following_cubit.dart';

@immutable
abstract class UnFollowState extends GeneralFollowingState {}

final class UnFollowInitial extends UnFollowState {}

class UnFollowLoading extends UnFollowState {}

class UnFollowSuccess extends UnFollowState {}


class UnFollowFail extends UnFollowState {
  final String error;

  UnFollowFail(this.error);
}
