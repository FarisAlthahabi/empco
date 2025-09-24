part of 'following_repo.dart';

@Injectable(as: FollowingRepo)
class HttpFollowingRepo implements FollowingRepo {
  UserRepo userRepo = UserRepo();
  final DioClient _dioClient = DioClient();

  @override
  Future<List<FollowingModel>> getFriends() async {
    try {
      final response = await _dioClient.get(
        '/api/${await userRepo.getKey(role)}/get-friends',
      );

      final body = (response.data as Map<String, dynamic>)['data'] as List;
      return List.generate(
        body.length,
        (index) => FollowingModel.fromJson(body[index]),
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }

  @override
  Future<FollowingModel> addFriend(int id) async {
    try {
      final response = await _dioClient.post(
        '/api/${await userRepo.getKey(role)}/add-friend/$id/role/freelancer',
      );

      final body = (response.data as Map<String, dynamic>)['data'];
      return FollowingModel.fromJson(body);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }

  @override
  Future<void> removeFriend(int id) async {
    try {
      await _dioClient.delete(
        '/api/${await userRepo.getKey(role)}/remove-friend/$id/role/freelancer',
      );

    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }
}
