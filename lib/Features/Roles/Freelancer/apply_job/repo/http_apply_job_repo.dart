part of 'apply_job_repo.dart';

@Injectable(as: ApplyJobRepo)
class HttpApplyJobRepo implements ApplyJobRepo {
  UserRepo userRepo = UserRepo();
  final DioClient _dioClient = DioClient();

  @override
  Future<ApplicationModel> applyJob(
    ApplyJobModel applyJobModel,
    int jobId,
    PlatformFile? file
  ) async {
    try {
      final response = await _dioClient.post(
        '/api/freelancer/apply/6',
        headers: applyJobModel.toJson(),
        data: file
      );

      final body = (response.data as Map<String, dynamic>)['data'];

      return ApplicationModel.fromJson(body);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }
}
