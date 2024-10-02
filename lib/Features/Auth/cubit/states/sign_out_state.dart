part of '../auth_cubit.dart';

class SignOutState extends GeneralAuthState{}

class SignOutInitialState extends SignOutState{}

class SignOutLoadingState extends SignOutState{}

class SignOutSuccessState extends SignOutState{}

class SignOutFailState extends SignOutState{
  final String error;

  SignOutFailState(this.error);
}