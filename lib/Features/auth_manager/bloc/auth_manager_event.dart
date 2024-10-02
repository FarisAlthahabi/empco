part of 'auth_manager_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class IsAuthenticatedOrFirstTime extends AuthenticationEvent {}

class ShowSignIn extends AuthenticationEvent {
  const ShowSignIn({
    this.showBackButton = false,
    this.onSignedIn,
  });

  final bool showBackButton;
  final VoidCallback? onSignedIn;
}

class SignInRequested extends AuthenticationEvent {
  const SignInRequested(
    this.signInModel, {
    this.onSuccess,
  });

  final TokenModel signInModel;
  final VoidCallback? onSuccess;
}

class SignOutRequested extends AuthenticationEvent {}

class GuestRequested extends AuthenticationEvent {}

class VerifyRequested extends AuthenticationEvent {
  const VerifyRequested(this.userVerify,);

  final VerifyEmailModel userVerify;

}

class ForgetPasswordRequested extends AuthenticationEvent {
  const ForgetPasswordRequested();
}
