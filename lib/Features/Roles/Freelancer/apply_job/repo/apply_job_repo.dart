import 'package:empco/Core/dio/dio_client.dart';
import 'package:empco/Core/dio/exceptions.dart';
import 'package:empco/Core/models/application_model/application_model.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Features/Roles/Freelancer/apply_job/model/apply_job/apply_job.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

part 'http_apply_job_repo.dart';

abstract class ApplyJobRepo {
  Future<ApplicationModel> applyJob(
    ApplyJobModel applyJobModel,
    int jobId,
    PlatformFile? file,
  );
}
