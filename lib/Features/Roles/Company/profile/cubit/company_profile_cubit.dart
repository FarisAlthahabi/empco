import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'company_profile_state.dart';

class CompanyProfileCubit extends Cubit<CompanyProfileState> {
  CompanyProfileCubit() : super(CompanyProfileInitial());
}
