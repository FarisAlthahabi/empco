import 'package:bloc/bloc.dart';
import 'package:empco/Core/models/edit_profile_model/edit_profile_model.dart';
import 'package:empco/Core/models/profile_model/profile_model.dart';
import 'package:empco/Core/repos/edit_profile/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/edit_profile_state.dart';

part 'states/general_edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<GeneralEditProfileState> {
  EditProfileCubit(this._editProfileRepo) : super(EditProfileInitial());

  final EditProfileRepo _editProfileRepo;

  EditProfileModel _editProfileModel = const EditProfileModel();

   void setName(String name) {
    name = name;
  }

  void setLocation(String location) {
    _editProfileModel = _editProfileModel.copyWith(
      location: () => location,
    );
  }

  void setCeo(String ceo) {
    _editProfileModel = _editProfileModel.copyWith(
      ceo: () => ceo,
    );
  }

  void setWorkAs(String workAs) {
    _editProfileModel = _editProfileModel.copyWith(
      workAs: () => workAs,
    );
  }

  void setBirthday(String birthday) {
    _editProfileModel = _editProfileModel.copyWith(
      birthday: () => birthday,
    );
  }

  void setWorkPlace(String workPlace) {
    _editProfileModel = _editProfileModel.copyWith(
      workPlace: () => workPlace,
    );
  }

  void setOverview(String overview) {
    _editProfileModel = _editProfileModel.copyWith(
      overview: () => overview,
    );
  }

  void setBrief(String brief) {
    _editProfileModel = _editProfileModel.copyWith(
      brief: () => brief,
    );
  }

  void setProjects(String projects) {
    _editProfileModel = _editProfileModel.copyWith(
      projects: () => projects,
    );
  }

  void setEmail(String email) {
    _editProfileModel = _editProfileModel.copyWith(
      email: () => email,
    );
  }

  void setPhoneNumber(String phoneNumber) {
    _editProfileModel = _editProfileModel.copyWith(
      phoneNumber: () => phoneNumber,
    );
  }

  Future<void> editProfile() async {
    emit(EditProfileLoading());
    try {
      final data = await _editProfileRepo.editProfile(_editProfileModel);

      emit(EditProfileSuccess(data));
    } on Exception catch (e, s) {
      addError(e, s);
      emit(
        EditProfileFail(e.toString()),
      );
    }
  }
}
