import 'package:empco/Core/dio/dio_client.dart';
import 'package:empco/Core/dio/exceptions.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Features/Roles/Freelancer/service_your_emloyee/model/service_model/service_model.dart';
import 'package:injectable/injectable.dart';

part 'http_service_repo.dart';

abstract class ServiceRepo {
  Future<List<ServiceModel>> getServices();

}
