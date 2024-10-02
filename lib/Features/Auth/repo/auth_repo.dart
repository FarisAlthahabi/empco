import 'package:dio/dio.dart';
import 'package:empco/Core/dio/dio_client.dart';
import 'package:empco/Core/models/token_model/token_model.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Features/Auth/Models/reset_password_model/reset_password_model.dart';
import 'package:empco/Features/Auth/Models/sign_in_model/sign_in_model.dart';
import 'package:empco/Features/Auth/Models/user_post_model/user_post_model.dart';
import 'package:empco/Features/Auth/Models/verify_email_model/verify_email_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'http_auth_repo.dart';

abstract class AuthRepo{
  Future<TokenModel> register(UserPostModel user);

  Future<TokenModel> loginWithGoogle();

  Future<void> verify(VerifyEmailModel userVerify);

  Future<TokenModel> login(SignInModel signInModel);

  Future<void> logout();

  Future<void> forgetPassword(String forgetPasswordEmail);

  Future<void> checkCode(String token);

  Future<void> resetPassword(ResetPasswordModel resetPasswordModel);
}