part of '../auth_cubit.dart';

class ResetPasswordState extends GeneralAuthState{}

class ResetPasswordInitialState extends ResetPasswordState{}

class ResetPasswordLoadingState extends ResetPasswordState{}

class ResetPasswordSuccessState extends ResetPasswordState{}

class ResetPasswordFailState extends ResetPasswordState{
  final String error;

  ResetPasswordFailState(this.error);
}
