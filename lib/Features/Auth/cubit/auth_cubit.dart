import 'package:bloc/bloc.dart';
import 'package:empco/Core/models/token_model/token_model.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Features/Auth/Models/reset_password_model/reset_password_model.dart';
import 'package:empco/Features/Auth/Models/sign_in_model/sign_in_model.dart';
import 'package:empco/Features/Auth/Models/user_post_model/user_post_model.dart';
import 'package:empco/Features/Auth/Models/verify_email_model/verify_email_model.dart';
import 'package:empco/Features/Auth/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

part 'states/sign_in_state.dart';

part 'states/sign_in_with_google_state.dart';

part 'states/sign_up_state.dart';

part 'states/sign_out_state.dart';

part 'states/verify_state.dart';

part 'states/check_code_state.dart';

part 'states/forget_password_state.dart';

part 'states/reset_password_state.dart';

part 'states/general_auth_state.dart';

@injectable
class AuthCubit extends Cubit<GeneralAuthState> {
  AuthCubit(this._authRepo, this._userRepo) : super(GeneralAuthInitailState());

  UserPostModel _userPostModel = const UserPostModel();

  SignInModel _signInModel = const SignInModel();

  ResetPasswordModel _resetPasswordModel = const ResetPasswordModel();

  VerifyEmailModel _verifyEmailModel = const VerifyEmailModel();

  String verificationCode = '';

  String forgetPasswordEmail = '';

  String emailToVerify = '';

  String confirmPassword = '';

  final AuthRepo _authRepo;
  final UserRepo _userRepo;

  void setFirstName(String firstName) {
    _userPostModel = _userPostModel.copyWith(
      firstName: () => firstName,
    );
  }

  void setLastName(String lastName) {
    _userPostModel = _userPostModel.copyWith(
      lastName: () => lastName,
    );
  }

  void setEmail(String email) {
    _userPostModel = _userPostModel.copyWith(
      email: () => email,
    );    
    _verifyEmailModel = _verifyEmailModel.copyWith(
      email: () => email,
    );
  }

  void setPassword(String password) {
    _userPostModel = _userPostModel.copyWith(
      password: () => password,
    );
  }

  void setEmailSignIn(String email) {
    _signInModel = _signInModel.copyWith(
      email: () => email,
    );
  }

  void setPasswordSignIn(String password) {
    _signInModel = _signInModel.copyWith(
      password: () => password,
    );
  }

  void setVerificationCode(String verificationCode) {
    _verifyEmailModel = _verifyEmailModel.copyWith(
      token: () => verificationCode,
    );
  }

  void setNewPassword(String password) {
    _resetPasswordModel = _resetPasswordModel.copyWith(
      password: () => password,
    );
  }

  void setResetVerificationCode(String verificationCode) {
    _resetPasswordModel = _resetPasswordModel.copyWith(
      token: () => verificationCode,
    );
  }

  Future<void> signUp() async {
    final String fcmToken = await _userRepo.getKey(fcmTokenRepo);
    _userPostModel = _userPostModel.copyWith(
      fcmToken: () => fcmToken,
    );
    emit(SignUpLoadingState());

    try {
      final data = await _authRepo.register(_userPostModel);
      emit(SignUpSuccessState(data));
    } catch (e) {
      emit(SignUpFailState(e.toString()));
    }
  }

  Future<void> signIn() async {
    final String fcmToken = await _userRepo.getKey(fcmTokenRepo);
    _signInModel = _signInModel.copyWith(
      fcmToken: () => fcmToken,
    );
    emit(SignInLoadingState());

    try {
      final data = await _authRepo.login(_signInModel);
      emit(SignInSuccessState(data));
    } catch (e) {
      emit(SignInFailState(e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(SignInWithGoogleLoadingState());

    try {
      final data = await _authRepo.loginWithGoogle();
      emit(SignInWithGoogleSuccessState(data));
    } catch (e) {
      emit(SignInWithGoogleFailState(e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(SignOutLoadingState());

    try {
      await _authRepo.logout();
      emit(SignOutSuccessState());
    } catch (e) {
      emit(SignOutFailState(e.toString()));
    }
  }

  Future<void> verifyEmail() async {
    emit(VerifyLoadingState());
    print('hello');
    print(_verifyEmailModel.email);
    print(_verifyEmailModel.token);
    try {
      await _authRepo.verify(_verifyEmailModel);
      emit(VerifySuccessState());
    } catch (e) {
      emit(VerifyFailState(e.toString()));
    }
  }

  Future<void> checkCode() async {
    emit(CheckCodeLoadingState());

    try {
      if (verificationCode.length < 6) {
        throw "Invalid verification code";
      }
      await _authRepo.checkCode(verificationCode);
      emit(CheckCodeSuccessState());
    } catch (e) {
      emit(CheckCodeFailState(e.toString()));
    }
  }

  Future<void> forgetPassword() async {
    emit(ForgetPasswordLoadingState());
    final forgetPasswordEmail = this.forgetPasswordEmail;

    try {
      if (forgetPasswordEmail.isEmpty) {
        throw "Email can't be empty";
      }
      await _authRepo.forgetPassword(forgetPasswordEmail);
      emit(ForgetPasswordSuccessState());
    } catch (e) {
      emit(ForgetPasswordFailState(e.toString()));
    }
  }

  Future<void> resetPassword() async {
    emit(ResetPasswordLoadingState());

    try {
      await _authRepo.resetPassword(_resetPasswordModel);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordFailState(e.toString()));
    }
  }
}
