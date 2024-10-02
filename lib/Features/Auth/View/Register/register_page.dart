import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Core/Resources/Constants/Texts.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Widgets/Buttons.dart';
import 'package:empco/Core/Widgets/empcoIcon_and_empcoText.dart';
import 'package:empco/Core/Widgets/auth_text_field.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/Widgets/text_widgets.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Features/Auth/View/Register/widgets/Texts.dart';
import 'package:empco/Features/Auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

abstract class RegisterViewCallbacks {
  void onSignUpTap();

  void onContinueWithGoogleTap(BuildContext context);

  void onLoginTap();

  void onFirstNameChanged(String firstName);

  void onLastNameChanged(String lastName);

  void onEmailChanged(String email);

  void onPasswordChanged(String password);

  void onConfirmPasswordChanged(String confirmPassword);

  void onFirstNameSubmitted(String firstName);

  void onLastNameSubmitted(String lastName);

  void onEmailSubmitted(String email);

  void onPasswordSubmitted(String password);

  void onConfirmPasswordSubmitted(String confirmPassword);
}

bool obsecure = true;

@RoutePage()
class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<AuthCubit>(),
      child: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    implements RegisterViewCallbacks {
  late final AuthCubit authCubit = context.read();

  late final UserRepo userRepo = context.read();

  final firstNameFocusNode = FocusNode();

  final lastNameFocusNode = FocusNode();

  final emailFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();

  final confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

    super.dispose();
  }

  @override
  void onConfirmPasswordChanged(String confirmPassword) {
    authCubit.confirmPassword = confirmPassword;
  }

  @override
  void onConfirmPasswordSubmitted(String confirmPasswordInput) {}

  @override
  void onEmailChanged(String email) {
    authCubit.setEmail(email);
  }

  @override
  void onEmailSubmitted(String emailInput) {
    passwordFocusNode.requestFocus();
  }

  @override
  void onFirstNameChanged(String firstName) {
    authCubit.setFirstName(firstName);
  }

  @override
  void onFirstNameSubmitted(String firstNameInput) {
    lastNameFocusNode.requestFocus();
  }

  @override
  void onLastNameChanged(String lastName) {
    authCubit.setLastName(lastName);
  }

  @override
  void onLastNameSubmitted(String lastNameInput) {
    emailFocusNode.requestFocus();
  }

  @override
  void onPasswordChanged(String password) {
    authCubit.setPassword(password);
  }

  @override
  void onPasswordSubmitted(String passwordInput) {
    confirmPasswordFocusNode.requestFocus();
  }

  @override
  void onContinueWithGoogleTap(BuildContext context) {
    authCubit.signInWithGoogle();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  @override
  void onLoginTap() {
    context.go('$mainRoute/$loginRoute');
  }

  @override
  void onSignUpTap() {
    authCubit.signUp();
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
                  SizedBox(
                    height: 0.045 * screenHeight,
                    //height: 30,
                  ),
                  const TitleOfPage(text: registeringYou),
                  SvgPicture.asset(
                    signUpImage,
                    height: 0.18 * screenHeight,
                  ),
                  const SignUpText(),
                  SizedBox(
                    height: 0.015 * screenHeight,
                    // height: 10,
                  ),
                  Center(
                    child: SizedBox(
                      width: 0.94 * screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 0.45 * screenWidth,
                            child: AuthTextField(
                              onChanged: onFirstNameChanged,
                              onSubmitted: onFirstNameSubmitted,
                              focusNode: firstNameFocusNode,
                              prefixIcon: const Icon(Icons.person),
                              title: firstNameText,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 0.45 * screenWidth,
                            child: AuthTextField(
                                focusNode: lastNameFocusNode,
                                onChanged: onLastNameChanged,
                                onSubmitted: onLastNameSubmitted,
                                title: lastNameText,
                                prefixIcon: const Icon(Icons.person)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    width: 0.94 * screenWidth,
                    child: AuthTextField(
                        focusNode: emailFocusNode,
                        onChanged: onEmailChanged,
                        onSubmitted: onEmailSubmitted,
                        title: emailAddress,
                        prefixIcon: const Icon(Icons.email_outlined)),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    width: 0.94 * screenWidth,
                    child: AuthTextField(
                      onChanged: onPasswordChanged,
                      onSubmitted: onPasswordSubmitted,
                      focusNode: passwordFocusNode,
                      prefixIcon: const Icon(Icons.lock),
                      isPassword: true,
                      title: passwordText,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    width: 0.94 * screenWidth,
                    child: AuthTextField(
                      prefixIcon: const Icon(Icons.lock),
                      focusNode: confirmPasswordFocusNode,
                      onChanged: onConfirmPasswordChanged,
                      onSubmitted: onConfirmPasswordSubmitted,
                      isPassword: true,
                      title: confirmPasswordText,
                    ),
                  ),
                  SizedBox(
                    height: 0.015 * screenHeight,
                    // height: 10,
                  ),
                  BlocConsumer<AuthCubit, GeneralAuthState>(
                    listener: (context, state) {
                      if (state is SignUpSuccessState) {
                        showSnackBarMethod(
                            context, registerSuccess, AppColors.green);
                        context.go('$mainRoute/$verifyRoute');
                      } else if (state is SignUpFailState) {
                        showSnackBarMethod(context, state.error, AppColors.red);
                      }
                      // if (state is SuccessToLoginWithGoogleState) {
                      //   userRepo.setKey(isLogin, true);
                      //   userRepo.setKey(isFirstTime, false);
                      //   showSnackBarMethod(
                      //       context, loginSuccess, AppColors.green);
                      //   if (await userRepo.getKey(role) == 'freelancer') {
                      //     context.go(
                      //         '$mainRoute/$loginRoute/$freelancerHomePageRoute');
                      //   } else if (await userRepo.getKey(role) == 'owner') {
                      //     context.go(
                      //         '$mainRoute/$loginRoute/$companyHomePageRoute');
                      //   } else {
                      //     context.go(
                      //         '$mainRoute/$loginRoute/$customerHomePageRoute');
                      //   }
                      // } else if (state is FailedToLoginWithGoogleState) {
                      //   showSnackBarMethod(
                      //       context, loginWithGoogleFail, AppColors.red);
                      // }
                    },
                    buildWhen: (previous, current) => current is SignUpState,
                    builder: (context, state) {
                      var onTap = onSignUpTap;
                      Widget? child;
                      if (state is SignUpLoadingState) {
                        onTap = () {};
                        child = const LoadingIndicator(
                          color: AppColors.white,
                        );
                      }
                      return MainActionButton(
                        width: 0.86 * screenWidth,
                        height: 0.07 * screenHeight,
                        text: signUpText,
                        blurRadius: 4,
                        yAxisOffset: 4,
                        shadowColor: AppColors.boxShadowColor1,
                        fontSize: 17.09,
                        onTap: onTap,
                        child: child,
                      );
                    },
                  ),
                  SizedBox(
                    height: 0.015 * screenHeight,
                    // height: 10,
                  ),
                  const OrText(),
                  SizedBox(
                    height: 0.015 * screenHeight,
                    // height: 10,
                  ),
                  ContinueWithGoogleBotton(onTap: () {
                    onContinueWithGoogleTap(context);
                  }),
                  SizedBox(
                    height: 0.015 * screenHeight,
                    //height: 10,
                  ),
                  GlobalTextButton(
                      text1: alreadyRegistered,
                      text2: loginText,
                      onTap: onLoginTap),
                  SizedBox(
                    height: 0.015 * screenHeight,
                    // height: 10,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
