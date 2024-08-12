// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Config/router/Router.dart';
import 'package:empco/Core/Resources/Constants/Colors.dart';
import 'package:empco/Core/Widgets/empcoIcon_and_empcoText.dart';
import 'package:flutter/material.dart';
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

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      context.go(mainRoute+introRoute);
    });
    super.initState();
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
            scale: 1, color: white,
          ),
        ),
      ),
    );
  }
}
