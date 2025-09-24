
import 'package:bloc/bloc.dart';
import 'package:empco/Core/models/application_model/application_model.dart';
import 'package:empco/Features/Roles/Freelancer/apply_job/model/apply_job/apply_job.dart';
import 'package:empco/Features/Roles/Freelancer/apply_job/repo/apply_job_repo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/apply_job_state.dart';

part 'states/general_apply_job_state.dart';

@injectable
class ApplyJobCubit extends Cubit<GeneralApplyJobState> {
  ApplyJobCubit(this._applyJobRepo) : super(ApplyJobInitial());

  final ApplyJobRepo _applyJobRepo;

  ApplyJobModel _applyJobModel = const ApplyJobModel();

  void setName(String name) {
    _applyJobModel = _applyJobModel.copyWith(
      name: () => name,
    );
  }

  void setEmail(String email) {
    _applyJobModel = _applyJobModel.copyWith(
      email: () => email,
    );
  }

  void setResume(String? resume) {
    _applyJobModel = _applyJobModel.copyWith(
      resume: () => resume,
    );
  }

  Future<void> applyJob(int jobId ,PlatformFile? file) async {
    emit(ApplyJobLoading());
    try {
      final response = await _applyJobRepo.applyJob(_applyJobModel, jobId , file);
      emit(ApplyJobSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(ApplyJobFail(e.toString()));
    }
  }
}
