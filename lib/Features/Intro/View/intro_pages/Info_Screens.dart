// ignore_for_file: non_constant_identifier_names

import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Config/router/Router.dart';
import 'package:empco/Core/Resources/Constants/colors.dart';
import 'package:empco/Core/Resources/Constants/Texts.dart';
import 'package:empco/Core/Widgets/Buttons.dart';
import 'package:empco/Features/Intro/View/widgets/Assets.dart';
import 'package:empco/Features/Intro/View/widgets/Circles_For_Current_Page.dart';
import 'package:empco/Features/Intro/View/widgets/Texts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class InfoViewCallBacks {
  onGetStartedTap(BuildContext context);

  onSignUpTap(BuildContext context);
}

@RoutePage()
class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return const InfoScreens();
  }
}

class InfoScreens extends StatelessWidget implements InfoViewCallBacks {
  const InfoScreens({super.key});

  @override
  onGetStartedTap(BuildContext context) {
    context.go('$mainRoute$introRoute/$selectRoleRoute');
  }

  @override
  onSignUpTap(BuildContext context) {
    context.go('$mainRoute$introRoute/$loginRoute');
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    print(screenHeight);
    print(screenWidth);
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 0.015 * screenHeight,
                ),
                IntroPageAssets(
                  index: index,
                  screenHeight: screenHeight,
                ),
                InfoTextsWidget(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  index: index,
                ),
                SizedBox(height: 0.023 * screenHeight,),
                CirclesForCurrentPage(
                  index: index,
                ),
                SizedBox(
                  height: 0.023 * screenHeight,
                ),
                MainActionButton(
                  width: 0.72 * screenWidth,
                  height: 0.08 * screenHeight,
                  yAxisOffset: 4,
                  blurRadius: 4,
                  shadowColor: boxShadowColor1,
                  text: start,
                  fontSize: 17.09,
                  onTap: () {
                    onGetStartedTap(context);
                  },
                ),
                SizedBox(
                  height: 0.06 * screenHeight,
                ),
                GlobalTextButton(
                  onTap: () {
                    onSignUpTap(context);
                  },
                  text1: haveAccount,
                  text2: loginText,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
