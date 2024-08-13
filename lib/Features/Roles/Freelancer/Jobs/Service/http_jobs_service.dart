part of 'jobs_service.dart';

@Injectable(as: JobsService)
class HttpJobService implements JobsService {
  UserRepo userRepo = UserRepo();
  final DioClient _dioClient = DioClient();

  @override
  Future<List<JobModel>> getJobs() async {
    try {
      final response = await _dioClient.get(
        '/api/${await userRepo.getKey(role)}/show-jobs',
      );

      final body = (response.data as Map<String, dynamic>)['data'] as List;

      return List.generate(
        body.length,
        (index) => JobModel.fromJson(body[index]),
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }

  @override
  Future<List<JobModel>> getJobsByCategory(int categoryId) async {
    try {
      final response = await _dioClient.get(
        '/api/${await userRepo.getKey(role)}/show-job-category/${categoryId + 1}',
      );

      final body = (response.data as Map<String, dynamic>)['data'] as List;

      return List.generate(
        body.length,
        (index) => JobModel.fromJson(body[index]),
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }

  @override
  Future<List<JobModel>> getJobsCompany(int companyId) async {
    try {
      final response = await _dioClient.get(
        '/api/${await userRepo.getKey(role)}show/jobs-owner/$companyId',
      );

      final body = (response.data as Map<String, dynamic>)['data'] as List;

      return List.generate(
        body.length,
        (index) => JobModel.fromJson(body[index]),
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }

  @override
  Future<List<JobModel>> getSearchedJobs(
      JobSearchPostModel jobSearchPostModel) async {
    try {
      final response = await _dioClient.post(
        '/api/${await userRepo.getKey(role)}/search',
        data: jobSearchPostModel.toJson(),
      );

      final body = (response.data as Map<String, dynamic>)['data'] as List;

      return List.generate(
        body.length,
        (index) => JobModel.fromJson(body[index]),
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }
}
