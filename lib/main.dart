import 'package:empco/Core/Config/di/di.dart';
import 'package:empco/Core/Config/router/Router.dart';
import 'package:empco/Core/utils/run_app_with_reporting.dart';
import 'package:empco/Features/auth_manager/bloc/auth_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => config<AuthenticationBloc>(),)
          ],
          child: MaterialApp.router(
                routerConfig: router,
                debugShowCheckedModeBanner: false,
              ),
        );
  }
}
