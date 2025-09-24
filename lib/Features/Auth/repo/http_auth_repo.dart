part of 'auth_repo.dart';

@Injectable(as: AuthRepo)
class HttpAuthRepo implements AuthRepo {
  final DioClient _dioClient = DioClient();

   final UserRepo userRepo = UserRepo();

  @override
  Future<TokenModel> register(UserPostModel user) async {
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
      SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('auth_token', body['token']);

      return TokenModel.fromJson(body);
    } catch (e) {
      if (e is DioException) {
        throw e.message ?? e;
      }
      rethrow;
    }
  }

  @override
  Future<void> verify(VerifyEmailModel userVerify) async {
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
  Future<TokenModel> login(SignInModel signInModel) async {
    try {
      final response = await _dioClient.post(
        '/api/${await userRepo.getKey(role)}/login',
        data: signInModel.toJson(),
      );

      final body = response.data as Map<String, dynamic>;
      
      SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('auth_token', body['data']['token']);
      
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
      String forgetPasswordEmail) async {
    try {
      await _dioClient.post(
          '/api/${await userRepo.getKey(role)}/forgetpassword',
          data: {
            "email" : forgetPasswordEmail
          });
    } catch (e) {
      if (e is DioException) {
        throw e.message ?? e;
      }
      rethrow;
    }
  }

  @override
  Future<void> checkCode(String token) async {
    try {
       await _dioClient.post(
        '/api/${await userRepo.getKey(role)}/check-code',
        data: {
          "token" : token,
        },
      );
    } catch (e) {
      if (e is DioException) {
        throw e.message ?? e;
      }
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(ResetPasswordModel resetPasswordModel) async {
    try {
      await _dioClient.post(
        '/api/${await userRepo.getKey(role)}/resetpassword',
        data: resetPasswordModel.toJson(),
      );
    } catch (e) {
      if (e is DioException) {
        throw e.message ?? e;
      }
      rethrow;
    }
  }
}
