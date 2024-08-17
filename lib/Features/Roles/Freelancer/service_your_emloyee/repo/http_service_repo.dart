part of 'service_repo.dart';

@Injectable(as: ServiceRepo)
class HttpServiceRepo implements ServiceRepo {
  UserRepo userRepo = UserRepo();
  final DioClient _dioClient = DioClient();

  @override
  Future<List<ServiceModel>> getServices() async {
    try {
      final response = await _dioClient.get(
        '/api/${await userRepo.getKey(role)}/show-services',
      );

      final body = (response.data as Map<String, dynamic>)['data'] as List;

      return List.generate(
        body.length,
        (index) => ServiceModel.fromJson(body[index]),
      );
    } catch (e) {
      if (e is NotFoundException) {
        throw e.message ?? 'something_went_wrong';
      }
      rethrow;
    }
  }
}
