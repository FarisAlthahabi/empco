part of 'job_details_service.dart';

@Injectable(as: JobDetailsService)
class HttpJobDetailsService implements JobDetailsService {
  UserRepo userRepo = UserRepo();
  final DioClient _dioClient = DioClient();

  @override
  Future<JobModel> getJobDetails(int jobId) async {
    try {
      final response = await _dioClient.get(
        '/api/${await userRepo.getKey(role)}/show-job/$jobId',
      );

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
}
