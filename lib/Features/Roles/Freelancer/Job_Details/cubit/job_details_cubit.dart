import 'package:bloc/bloc.dart';
import 'package:empco/Features/Roles/Freelancer/Job_details/Service/job_details_service.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/job_details_state.dart';

part 'states/general_job_details_state.dart';

@injectable
class JobDetailsCubit extends Cubit<JobDetailsState> {
  JobDetailsCubit(this._jobDetailsService) : super(JobDetailsInitial());

  final JobDetailsService _jobDetailsService;

  Future<void> getJobDetails(int jobId) async {
    emit(JobDetailsLoading());

    try {
      final user = await _jobDetailsService.getJobDetails(jobId);
      emit(JobDetailsSuccess(user));
    } catch (e, s) {
      addError(e, s);
      emit(JobDetailsFail(e.toString()));
    }
  }
}
