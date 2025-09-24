import 'package:empco/Core/dio/dio_client.dart';
import 'package:empco/Core/dio/exceptions.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Features/Roles/Company/jop_post/models/ai_description_model/ai_description_model.dart';
import 'package:empco/Features/Roles/Company/jop_post/models/job_post_model/job_post_model.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:injectable/injectable.dart';

part 'http_job_post_service.dart';

abstract class JobPostService {
  Future<JobModel> addJobPost(JobPostModel jobPostModel);

  Future<JobModel> updateJobPost(
    JobPostModel jobPostModel,
    int jobPostId,
  );

  Future<AiDescriptionModel> getAiDescription(String title);
}
