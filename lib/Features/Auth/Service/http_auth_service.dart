import 'package:dio/dio.dart';
import 'package:empco/Core/dio/dio_client.dart';
import 'package:empco/Core/models/token_model/token_model.dart';
import 'package:empco/Core/repos/Base_Service.dart';
import 'package:empco/Core/repos/user_repo.dart';
import 'package:empco/Features/Auth/Models/User_model/User_Model.dart';
import 'package:empco/Features/Auth/Models/user_check_code_model.dart/User_Chaeck_Code_model.dart';
import 'package:empco/Features/Auth/Models/user_forget_password_model/User_Forget_Password_model.dart';
import 'package:empco/Features/Auth/Models/user_login_model/User_Login_Model.dart';
import 'package:empco/Features/Auth/Models/user_reset_password_model/User_Reset_Password_model.dart';
import 'package:empco/Features/Auth/Models/user_verify_model/User_Verify_Model.dart';
import 'package:empco/Features/Auth/Service/Auth_Service.dart';
import 'package:injectable/injectable.dart';

@injectable
class HttpAuthService extends BaseService implements AuthService {
  final DioClient _dioClient = DioClient();

  @override
  Future<TokenModel> register(UserModel user) async {
    try {
      final response = await _dioClient.post(
          '/api/${await userRepo.getKey(role)}/register',
          data: user.toJson());

      final body = response.data as Map<String, dynamic>;
      return TokenModel.fromJson(body['data'] as Map<String, dynamic>);
    } catch (e) {
      if (e is DioException) {
        throw e.message ?? e;
      }
      rethrow;
    }
  }

  @override
  Future<TokenModel> loginWithGoogle() async {
    try {
      final response = await _dioClient.post(
        '/auth/redirect/${await userRepo.getKey(role)}',
      );
      final body = response.data;
      return TokenModel.fromJson(body);
    } catch (e) {
      if (e is DioException) {
        throw e.message ?? e;
      }
      rethrow;
    }
  }

  @override
  Future<void> verify(UserVerifyModel userVerify) async {
    try {
      await _dioClient.post('/api/${await userRepo.getKey(role)}/verify',
          data: userVerify.toJson());
    } catch (e) {
      if (e is DioException) {
        throw e.message ?? e;
      }
      rethrow;
    }
  }

  @override
  Future<TokenModel> login(UserLoginModel userLogin) async {
    try {
      final response = await _dioClient.post(
        '/api/${await userRepo.getKey(role)}/login',
        data: userLogin.toJson(),
      );

      final body = response.data as Map<String, dynamic>;
      return TokenModel.fromJson(body['data'] as Map<String, dynamic>);
    } catch (e) {
      if (e is DioException) {
        throw e.message ?? e;
      }
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _dioClient.post(
        '/api/${await userRepo.getKey(role)}/logout',
      );
    } catch (e) {
      if (e is DioException) {
        throw e.message ?? e;
      }
      rethrow;
    }
  }

  @override
  Future<void> forgetPassword(
      UserForgetPasswordModel userForgetPassword) async {
    try {
      await _dioClient.post(
          '/api/${await userRepo.getKey(role)}/forgetpassword',
          data: userForgetPassword.toJson());
    } catch (e) {
      if (e is DioException) {
        throw e.message ?? e;
      }
      rethrow;
    }
  }

  @override
  Future<UserCheckCodeModel> checkCode(TokenModel token) async {
    try {
      final response = await _dioClient.post(
        '/api/${await userRepo.getKey(role)}/check-code',
        data: token.toJson(),
      );

      final body = response.data as Map<String, dynamic>;
      return UserCheckCodeModel.fromJson(body);
    } catch (e) {
      if (e is DioException) {
        throw e.message ?? e;
      }
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(UserResetPasswordModel userResetPassword) async {
    try {
      await _dioClient.post(
        '/api/${await userRepo.getKey(role)}/resetpassword',
        data: userResetPassword.toJson(),
      );
    } catch (e) {
      if (e is DioException) {
        throw e.message ?? e;
      }
      rethrow;
    }
  }
}
