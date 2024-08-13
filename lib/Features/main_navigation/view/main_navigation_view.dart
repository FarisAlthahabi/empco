import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Features/main_navigation/cubit/main_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainNavigationView extends StatelessWidget {
  const MainNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => config<MainNavigationCubit>(),
        ),
      ],
      child: const MainNavigationPage(),
    );
  }
}

class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainNavigationCubit, MainNavigationState>(
      listener: (context, state) {},
      child: const AutoRouter(),
    );
  }
}
