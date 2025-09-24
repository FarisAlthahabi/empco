part of 'job_post_service.dart';

@Injectable(as: JobPostService)
class HttpJobPostService implements JobPostService {
  UserRepo userRepo = UserRepo();
  final DioClient _dioClient = DioClient();

  @override
  Future<JobModel> addJobPost(JobPostModel jobPostModel) async {
    try {
      final response = await _dioClient.post(
          '/api/${await userRepo.getKey(role)}/post-job',
          data: jobPostModel.toJson());

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;
      return JobModel.fromJson(body);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }

  @override
  Future<JobModel> updateJobPost(
    JobPostModel jobPostModel,
    int jobPostId,
  ) async {
    try {
      final response = await _dioClient.put('/api/owner/update-job/$jobPostId',
          data: jobPostModel.toJson());

      final body = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;
      return JobModel.fromJson(body);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }

  @override
  Future<AiDescriptionModel> getAiDescription(String title) async {
    try {
      final response = await _dioClient.post(
        '/api/owner/ai',
        data: {"title_job": title},
      );

      final body = response.data as Map<String, dynamic>;
      return AiDescriptionModel.fromJson(body);
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }
}
