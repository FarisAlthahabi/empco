import 'package:bloc/bloc.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/models/token_model/token_model.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';

import 'package:empco/Features/Auth/Models/user_check_code_model.dart/User_Chaeck_Code_model.dart';
import 'package:empco/Features/Auth/Models/user_forget_password_model/User_Forget_Password_model.dart';
import 'package:empco/Features/Auth/Models/user_login_model/User_Login_Model.dart';
import 'package:empco/Features/Auth/Models/User_model/User_Model.dart';
import 'package:empco/Features/Auth/Models/user_reset_password_model/User_Reset_Password_model.dart';
import 'package:empco/Features/Auth/Models/user_verify_model/User_Verify_Model.dart';
import 'package:empco/Features/Auth/Service/http_auth_Service.dart';
import 'package:empco/Features/auth_manager/bloc/auth_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'register_state.dart';
part 'general_auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, GeneralAuthState> {
  AuthBloc() : super(AuthInitial()) {
    final UserRepo userRepo = UserRepo();

    final HttpAuthService authService = HttpAuthService();

    final AuthenticationBloc authenticationBloc = AuthenticationBloc(userRepo);

    on<RegisterEvent>((event, emit) async {
      emit(RegisterLoading());

      try {
        final UserModel user = UserModel(
            firstName: event.firstName,
            lastName: event.lastName,
            email: event.email,
            password: event.password,
            fcmToken: await userRepo.getKey(fcmTokenRepo));

        final data = await authService.register(user);
        emit(RegisterSuccess(token: data));
        authenticationBloc.add(
          SignInRequested(
            data,
          ),
        );
      } catch (e) {
        emit(RegisterFail(e.toString()));
      }
    });
    on<VerifyEvent>((event, emit) async {
      emit(LoadingState());

      try {
        UserVerifyModel userVerify = UserVerifyModel(
          email: event.email,
          token: event.token,
        );
        await authService.verify(userVerify);
        emit(SuccessToVerifyState());
        authenticationBloc.add(
          VerifyRequested(
            userVerify,
          ),
        );
      } catch (e) {
        emit(FailedToVerifyState(error: e.toString()));
      }
    });

    on<LoginWithGoogleEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final data = await authService.loginWithGoogle();
        emit(SuccessToLoginWithGoogleState(token: data));
        authenticationBloc.add(
          SignInRequested(
            data,
          ),
        );
      } catch (e) {
        emit(FailedToLoginWithGoogleState(error: e.toString()));
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(LoadingState());
      UserLoginModel userLogin = UserLoginModel(
        email: event.email,
        password: event.password,
        fcmToken: await userRepo.getKey(fcmTokenRepo),
      );
      try {
        final data = await authService.login(userLogin);
       // print(data);
        emit(SuccessToLoginState(token: data));
       // userRepo.setUser(data);
        authenticationBloc.add(
          SignInRequested(
            data,
          ),
        );
      } catch (e) {
        emit(FailedToLoginState(error: e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) async {
      emit(LoadingState());
      try {
        await authService.logout();
        emit(SuccessToLogoutState());
        authenticationBloc.add(
          SignOutRequested(),
        );
      } catch (e) {
        emit(
          FailedToLogoutState(
            error: e.toString(),
          ),
        );
      }
    });

    on<ForgetPasswordEvent>((event, emit) async {
      emit(LoadingState());
      UserForgetPasswordModel userForgetPassword = UserForgetPasswordModel(
        email: event.email,
      );
      try {
        await authService.forgetPassword(userForgetPassword);
        emit(SuccessToForgetPasswordState());
        authenticationBloc.add(
          const ForgetPasswordRequested(),
        );
      } catch (e) {
        emit(
          FailedToForgetPasswordState(
            error: e.toString(),
          ),
        );
      }
    });

    on<CheckCodeEvent>((event, emit) async {
      emit(LoadingState());
      TokenModel token = TokenModel(token: event.token);
      try {
        final data = await authService.checkCode(token);
        emit(SuccessToCheckCodeState(data));
      } catch (e) {
        emit(
          FailedToCheckCodeState(
            error: e.toString(),
          ),
        );
      }
    });

    on<ResetPasswordEvent>((event, emit) async {
      emit(LoadingState());
      UserResetPasswordModel userResetPassword = UserResetPasswordModel(
        password: event.password,
        token: event.token,
      );
      try {
        await authService.resetPassword(userResetPassword);
        emit(SuccessToResetPasswordState());
      } catch (e) {
        emit(
          FailedToResetPasswordState(
            error: e.toString(),
          ),
        );
      }
    });
  }
}
