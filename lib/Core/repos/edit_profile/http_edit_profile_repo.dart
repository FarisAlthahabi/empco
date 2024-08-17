part of 'edit_profile_repo.dart';

@Injectable(as: EditProfileRepo)
class HttpEditProfileRepo implements EditProfileRepo {
  UserRepo userRepo = UserRepo();
  final DioClient _dioClient = DioClient();

  @override
  Future<ProfileModel> editProfile(EditProfileModel editProfileModel ) async {
    try {
      final response = await _dioClient.post(
        '/api/${await userRepo.getKey(role)}/modify-profile',
        data: editProfileModel.toJson()
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
