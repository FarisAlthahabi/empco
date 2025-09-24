import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/auto_router/empco_router.dart';
import 'package:empco/Features/auth_manager/bloc/auth_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthenticationView extends StatefulWidget {
  const AuthenticationView({
    super.key,
  });

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  @override
  void initState() {
    super.initState();
    context.read<AuthenticationBloc>().add(IsAuthenticatedOrFirstTime());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, GeneralAuthenticationState>(
      builder: (context, state) {
        return AutoRouter.declarative(
          routes: (context) {
            return [
              if (state is FirstTimeState)
                const IntroRouter(),
              if (state is UnauthenticatedState)
                const LoginRoute(),
              if (state is AuthenticatedState)
                const MainNavigationRoute(),
            ];
          },
        );
      },
    );
  }
}
