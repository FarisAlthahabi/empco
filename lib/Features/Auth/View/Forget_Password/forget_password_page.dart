import 'package:empco/Core/Config/di/di.dart';
import 'package:empco/Core/Config/router/Router.dart';
import 'package:empco/Core/Resources/Constants/Colors.dart';
import 'package:empco/Core/Resources/Constants/Texts.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Widgets/Loading_Page.dart';
import 'package:empco/Core/Widgets/auth_text_field.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Features/Auth/View/Forget_Password/Widgets/Texts.dart';
import 'package:empco/Features/Auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

abstract class ForgetPasswordViewCallbacks {
  void onResetPasswordTap(BuildContext context);

  void onBackToLoginTap(BuildContext context);

  void onSuccessToForgetPasswordStateListened(BuildContext context);

  void onFailedToForgetPasswordStateListened(
      BuildContext context, String error);

  void onEmailChanged(String email);

  void onEmailSubmitted(String email);
}

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage>
    implements ForgetPasswordViewCallbacks {
  String email = '';

  final emailFocusNode = FocusNode();

  @override
  void onEmailChanged(String emailInput) {
    email = emailInput;
  }

  @override
  void onEmailSubmitted(String emailInput) {}

  @override
  void dispose() {
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  void onBackToLoginTap(BuildContext context) {
    context.go('$mainRoute$introRoute/$loginRoute');
    // dispose();
  }

  @override
  void onResetPasswordTap(BuildContext context) {
    if (email.isNotEmpty) {
      print(email);
      BlocProvider.of<AuthBloc>(context).add(ForgetPasswordEvent(email: email));
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    } else {
      showSnackBarMethod(context, emailEmpty, red);
    }
  }

  @override
  void onFailedToForgetPasswordStateListened(
      BuildContext context, String error) {
    showSnackBarMethod(context, error, red);
  }

  @override
  void onSuccessToForgetPasswordStateListened(BuildContext context) {
    context.goNamed("VerifyPage", pathParameters: {'email': email});
    showSnackBarMethod(
      context,
      checkEmailBox,
      green,
    );
    //dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    return BlocProvider(
      create: (context) => config<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SuccessToForgetPasswordState) {
            onSuccessToForgetPasswordStateListened(context);
          } else if (state is FailedToForgetPasswordState) {
            onFailedToForgetPasswordStateListened(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return const LoadingPage();
          } else if (state is AuthInitial ||
              state is SuccessToForgetPasswordState ||
              state is FailedToForgetPasswordState) {
            return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 54,
                      ),
                      SvgPicture.asset(
                        forgetPasswordImage,
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      const Text1InForgetPass(),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text2InForgetPass(),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text3InForgetPass(),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: 0.94 * screenWidth,
                        child: AuthTextField(
                            onChanged: onEmailChanged,
                            onSubmitted: onEmailSubmitted,
                            height: 20,
                            title: emailAddress,
                            prefixIcon: const Icon(Icons.email_outlined)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MainActionButton(
                        // Reset Password Button
                        width: 0.5 * screenWidth,
                        height: 0.06 * screenHeight,
                        text: resetPassword,
                        blurRadius: 3.16,
                        yAxisOffset: 3.16,
                        shadowColor: boxShadowColor2,
                        fontSize: 12.51,
                        onTap: () {
                          onResetPasswordTap(context);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: BackTextButton(
                          text: backToLoginText,
                          onTap: () {
                            onBackToLoginTap(context);
                          },
                        ),
                      ),
                    ],
                  ),
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
