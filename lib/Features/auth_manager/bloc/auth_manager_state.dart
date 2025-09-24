part of 'auth_manager_bloc.dart';

abstract class GeneralAuthenticationState {
  const GeneralAuthenticationState();
}

class InitialAuthenticationState extends GeneralAuthenticationState {}

class FirstTimeState extends GeneralAuthenticationState {}

class ShowSignInState extends GeneralAuthenticationState {
  const ShowSignInState({
    this.action,
  });

  final VoidCallback? action;
}

class AuthenticatedState extends GeneralAuthenticationState {}

class UnauthenticatedState extends GeneralAuthenticationState {}

class GuestState extends GeneralAuthenticationState {}

class VerificationState extends GeneralAuthenticationState {}

class ForgetPasswordState extends GeneralAuthenticationState {}
