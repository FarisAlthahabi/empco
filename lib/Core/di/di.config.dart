// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:empco/Core/di/modules/app_modules.dart' as _i723;
import 'package:empco/Core/dio/dio_client.dart' as _i401;
import 'package:empco/Core/repos/user_repo.dart' as _i110;
import 'package:empco/Features/Auth/bloc/auth_bloc.dart' as _i990;
import 'package:empco/Features/Auth/Service/http_auth_service.dart' as _i12;
import 'package:empco/Features/auth_manager/bloc/auth_manager_bloc.dart'
    as _i393;
import 'package:empco/Features/Roles/Freelancer/Job_details/cubit/job_details_cubit.dart'
    as _i581;
import 'package:empco/Features/Roles/Freelancer/Job_details/Service/job_details_service.dart'
    as _i83;
import 'package:empco/Features/Roles/Freelancer/Jobs/cubit/jobs_cubit.dart'
    as _i457;
import 'package:empco/Features/Roles/Freelancer/Jobs/Service/jobs_service.dart'
    as _i638;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i990.AuthBloc>(() => _i990.AuthBloc());
    gh.factory<_i12.HttpAuthService>(() => _i12.HttpAuthService());
    gh.singleton<_i401.DioClient>(() => _i401.DioClient());
    await gh.singletonAsync<_i110.UserRepo>(
      () {
        final i = _i110.UserRepo();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i638.JobsService>(() => _i638.HttpJobService());
    gh.factory<_i83.JobDetailsService>(() => _i83.HttpJobDetailsService());
    gh.factory<_i457.JobsCubit>(() => _i457.JobsCubit(gh<_i638.JobsService>()));
    gh.factory<_i581.JobDetailsCubit>(
        () => _i581.JobDetailsCubit(gh<_i83.JobDetailsService>()));
    gh.singleton<_i393.AuthenticationBloc>(
        () => _i393.AuthenticationBloc(gh<_i110.UserRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i723.RegisterModule {}
