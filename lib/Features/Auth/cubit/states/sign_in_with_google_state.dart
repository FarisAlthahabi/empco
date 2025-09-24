part of '../auth_cubit.dart';

class SignInWithGoogleState extends GeneralAuthState{}

class SignInWithGoogleInitialState extends SignInWithGoogleState{}

class SignInWithGoogleLoadingState extends SignInWithGoogleState{}

class SignInWithGoogleSuccessState extends SignInWithGoogleState{
  final TokenModel token;

  SignInWithGoogleSuccessState(this.token);
}

class SignInWithGoogleFailState extends SignInWithGoogleState{
  final String error;

  SignInWithGoogleFailState(this.error);
}
