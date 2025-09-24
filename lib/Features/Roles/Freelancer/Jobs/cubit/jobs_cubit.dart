import 'package:bloc/bloc.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_search_post_model/job_search_post_model.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Service/jobs_service.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/jobs_state.dart';

part 'states/general_jobs_state.dart';

part 'states/delete_job_state.dart';

@injectable
class JobsCubit extends Cubit<GeneralJobsState> {
  JobsCubit(this._jobsService) : super(JobsInitial());

  final JobsService _jobsService;

  JobSearchPostModel _jobSearchPostModel = const JobSearchPostModel();

  List<JobModel> companyJobs = [];

  void setTitle(String title) {
    _jobSearchPostModel = _jobSearchPostModel.copyWith(
      title: () => title,
    );
  }

  void setLocation(String location) {
    _jobSearchPostModel = _jobSearchPostModel.copyWith(
      location: () => location,
    );
  }

  Future<void> getJobs() async {
    emit(JobsLoading());
    try {
      final data = await _jobsService.getJobs();
      companyJobs = data;
      if (data.isEmpty) {
        emit(JobsEmpty(error: 'There is no jobs yet'));
      } else {
        emit(JobsSuccess(jobs: data));
      }
    } on Exception catch (e, s) {
      addError(e, s);
      emit(
        JobsFail(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> getJobsByCategory(int jobId) async {
    emit(JobsLoading());
    try {
      final data = await _jobsService.getJobsByCategory(jobId);
      if (data.isEmpty) {
        emit(JobsEmpty(error: 'There is no jobs yet'));
      } else {
        emit(JobsSuccess(jobs: data));
      }
    } on Exception catch (e, s) {
      addError(e, s);
      emit(
        JobsFail(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> getJobsCompany(int companyId) async {
    emit(JobsLoading());
    try {
      final data = await _jobsService.getJobsCompany(companyId);
      if (data.isEmpty) {
        emit(JobsEmpty(error: 'There is no jobs yet'));
      } else {
        emit(JobsSuccess(jobs: data));
      }
    } on Exception catch (e, s) {
      addError(e, s);
      emit(
        JobsFail(
          error: e.toString(),
        ),
      );
    }
  }
  Future<void> getSearchedJobs() async {
    emit(JobsLoading());
    try {
      final data = await _jobsService.getSearchedJobs(_jobSearchPostModel);
      if (data.isEmpty) {
        emit(JobsEmpty(error: 'There is no jobs yet'));
      } else {
        emit(JobsSuccess(jobs: data));
      }
    } on Exception catch (e, s) {
      addError(e, s);
      emit(
        JobsFail(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> deleteJobPost(int jobPostId) async {
    emit(DeleteJobLoading());
    try {
      await _jobsService.deleteJobPost(jobPostId);
      emit(DeleteJobSuccess());
      companyJobs.removeWhere(
        (element) => element.id == jobPostId,
      );

      if (companyJobs.isEmpty) {
        emit(JobsEmpty(error: "There is no jobs"));
      } else {
        emit(JobsSuccess(jobs: companyJobs));
      }
    } catch (e, s) {
      addError(e, s);
      emit(DeleteJobFail(e.toString()));
    }
  }
}
