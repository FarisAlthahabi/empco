part of '../auth_cubit.dart';

class SignInState extends GeneralAuthState{}

class SignInInitialState extends SignInState{}

class SignInLoadingState extends SignInState{}

class SignInSuccessState extends SignInState{
  final TokenModel token;

  SignInSuccessState(this.token);
}

class SignInFailState extends SignInState{
  final String error;

  SignInFailState(this.error);
}
