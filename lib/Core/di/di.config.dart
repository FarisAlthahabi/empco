// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:empco/Core/bloc/applications_cubit/cubit/applications_cubit.dart'
    as _i353;
import 'package:empco/Core/bloc/licence_cubit/cubit/licence_cubit.dart'
    as _i725;
import 'package:empco/Core/di/modules/app_modules.dart' as _i723;
import 'package:empco/Core/dio/dio_client.dart' as _i401;
import 'package:empco/Core/repos/applications/applications_repo.dart' as _i448;
import 'package:empco/Core/repos/licence/licence_repo.dart' as _i688;
import 'package:empco/Core/repos/user_repo/user_repo.dart' as _i592;
import 'package:empco/Features/Auth/bloc/auth_bloc.dart' as _i990;
import 'package:empco/Features/Auth/Service/http_auth_service.dart' as _i12;
import 'package:empco/Features/auth_manager/bloc/auth_manager_bloc.dart'
    as _i393;
import 'package:empco/Features/Roles/Company/jop_post/cubit/job_post_cubit.dart'
    as _i705;
import 'package:empco/Features/Roles/Company/jop_post/service/job_post_service.dart'
    as _i592;
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
    await gh.singletonAsync<_i592.UserRepo>(
      () {
        final i = _i592.UserRepo();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i688.LicenceRepo>(() => _i688.HttpLicenceRepo());
    gh.factory<_i638.JobsService>(() => _i638.HttpJobService());
    gh.factory<_i725.LicenceCubit>(
        () => _i725.LicenceCubit(gh<_i688.LicenceRepo>()));
    gh.factory<_i83.JobDetailsService>(() => _i83.HttpJobDetailsService());
    gh.factory<_i448.ApplicationsRepo>(() => _i448.HttpApplicationsRepo());
    gh.factory<_i592.JobPostService>(() => _i592.HttpJobPostService());
    gh.factory<_i705.JobPostCubit>(
        () => _i705.JobPostCubit(gh<_i592.JobPostService>()));
    gh.factory<_i457.JobsCubit>(() => _i457.JobsCubit(gh<_i638.JobsService>()));
    gh.singleton<_i393.AuthenticationBloc>(
        () => _i393.AuthenticationBloc(gh<_i592.UserRepo>()));
    gh.factory<_i353.ApplicationsCubit>(
        () => _i353.ApplicationsCubit(gh<_i448.ApplicationsRepo>()));
    gh.factory<_i581.JobDetailsCubit>(
        () => _i581.JobDetailsCubit(gh<_i83.JobDetailsService>()));
    return this;
  }
}

class _$RegisterModule extends _i723.RegisterModule {}
