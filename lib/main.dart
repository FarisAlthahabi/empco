import 'package:empco/Core/bloc/permissions_cubit/permissions_cubit.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Core/utils/run_app_with_reporting.dart';
import 'package:empco/Features/auth_manager/bloc/auth_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  runAppWithReporting(
    const EmpcoApp(),
    preLaunch: configureDependencies,
  );
}

class EmpcoApp extends StatelessWidget {
  const EmpcoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // MaterialApp(
        //     theme: lightTheme,
        //     debugShowCheckedModeBanner: false,
        //     home: const CompanyNavigationBar());
        MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => config<UserRepo>(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => config<AuthenticationBloc>(),
          ),
          BlocProvider(
            create: (_) => config<PermissionsCubit>(),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
