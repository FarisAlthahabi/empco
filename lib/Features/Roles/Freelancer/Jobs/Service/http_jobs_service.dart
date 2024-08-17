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
        // headers: {"Authorization": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiM2RiNjUwMWY1Yjc2ZmQxZDY0Y2NiMjgwMjVmNzNiMWQxZTAxYmQzMmI2ODdmNGI2ZTBhN2VlNzExMTAyNjY5YTVkZDgxMzk4MmIxZmEzMGIiLCJpYXQiOjE3MjM4ODU4NzAuMzkxOTU5LCJuYmYiOjE3MjM4ODU4NzAuMzkxOTYxLCJleHAiOjE3NTU0MjE4NzAuMzgzMSwic3ViIjoiMyIsInNjb3BlcyI6WyJvd25lciJdfQ.ncxSqK9WIoZTTBSaAx364C8w1uJV9x0h5UzPqUXUff2Z5KIfyPtgE7yZanEZHiqfH8A8L9PHTp7Ktohw0LXwJ9f1duOTFuQlVdWFFPGiIAm3CdWu5EKHm8bRZxpHQ3B9Ydf5mPcTTE7KOlKh3nvHYiFiBlqsl8pLpH1pv5wvCnbApG9bq9dZzjl2y0698bintxdQDlS2FzDubYA-HH57biXixRl6JXS8yt4jA--pJUROhATM6crNrcczvuQfJ7UB8U9WV9xMBdzzZu7x2MKlMkvoYejLJ5x_ZbebYXHjy9dLFxzcYnz6v1VqVUBpfNwBX37bPbSrzBKabG1GtLu0M4ai_2F8LWv-z3XYPm2MNzmpHekD5dlCuQzdeR0Jswru5x2QXU6D_qBkF6SAaZ9I_G_U_KmUgvRRHpdVtCmNZ9Lu1URK0CGQ-swvd1dedJY-2VzrqKMegUsJQdLQBDZqbyNjeg0nsCpHENrOPpksHzGR9ovUIQSPof8jo9aJ2In1w7cUyJoSSzp9eO5oCDt2_--0XqwO5QZylzuZ6mizpGJCEb9oCRTiaYlCSKLlhkDVJD_I6gP-tqEV050ovUTTEZ8MvTYIHEZQfIO1MqO7IJ0nLjQKGcXUH6TSA8HihruKlB5uayd_hcVEM7AJgw8tXgEK-BkIyDs3iyFME2Y6CkE"}
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
      String endpoint = 'show-job-category';
      if (await userRepo.getKey(role) == 'owner') {
        endpoint = 'show-jobs';
      }
      final response = await _dioClient.get(
        '/api/${await userRepo.getKey(role)}/$endpoint/${categoryId + 1}',
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

  @override
  Future<void> deleteJobPost(int jobPostId) async {
    try {
      await _dioClient.delete(
        '/api/owner/delete-job/$jobPostId',
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }
}
