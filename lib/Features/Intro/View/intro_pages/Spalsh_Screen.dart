// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Mixins/post_frame_mixin.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/empcoIcon_and_empcoText.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with PostFrameMixin {
  late final UserRepo userRepo = context.read();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void onPostFrame() {
    Future.delayed(const Duration(seconds: 3), () async {
      print(await userRepo.getKey(role));
      if (await userRepo.getKey(isFirstTime, defaultValue: true)) {
        context.go('$mainRoute/$introRoute');
        await userRepo.setKey(isFirstTime, false);
      } else {
        if (await userRepo.getKey(isLogin ,defaultValue: false)) {
          if (await userRepo.getKey(role) == 'freelancer') {
            context.go('$mainRoute/$loginRoute/$freelancerHomePageRoute');
          } else if (await userRepo.getKey(role) == 'owner') {
            context.go('$loginRoute/$companyHomePageRoute');
          } else {
            context.go('$loginRoute/$customerHomePageRoute');
          }
        } else {
          context.go('$mainRoute/$loginRoute');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(29, 91, 164, 0.91),
        body: Center(
          child: EmpcoIconAndEmpcoText(
            width: 200,
            hight: 170,
            fontsize: 33.05,
            scale: 1,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
