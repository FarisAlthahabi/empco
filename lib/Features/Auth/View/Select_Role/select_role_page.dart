import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Core/Resources/Constants/Texts.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Widgets/empcoIcon_and_empcoText.dart';
import 'package:empco/Core/Widgets/text_widgets.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Features/Auth/View/Select_Role/Widgets/buttons.dart';
import 'package:empco/Features/Auth/View/Select_Role/Widgets/texts.dart';
import 'package:empco/Features/auth_manager/bloc/auth_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

abstract class SelectRoleViewCallBacks {
  onRoleSelected(int index, BuildContext context);
}

@RoutePage()
class SelectRoleView extends StatelessWidget {
  const SelectRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectRolePage();
  }
}

class SelectRolePage extends StatefulWidget {
  const SelectRolePage({super.key});

  @override
  State<SelectRolePage> createState() => _SelectRolePageState();
}

class _SelectRolePageState extends State<SelectRolePage>
    implements SelectRoleViewCallBacks {
  late final AuthenticationBloc authenticationBloc = context.read();

  late final UserRepo userRepo = context.read();
  
  @override
  onRoleSelected(int index, BuildContext context) {
    authenticationBloc.add(IsAuthenticatedOrFirstTime());
    userRepo.setKey(role, userRole[index]);
    userRepo.setKey(isFirstTime, false);
    context.go('$mainRoute/$signUpRoute');
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenWidth = screenSize.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const EmpcoIcon(
              paddingTop: 10,
              paddingLeft: 10,
              iconHeight: 50,
              iconWidth: 50,
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const TitleOfPage(text: selectRolePageTitle),
                  SvgPicture.asset(
                    chooseRoleImage,
                  ),
                  const SelectRoleTextWidget(),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              SelectRoleButton(
                                screenWidth: screenWidth,
                                index: index,
                                onTap: () {
                                  onRoleSelected(index, context);
                                },
                              )
                            ],
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
