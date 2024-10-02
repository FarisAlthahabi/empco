import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Resources/Constants/Texts.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/Buttons.dart';
import 'package:empco/Core/Widgets/auth_text_field.dart';
import 'package:empco/Core/Widgets/empcoIcon_and_empcoText.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/Widgets/text_widgets.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Features/Auth/View/Login/Widgets/Texts.dart';
import 'package:empco/Features/Auth/View/Login/Widgets/buttons.dart';
import 'package:empco/Features/Auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

abstract class LoginViewCallbacks {
  void onForgetPasswordTap(BuildContext context);

  void onLoginTap();

  void onContionueWithGoogleTap(BuildContext context);

  void onSignUpTap(BuildContext context);

  void onEmailChanged(String email);

  void onPasswordChanged(String password);

  void onEmailSubmitted(String email);

  void onPasswordSubmitted(String password);
}

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<AuthCubit>(),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginViewCallbacks {
  late final AuthCubit authCubit = context.read();

  final UserRepo userRepo = UserRepo();

  final emailFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();

  @override
  void onEmailChanged(String email) {
    authCubit.setEmailSignIn(email);
  }

  @override
  void onEmailSubmitted(String email) {
    passwordFocusNode.requestFocus();
  }

  @override
  void onPasswordChanged(String password) {
    authCubit.setPasswordSignIn(password);
  }

  @override
  void onPasswordSubmitted(String password) {}

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  void onContionueWithGoogleTap(context) {
    authCubit.signInWithGoogle();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  @override
  void onForgetPasswordTap(context) {
    context.go('$mainRoute/$loginRoute/$forgetPasswordRoute');
  }

  @override
  void onLoginTap() {
    authCubit.signIn();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  @override
  void onSignUpTap(context) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 20),
                    const TitleOfPage(text: welcomeBack),
                    SvgPicture.asset(
                      loginImage,
                    ),
                    const TextForLoginPage(),
                    SizedBox(
                      width: 0.91 * screenWidth,
                      child: AuthTextField(
                        focusNode: emailFocusNode,
                        onChanged: onEmailChanged,
                        onSubmitted: onEmailSubmitted,
                        prefixIcon: const Icon(Icons.email_outlined),
                        title: emailAddress,
                      ),
                    ),
                    SizedBox(
                      width: 0.91 * screenWidth,
                      child: AuthTextField(
                        prefixIcon: const Icon(Icons.lock),
                        focusNode: passwordFocusNode,
                        onChanged: onPasswordChanged,
                        onSubmitted: onPasswordSubmitted,
                        isPassword: true,
                        title: passwordText,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ForgetPasswordTextButton(
                      screenWidth: screenWidth,
                      onTap: () {
                        onForgetPasswordTap(context);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BlocConsumer<AuthCubit, GeneralAuthState>(
                      listener: (context, state) async {
                        if (state is SignInSuccessState) {
                          userRepo.setKey(isLogin, true);
                          userRepo.setKey(isFirstTime, false);
                          showSnackBarMethod(
                              context, loginSuccess, AppColors.green);
                          if (await userRepo.getKey(role) == 'freelancer') {
                            context.go(
                                '$mainRoute/$loginRoute/$freelancerHomePageRoute');
                          } else if (await userRepo.getKey(role) == 'owner') {
                            context.go(
                                '$mainRoute/$loginRoute/$companyHomePageRoute');
                          } else {
                            context.go(
                                '$mainRoute/$loginRoute/$customerHomePageRoute');
                          }
                        } else if (state is SignInFailState) {
                          showSnackBarMethod(context, loginFail, AppColors.red);
                        } else {
                          if (state is SignInWithGoogleSuccessState) {
                            userRepo.setKey(isLogin, true);
                            userRepo.setKey(isFirstTime, false);
                            showSnackBarMethod(
                                context, loginSuccess, AppColors.green);
                            if (await userRepo.getKey(role) == 'freelancer') {
                              context.go(
                                  '$mainRoute/$loginRoute/$freelancerHomePageRoute');
                            } else if (await userRepo.getKey(role) == 'owner') {
                              context.go(
                                  '$mainRoute/$loginRoute/$companyHomePageRoute');
                            } else {
                              context.go(
                                  '$mainRoute/$loginRoute/$customerHomePageRoute');
                            }
                          } else if (state is SignInWithGoogleFailState) {
                            showSnackBarMethod(
                                context, loginWithGoogleFail, AppColors.red);
                          }
                        }
                      },
                      builder: (context, state) {
                        var onTap = onLoginTap;
                        Widget? child;
                        if (state is SignInLoadingState) {
                          onTap = () {};
                          child = const LoadingIndicator(
                            color: AppColors.white,
                          );
                        }
                        return MainActionButton(
                          width: 0.86 * screenWidth,
                          height: 0.07 * screenHeight,
                          text: loginText,
                          blurRadius: 4,
                          yAxisOffset: 4,
                          shadowColor: AppColors.boxShadowColor1,
                          fontSize: 17.09,
                          onTap: onTap,
                          child: child,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const OrText(),
                    const SizedBox(
                      height: 5,
                    ),
                    ContinueWithGoogleBotton(onTap: () {
                      onContionueWithGoogleTap(context);
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    GlobalTextButton(
                      text1: firstTimeHere,
                      text2: signUpText,
                      onTap: () {
                        onSignUpTap(context);
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    )
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
