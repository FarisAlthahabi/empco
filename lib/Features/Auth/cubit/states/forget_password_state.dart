part of '../auth_cubit.dart';

class ForgetPasswordState extends GeneralAuthState{}

class ForgetPasswordInitialState extends ForgetPasswordState{}

class ForgetPasswordLoadingState extends ForgetPasswordState{}

class ForgetPasswordSuccessState extends ForgetPasswordState{}

class ForgetPasswordFailState extends ForgetPasswordState{
  final String error;

  ForgetPasswordFailState(this.error);
}
