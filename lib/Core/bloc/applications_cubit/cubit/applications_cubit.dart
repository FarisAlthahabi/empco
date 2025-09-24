import 'package:bloc/bloc.dart';
import 'package:empco/Core/models/answer_application_model/answer_application_model.dart';
import 'package:empco/Core/models/application_model/application_model.dart';
import 'package:empco/Core/repos/applications/applications_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/applications_state.dart';

part 'states/answer_application_state.dart';

part 'states/general_applications_state.dart';

@injectable
class ApplicationsCubit extends Cubit<GeneralApplicationsState> {
  ApplicationsCubit(this._applicationsRepo) : super(ApplicationsInitial());

  final ApplicationsRepo _applicationsRepo;

  Future<void> getApplications() async {
    emit(ApplicationsLoading());
    try {
      final data = await _applicationsRepo.getApplications();
      if (data.isEmpty) {
        emit(ApplicationsEmpty(error: 'There is no Applications yet'));
      } else {
        emit(ApplicationsSuccess(applications: data));
      }
    } on Exception catch (e, s) {
      addError(e, s);
      emit(
        ApplicationsFail(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> approveApplications(int applicationId) async {
    emit(ApproveApplicationLoading());
    try {
      final data = await _applicationsRepo.approveApplication(applicationId);

      emit(ApproveApplicationSuccess(data));
    } on Exception catch (e, s) {
      addError(e, s);
      emit(
        ApproveApplicationFail(
          e.toString(),
        ),
      );
    }
  }

  Future<void> rejectApplications(int applicationId) async {
    emit(RejectApplicationLoading());
    try {
      final data = await _applicationsRepo.rejectApplication(applicationId);
      
      emit(RejectApplicationSuccess(data));
    } on Exception catch (e, s) {
      addError(e, s);
      emit(
        RejectApplicationFail(
          e.toString(),
        ),
      );
    }
  }
}
