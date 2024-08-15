import 'package:bloc/bloc.dart';
import 'package:empco/Features/Roles/Company/jop_post/models/ai_description_model/ai_description_model.dart';
import 'package:empco/Features/Roles/Company/jop_post/models/job_category_enum/job_category_enum.dart';
import 'package:empco/Features/Roles/Company/jop_post/models/job_post_model/job_post_model.dart';
import 'package:empco/Features/Roles/Company/jop_post/models/job_type_enum/job_type_enum.dart';
import 'package:empco/Features/Roles/Company/jop_post/models/job_work_nature_enum/job_work_nature_enum.dart';
import 'package:empco/Features/Roles/Company/jop_post/service/job_post_service.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/job_post_state.dart';

part 'states/general_job_post_state.dart';

part 'states/ai_description_state.dart';

@injectable
class JobPostCubit extends Cubit<GeneralJobPostState> {
  JobPostCubit(this._jobPostService) : super(JobPostInitial());

  final JobPostService _jobPostService;

  JobPostModel _jobPostModel = const JobPostModel();

  String aiDescriptionTitle = '';

  void setAiDescriptionTitle(String title) {
    aiDescriptionTitle = title;
  }

  void setTitle(String title) {
    _jobPostModel = _jobPostModel.copyWith(
      title: () => title,
    );
  }

  void setBody(String body) {
    _jobPostModel = _jobPostModel.copyWith(
      body: () => body,
    );
  }

  void setRequiredSkills(String requiredSkills) {
    _jobPostModel = _jobPostModel.copyWith(
      requiredSkills: () => requiredSkills,
    );
  }

  void setDeadTime(DateTime? deadTime) {
    _jobPostModel = _jobPostModel.copyWith(
      deadTime: () => deadTime,
    );
  }

  void setLocation(String location) {
    _jobPostModel = _jobPostModel.copyWith(
      location: () => location,
    );
  }

  void setSalary(String salary) {
    _jobPostModel = _jobPostModel.copyWith(
      salary: () => double.tryParse(salary),
    );
  }

  void setJobType(JobTypeEnum jobType) {
    _jobPostModel = _jobPostModel.copyWith(
      jobType: () => jobType,
    );
  }

  void setWorkNature(WorkNatureEnum workNature) {
    _jobPostModel = _jobPostModel.copyWith(
      workNature: () => workNature,
    );
  }

  void setJobCategory(JobCategoryEnum? jobCategory) {
    _jobPostModel = _jobPostModel.copyWith(
      jobCategory: () => jobCategory,
    );
  }

  Future<void> addJobPost() async {
    emit(JobPostLoading());
    try {
      final response = await _jobPostService.addJobPost(_jobPostModel);
      emit(JobPostSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(JobPostFail(e.toString()));
    }
  }

  Future<void> updatejobPost(int jobId) async {
    emit(JobPostLoading());
    try {
      final response = await _jobPostService.updateJobPost(
        _jobPostModel,
        jobId,
      );
      emit(JobPostUpdateSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(JobPostFail(e.toString()));
    }
  }

  Future<void> getAiDescription() async {
    emit(AiDescriptionLoading());

    try {
      final response = await _jobPostService.getAiDescription(
        aiDescriptionTitle,
      );

      emit(AiDescriptionSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(AiDescriptionFail(e.toString()));
    }
  }
}
