import 'package:bloc/bloc.dart';
import 'package:empco/Core/models/licence_status_model/licence_status_model.dart';
import 'package:empco/Core/models/upload_licence_response_model/upload_licence_response_model.dart';
import 'package:empco/Core/repos/licence/licence_repo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/licence_state.dart';

part 'states/upload_licence_state.dart';

part 'states/general_licence_state.dart';

@injectable
class LicenceCubit extends Cubit<GeneralLicenceState> {
  LicenceCubit(this._licenceRepo) : super(LicenceInitial());

  final LicenceRepo _licenceRepo;

  Future<void> getLicenceStatus() async {
    emit(LicenceLoading());
    try {
      final data = await _licenceRepo.getLicenceStatus();
      emit(LicenceSuccess(licence: data));
    } on Exception catch (e, s) {
      addError(e, s);
      emit(
        LicenceFail(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> uploadLicence(PlatformFile? file) async {
    emit(UploadLicenceLoading());
    try {
      final data = await _licenceRepo.uploadLicence(file);

      emit(UploadLicenceSuccess(data));
    } on Exception catch (e, s) {
      addError(e, s);
      emit(
        UploadLicenceFail(
          error: e.toString() == 'Invalid request'
              ? 'you have license alredy'
              : e.toString(),
        ),
      );
    }
  }
}
