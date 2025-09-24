import 'package:bloc/bloc.dart';
import 'package:empco/Core/models/profile_model/profile_model.dart';
import 'package:empco/Core/repos/profile/profile_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/profile_state.dart';

part 'states/general_profile_state.dart';

@injectable
class ProfileCubit extends Cubit<GeneralProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());

  final ProfileRepo _profileRepo;

  Future<void> getProfile() async {
    emit(ProfileLoading());
    try {
      final data = await _profileRepo.getProfile();
      emit(ProfileSuccess(data));
    } on Exception catch (e, s) {
      addError(e, s);
      emit(
        ProfileFail(
          e.toString(),
        ),
      );
    }
  }
}
