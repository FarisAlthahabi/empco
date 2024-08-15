part of 'applications_repo.dart';

@Injectable(as: ApplicationsRepo)
class HttpApplicationsRepo implements ApplicationsRepo {
  UserRepo userRepo = UserRepo();
  final DioClient _dioClient = DioClient();

  @override
  Future<List<ApplicationModel>> getApplications() async {
    try {
      final response = await _dioClient.get(
        '/api/${await userRepo.getKey(role)}/applications',
      );

      final body = (response.data as Map<String, dynamic>)['data'] as List;
      return List.generate(
        body.length,
        (index) => ApplicationModel.fromJson(body[index]),
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }

  @override
  Future<AnswerApplicationModel> approveApplication(int applicationId) async {
    try {
      final response = await _dioClient.get(
        '/api/owner/approve-application/$applicationId',
      );
      final body = response.data;
      return AnswerApplicationModel.fromJson(body);

    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }

  @override
  Future<AnswerApplicationModel> rejectApplication(int applicationId)async {
    try {
      final response = await _dioClient.get(
        '/api/owner/reject-application/$applicationId',
      );
      final body = response.data;
      return AnswerApplicationModel.fromJson(body);
      
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }
}
