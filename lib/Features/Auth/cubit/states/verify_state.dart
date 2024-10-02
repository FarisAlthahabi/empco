part of '../auth_cubit.dart';

class VerifyState extends GeneralAuthState{}

class VerifyInitialState extends VerifyState{}

class VerifyLoadingState extends VerifyState{}

class VerifySuccessState extends VerifyState{}

class VerifyFailState extends VerifyState{
  final String error;

  VerifyFailState(this.error);
}
