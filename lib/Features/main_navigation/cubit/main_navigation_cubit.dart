import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_navigation_state.dart';

class MainNavigationCubit extends Cubit<MainNavigationState> {
  MainNavigationCubit() : super(MainNavigationInitial());
}
