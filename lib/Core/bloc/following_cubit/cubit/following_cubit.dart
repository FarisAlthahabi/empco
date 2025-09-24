import 'package:bloc/bloc.dart';
import 'package:empco/Core/models/following_model/following_model.dart';
import 'package:empco/Core/repos/following_repo/following_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/following_state.dart';

part 'states/add_follow_state.dart';

part 'states/unfollow_state.dart';

part 'states/general_following_state.dart';

@injectable
class FollowingCubit extends Cubit<GeneralFollowingState> {
  FollowingCubit(this.followingRepo) : super(FollowingInitial());

  final FollowingRepo followingRepo;

  List<FollowingModel> followings = [];

  Future<void> getFriends() async {
    emit(FollowingLoading());
    followings = [];
    try {
      final data = await followingRepo.getFriends();
      followings = data;
      if (followings.isEmpty) {
        emit(FollowingEmpty('There is no Following yet'));
      } else {
        emit(FollowingSuccess(followings));
      }
    } on Exception catch (e, s) {
      addError(e, s);
      emit(
        FollowingFail(
          e.toString(),
        ),
      );
    }
  }

  Future<void> addFriend(int id) async {
    emit(AddFollowLoading());
    try {
      final data = await followingRepo.addFriend(id);
      emit(AddFollowSuccess(data));
    } on Exception catch (e, s) {
      addError(e, s);
      emit(
        AddFollowFail(
          e.toString() == 'Invalid request'
              ? 'You are already friends'
              : e.toString(),
        ),
      );
    }
  }

  Future<void> unfollowFriend(int id) async {
    emit(UnFollowLoading());
    try {
      await followingRepo.removeFriend(id);
      followings.removeWhere(
        (following) => following.friendOneAbleId == id,
      );
      emit(UnFollowSuccess());
      if (followings.isEmpty) {
        emit(FollowingEmpty('There is no Following yet'));
      } else {
        emit(FollowingSuccess(followings));
      }
    } on Exception catch (e, s) {
      addError(e, s);
      emit(
        UnFollowFail(
          e.toString(),
        ),
      );
    }
  }
}
