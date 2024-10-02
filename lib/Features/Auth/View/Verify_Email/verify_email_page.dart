import 'package:empco/Core/Resources/Constants/Texts.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/empcoIcon_and_empcoText.dart';
import 'package:empco/Core/Widgets/text_widgets.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Features/Auth/View/Verify_Email/Widgets/code_textfields.dart';
import 'package:empco/Features/Auth/View/Verify_Email/Widgets/is_wrong_widget.dart';
import 'package:empco/Features/Auth/View/Verify_Email/Widgets/texts.dart';
import 'package:empco/Features/Auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

late List<TextEditingController> verificationCodeController;
late List<FocusNode> focusNode;

bool isWrongCode = false;

abstract class VerifyViewCallBacks {
  void onGoBackTap();

  void onConfirmTap();

  void onChange(String value);
}

class VerifyEamilView extends StatelessWidget {
  const VerifyEamilView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<AuthCubit>(),
      child: const VerifyEmailPage(),
    );
  }
}

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({
    super.key,
  });

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage>
    implements VerifyViewCallBacks {
  late final AuthCubit authCubit = context.read();
  late final UserRepo userRepo = context.read();
  @override
  void initState() {
    isWrongCode = false;
    super.initState();
    verificationCodeController =
        List.generate(6, (i) => TextEditingController());
    focusNode = List.generate(6, (index) => FocusNode());
    for (int index = 0; index < verificationCodeController.length; index++) {
      verificationCodeController[index].addListener(() {
        if (index == verificationCodeController.length - 1 &&
            verificationCodeController[index].text.length == 1) {
          focusNode[verificationCodeController.length - 1].unfocus();
        }
        if (verificationCodeController[index].text.length == 1 &&
            index != verificationCodeController.length - 1) {
          FocusScope.of(context).requestFocus(focusNode[index + 1]);
        }
      });
    }
  }

  @override
  void onChange(String value) {
    setState(() {
      isWrongCode = false;
    });
    authCubit.verificationCode += value;
  }

  @override
  void onConfirmTap() {
    authCubit.verifyEmail();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  @override
  void onGoBackTap() {
    context.go('$mainRoute/$signUpRoute');
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenHeight = screenSize.height;
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const TitleOfPage(
                      text: registeringYou,
                    ),
                    SvgPicture.asset(
                      verifyImage,
                    ),
                    const VerifyText1(),
                    const SizedBox(
                      height: 30,
                    ),
                    const VerifyText2(),
                    const SizedBox(
                      height: 20,
                    ),
                    // Code Text Field.........
                    Center(
                      child: SizedBox(
                        width: 0.9 * screenWidth,
                        height: 0.07 * screenHeight,
                        child: Center(
                          child: SizedBox(
                            width: 310,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return CodeTextField(
                                  onChange: onChange,
                                  focusNode: focusNode[index],
                                  verificationCode:
                                      verificationCodeController[index],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    IsWrongWidget(
                      isWrongCode: isWrongCode,
                    ),
                    BlocConsumer<AuthCubit, GeneralAuthState>(
                      listener: (context, state) {
                        if (state is VerifySuccessState) {
                          showSnackBarMethod(
                              context, verifySuccess, AppColors.green);
                          userRepo.setKey(isRegistered, true);
                          context.go('$mainRoute/$loginRoute');
                        } else if (state is VerifyFailState) {
                          isWrongCode = true;
                          showSnackBarMethod(
                              context, verifyFail, AppColors.red);
                        }
                      },
                      builder: (context, state) {
                        var onTap = onConfirmTap;
                        Widget? child;
                        if (state is VerifyLoadingState) {
                          onTap = () {};
                          child = const LoadingIndicator(
                            color: AppColors.white,
                          );
                        }
                        return MainActionButton(
                          width: 0.48 * screenWidth,
                          height: 0.081 * screenHeight,
                          text: confirm,
                          blurRadius: 4,
                          yAxisOffset: 4,
                          shadowColor: AppColors.boxShadowColor2,
                          fontSize: 17.09,
                          onTap: onTap,
                          child: child,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BackTextButton(
                      text: goBack,
                      onTap: onGoBackTap,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
