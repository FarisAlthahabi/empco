import 'package:empco/Core/dio/dio_client.dart';
import 'package:empco/Core/dio/exceptions.dart';
import 'package:empco/Core/models/following_model/following_model.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:injectable/injectable.dart';

part 'http_following_repo.dart';

abstract class FollowingRepo {
  Future<List<FollowingModel>> getFriends();

  Future<FollowingModel> addFriend(int id);

  Future<void> removeFriend(int id);
}
