part of 'licence_repo.dart';

@Injectable(as: LicenceRepo)
class HttpLicenceRepo implements LicenceRepo {
  UserRepo userRepo = UserRepo();
  final DioClient _dioClient = DioClient();

  @override
  Future<LicenceStatusModel> getLicenceStatus() async {
    try {
      final response = await _dioClient.get(
        '/api/${await userRepo.getKey(role)}/check-license',
      );

      final body = (response.data as Map<String, dynamic>)['data'] as List;
      return LicenceStatusModel.fromJson(body[0]);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }

  @override
  Future<UploadLicenceResponseModel> uploadLicence(PlatformFile? file) async {
    try {
      final response = await _dioClient.post(
          '/api/${await userRepo.getKey(role)}/upload-license',
          data: file);

      final body = response.data as Map<String, dynamic>;

      return UploadLicenceResponseModel.fromJson(body);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }
}
