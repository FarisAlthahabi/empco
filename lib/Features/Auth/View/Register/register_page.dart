import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Core/Resources/Constants/Texts.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Widgets/Buttons.dart';
import 'package:empco/Core/Widgets/Loading_Page.dart';
import 'package:empco/Core/Widgets/empcoIcon_and_empcoText.dart';
import 'package:empco/Core/Widgets/auth_text_field.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/Widgets/text_widgets.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Features/Auth/View/Register/widgets/Texts.dart';
import 'package:empco/Features/Auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

abstract class RegisterViewCallbacks {
  void onSignUpTap(BuildContext context);

  void onContinueWithGoogleTap(BuildContext context);

  void onLoginTap(BuildContext context);

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
      create: (context) => config<AuthBloc>(),
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
  late final AuthBloc authBloc = context.read();

  final UserRepo userRepo = UserRepo();

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

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
  void onConfirmPasswordChanged(String confirmPasswordInput) {
    confirmPassword = confirmPasswordInput;
  }

  @override
  void onConfirmPasswordSubmitted(String confirmPasswordInput) {}

  @override
  void onEmailChanged(String emailInput) {
    email = emailInput;
  }

  @override
  void onEmailSubmitted(String emailInput) {
    passwordFocusNode.requestFocus();
  }

  @override
  void onFirstNameChanged(String firstNameInput) {
    firstName = firstNameInput;
  }

  @override
  void onFirstNameSubmitted(String firstNameInput) {
    lastNameFocusNode.requestFocus();
  }

  @override
  void onLastNameChanged(String lastNameInput) {
    lastName = lastNameInput;
  }

  @override
  void onLastNameSubmitted(String lastNameInput) {
    emailFocusNode.requestFocus();
  }

  @override
  void onPasswordChanged(String passwordInput) {
    password = passwordInput;
  }

  @override
  void onPasswordSubmitted(String passwordInput) {
    confirmPasswordFocusNode.requestFocus();
  }

  @override
  void onContinueWithGoogleTap(BuildContext context) {
    authBloc.add(LoginWithGoogleEvent());
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  @override
  void onLoginTap(BuildContext context) {
    context.go('$mainRoute/$loginRoute');
    //dispose();
  }

  @override
  void onSignUpTap(BuildContext context) {
    authBloc.add(RegisterEvent(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password));
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (password == confirmPassword) {
            if (state is SuccessToRegisterState) {
              showSnackBarMethod(context, registerSuccess, AppColors.green);
              context.goNamed("VerifyPage", pathParameters: {'email': email});
            } else if (state is FailedToRegisterState) {
              showSnackBarMethod(context, state.error, AppColors.red);
            }
          } else {
            showSnackBarMethod(context, passwordAndConfirmSame, AppColors.red);
          }
          if (state is SuccessToLoginWithGoogleState) {
            userRepo.setKey(isLogin, true);
            userRepo.setKey(isFirstTime, false);
            showSnackBarMethod(context, loginSuccess, AppColors.green);
            if (await userRepo.getKey(role) == 'freelancer') {
              context.go('$mainRoute/$loginRoute/$freelancerHomePageRoute');
            } else if (await userRepo.getKey(role) == 'owner') {
              context.go('$mainRoute/$loginRoute/$companyHomePageRoute');
            } else {
              context.go('$mainRoute/$loginRoute/$customerHomePageRoute');
            }
          } else if (state is FailedToLoginWithGoogleState) {
            showSnackBarMethod(context, loginWithGoogleFail, AppColors.red);
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return const LoadingPage();
          } else if (state is AuthInitial ||
              state is SuccessToRegisterState ||
              state is FailedToRegisterState ||
              state is SuccessToLoginWithGoogleState ||
              state is FailedToLoginWithGoogleState) {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                          MainActionButton(
                            width: 0.86 * screenWidth,
                            height: 0.07 * screenHeight,
                            text: signUpText,
                            blurRadius: 4,
                            yAxisOffset: 4,
                            shadowColor: AppColors.boxShadowColor1,
                            fontSize: 17.09,
                            onTap: () {
                              onSignUpTap(context);
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
                              onTap: () {
                                onLoginTap(context);
                              }),
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
          } else {
            return const SafeArea(
              child: Scaffold(
                body: Center(
                  child: Text('error'),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
