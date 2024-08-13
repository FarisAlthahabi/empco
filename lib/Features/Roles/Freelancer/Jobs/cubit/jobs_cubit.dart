import 'package:bloc/bloc.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_search_post_model/job_search_post_model.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Service/jobs_service.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'jobs_state.dart';

@injectable
class JobsCubit extends Cubit<JobsState> {
  JobsCubit(this._jobsService) : super(JobsInitial());

  final JobsService _jobsService;

  JobSearchPostModel _jobSearchPostModel = const JobSearchPostModel();

  void setInput(String input) {
    _jobSearchPostModel = _jobSearchPostModel.copyWith(
      title: () => input,
      location: () => input,
    );
  }

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
      if (data.isEmpty) {
        emit(JobsEmpty(error: 'There is no jobs yet'));
      } else {
        emit(JobsSuccess(jobs: data));
      }
      emit(JobsSuccess(jobs: data));
    } on Exception catch (e, s) {
      addError(e, s);
      emit(
        JobsFail(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> getJobsByCategory(int categoryId) async {
    emit(JobsLoading());
    try {
      final data = await _jobsService.getJobsByCategory(categoryId);
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

  Future<void> getJobsCompany(int compantId) async {
    emit(JobsLoading());
    try {
      final data = await _jobsService.getJobsCompany(compantId);
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
}
