import 'package:empco/Core/dio/dio.dart';
import 'package:empco/Core/repos/user_repo.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:injectable/injectable.dart';

part 'http_jobs_service.dart';

abstract class JobsService {
  Future<List<JobModel>> getJobs();
}
