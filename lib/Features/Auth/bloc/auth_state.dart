part of 'auth_bloc.dart';

@immutable
class AuthState extends GeneralAuthState {}

final class AuthInitial extends AuthState {}

class LoadingState extends AuthState {}

// Verify.......................................
class SuccessToVerifyState extends AuthState {}

class FailedToVerifyState extends AuthState {
  final String error;
  FailedToVerifyState({
    required this.error,
  });
}

//Login with google...............................
class SuccessToLoginWithGoogleState extends AuthState {
  final TokenModel token;
  SuccessToLoginWithGoogleState({
    required this.token,
  });
}

class FailedToLoginWithGoogleState extends AuthState {
  final String error;
  FailedToLoginWithGoogleState({
    required this.error,
  });
}

// Login.......................................
class SuccessToLoginState extends AuthState {
  final TokenModel token;
  SuccessToLoginState({
    required this.token,
  });
}

class FailedToLoginState extends AuthState {
  final String error;
  FailedToLoginState({
    required this.error,
  });
}

// Logout.......................................
class SuccessToLogoutState extends AuthState {}

class FailedToLogoutState extends AuthState {
  final String error;
  FailedToLogoutState({
    required this.error,
  });
}

// Forget password.......................................
class SuccessToForgetPasswordState extends AuthState {}

class FailedToForgetPasswordState extends AuthState {
  final String error;
  FailedToForgetPasswordState({
    required this.error,
  });
}

// Check code.......................................
class SuccessToCheckCodeState extends AuthState {
  final UserCheckCodeModel userCheckCodeModel;

  SuccessToCheckCodeState(this.userCheckCodeModel);
}

class FailedToCheckCodeState extends AuthState {
  final String error;
  FailedToCheckCodeState({
    required this.error,
  });
}

// Reset password.......................................
class SuccessToResetPasswordState extends AuthState {}

class FailedToResetPasswordState extends AuthState {
  final String error;
  FailedToResetPasswordState({
    required this.error,
  });
}
