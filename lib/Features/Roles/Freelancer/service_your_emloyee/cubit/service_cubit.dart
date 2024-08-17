import 'package:bloc/bloc.dart';
import 'package:empco/Features/Roles/Freelancer/service_your_emloyee/model/service_model/service_model.dart';
import 'package:empco/Features/Roles/Freelancer/service_your_emloyee/repo/service_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/service_state.dart';

part 'states/general_service_state.dart';

@injectable
class ServiceCubit extends Cubit<GeneralServiceState> {
  ServiceCubit(this._serviceRepo) : super(ServiceInitial());

  final ServiceRepo _serviceRepo;


  Future<void> getServices() async {
    emit(ServiceLoading());
    try {
      final data = await _serviceRepo.getServices();
      if (data.isEmpty) {
        emit(ServiceEmpty(error: 'There is no Service yet'));
      } else {
        emit(ServiceSuccess(services: data));
      }
    } on Exception catch (e, s) {
      addError(e, s);
      emit(
        ServiceFail(
          error: e.toString(),
        ),
      );
    }
  }

 

}
