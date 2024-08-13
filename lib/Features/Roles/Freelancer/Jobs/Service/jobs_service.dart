import 'package:empco/Core/dio/dio.dart';
import 'package:empco/Core/repos/user_repo.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_search_post_model/job_search_post_model.dart';
import 'package:injectable/injectable.dart';

part 'http_jobs_service.dart';

abstract class JobsService {
  Future<List<JobModel>> getJobs();

  Future<List<JobModel>> getJobsByCategory(int categoryId);

  Future<List<JobModel>> getJobsCompany(int companyId);

  Future<List<JobModel>> getSearchedJobs(JobSearchPostModel jobSearchPostModel);
}
