import 'package:empco/Core/models/token_model/token_model.dart';
import 'package:empco/Features/Auth/Models/User_model/User_Model.dart';
import 'package:empco/Features/Auth/Models/user_check_code_model.dart/User_Chaeck_Code_model.dart';
import 'package:empco/Features/Auth/Models/user_forget_password_model/User_Forget_Password_model.dart';
import 'package:empco/Features/Auth/Models/user_login_model/User_Login_Model.dart';
import 'package:empco/Features/Auth/Models/user_reset_password_model/User_Reset_Password_model.dart';
import 'package:empco/Features/Auth/Models/user_verify_model/User_Verify_Model.dart';


abstract class AuthService {
  Future<TokenModel> register(UserModel user);

  Future<TokenModel> loginWithGoogle();

  Future<void> verify(UserVerifyModel userVerify);

  Future<TokenModel> login(UserLoginModel userLogin);

  Future<void> logout();

  Future<void> forgetPassword(UserForgetPasswordModel userForgetPassword);

  Future<UserCheckCodeModel> checkCode(TokenModel token);

  Future<void> resetPassword(UserResetPasswordModel userResetPassword);
}
