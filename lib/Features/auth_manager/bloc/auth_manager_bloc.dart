import 'package:bloc/bloc.dart';
import 'package:empco/Core/models/token_model/token_model.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Features/Auth/Models/verify_email_model/verify_email_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'auth_manager_event.dart';
part 'auth_manager_state.dart';

@singleton
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, GeneralAuthenticationState> {
  AuthenticationBloc(this._userRepo) : super(InitialAuthenticationState()) {
    debugPrint('CurrentState: $state');

    on<IsAuthenticatedOrFirstTime>(_findIfAuthenticatedOrFirstTime);
    on<ShowSignIn>(_showSignIn);
    on<SignInRequested>(_signIn);
    on<SignOutRequested>(_signOut);
    on<GuestRequested>(_continueAsGuest);
    on<VerifyRequested>(_verify);
    on<ForgetPasswordRequested>(_forgetPassword);
  }

  final UserRepo _userRepo;

  Future<void> _findIfAuthenticatedOrFirstTime(
    IsAuthenticatedOrFirstTime event,
    Emitter<GeneralAuthenticationState> emit,
  ) async {
    final firstTime = await _userRepo.getKey(firstTimeKey, defaultValue: true);
    if (firstTime) {
      emit(FirstTimeState());
      _userRepo.setKey(firstTimeKey, false);
    } else {
      if (_userRepo.user != null) {
        emit(AuthenticatedState());
      } else {
        emit(UnauthenticatedState());
      }
    }
  }

  Future<void> _showSignIn(
    ShowSignIn event,
    Emitter<GeneralAuthenticationState> emit,
  ) async {
    emit(
      ShowSignInState(
        action: event.onSignedIn,
      ),
    );
  }

  Future<void> _signIn(
    SignInRequested event,
    Emitter<GeneralAuthenticationState> emit,
  ) async {
    await _userRepo.setUser(event.signInModel);
    event.onSuccess?.call();
    emit(AuthenticatedState());
  }

  Future<void> _signOut(
    SignOutRequested event,
    Emitter<GeneralAuthenticationState> emit,
  ) async {
    await _userRepo.deleteUser();
    emit(UnauthenticatedState());
  }

  void _continueAsGuest(
    GuestRequested event,
    Emitter<GeneralAuthenticationState> emit,
  ) {
    emit(GuestState());
  }

  Future<void> _verify(
    VerifyRequested event,
    Emitter<GeneralAuthenticationState> emit,
  ) async {
    emit(VerificationState());
  }

  Future<void> _forgetPassword(
    ForgetPasswordRequested event,
    Emitter<GeneralAuthenticationState> emit,
  ) async {
    emit(ForgetPasswordState());
  }
}
