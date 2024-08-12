import 'package:bloc/bloc.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Service/jobs_service.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'jobs_state.dart';

@injectable
class JobsCubit extends Cubit<JobsState> {
  JobsCubit(this._jobsService) : super(JobsInitial());

  final JobsService _jobsService ;

  Future<void> getJobs() async {
    emit(JobsLoading());
    try {
  final data = await _jobsService.getJobs();
  emit(JobsSuccess(jobs: data));
} on Exception catch (e , s) {
   addError(e, s);
      emit(JobsFail(error : e.toString()));
}
  }
}
