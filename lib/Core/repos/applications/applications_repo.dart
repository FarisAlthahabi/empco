import 'package:empco/Core/dio/dio_client.dart';
import 'package:empco/Core/dio/exceptions.dart';
import 'package:empco/Core/models/answer_application_model/answer_application_model.dart';
import 'package:empco/Core/models/application_model/application_model.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:injectable/injectable.dart';

part 'http_applications_repo.dart';

abstract class ApplicationsRepo {
  Future<List<ApplicationModel>> getApplications();

  Future<AnswerApplicationModel> approveApplication(int applicationId);

  Future<AnswerApplicationModel> rejectApplication(int applicationId);
}
