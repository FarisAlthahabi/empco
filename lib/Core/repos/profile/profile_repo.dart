import 'package:empco/Core/dio/dio_client.dart';
import 'package:empco/Core/dio/exceptions.dart';
import 'package:empco/Core/models/profile_model/profile_model.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:injectable/injectable.dart';

part 'http_profile_repo.dart';

abstract class ProfileRepo {
  Future<ProfileModel> getProfile();
}