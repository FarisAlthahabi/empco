import 'package:empco/Core/dio/dio_client.dart';
import 'package:empco/Core/dio/exceptions.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:injectable/injectable.dart';

part 'http_job_details_service.dart';

abstract class JobDetailsService {
  Future<JobModel> getJobDetails(int jobId);
}
