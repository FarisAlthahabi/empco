part of 'profile_repo.dart';

@Injectable(as: ProfileRepo)
class HttpProfileRepo implements ProfileRepo {
  UserRepo userRepo = UserRepo();
  final DioClient _dioClient = DioClient();

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final response = await _dioClient.get(
        '/api/${await userRepo.getKey(role)}/profile',
      );

      final body = (response.data as Map<String, dynamic>)['data'];
      return ProfileModel.fromJson(body);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }

}
