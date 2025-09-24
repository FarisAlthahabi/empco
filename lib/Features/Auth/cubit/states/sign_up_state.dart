part of '../auth_cubit.dart';

class SignUpState extends GeneralAuthState{}

class SignUpInitialState extends SignUpState{}

class SignUpLoadingState extends SignUpState{}

class SignUpSuccessState extends SignUpState{
  final TokenModel token;

  SignUpSuccessState(this.token);
}

class SignUpFailState extends SignUpState{
  final String error;

  SignUpFailState(this.error);
}
