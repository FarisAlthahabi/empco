import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'localization_state.dart';

@injectable
class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationState());

  void emitState() => emit(LocalizationState());
}
