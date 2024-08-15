import 'package:dio/dio.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';

final roles = ['freelancer', 'owner', 'seeker'];

class BaseService {
  final UserRepo userRepo = UserRepo();
  late Response response;
  final String baseURL = 'http://10.0.2.2:8000/api/';
  final String baseGoogleURL = 'http://10.0.2.2:8000/auth/redirect/';
}
