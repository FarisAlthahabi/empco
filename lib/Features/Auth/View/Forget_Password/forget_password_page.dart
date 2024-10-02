import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Core/Resources/Constants/Texts.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Widgets/auth_text_field.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Features/Auth/View/Forget_Password/Widgets/Texts.dart';
import 'package:empco/Features/Auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

abstract class ForgetPasswordViewCallbacks {
  void onResetPasswordTap();

  void onBackToLoginTap();

  void onEmailChanged(String email);

  void onEmailSubmitted(String email);
}

@RoutePage()
class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<AuthCubit>(),
      child: const ForgetPasswordPage(),
    );
  }
}

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage>
    implements ForgetPasswordViewCallbacks {
  late final AuthCubit authCubit = context.read();
  final emailFocusNode = FocusNode();

  @override
  void onEmailChanged(String email) {
    authCubit.forgetPasswordEmail = email;
  }

  @override
  void onEmailSubmitted(String emailInput) {}

  @override
  void dispose() {
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  void onBackToLoginTap() {
    context.go('$mainRoute/$loginRoute');
  }

  @override
  void onResetPasswordTap() {
    authCubit.forgetPassword();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
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
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<AuthCubit, GeneralAuthState>(
                listener: (context, state) {
                  if (state is ForgetPasswordSuccessState) {
                    context.go('$mainRoute/$verifyRoute');
                    showSnackBarMethod(context, checkEmailBox, AppColors.green);
                  } else if (state is ForgetPasswordFailState) {
                    showSnackBarMethod(context, state.error, AppColors.red);
                  }
                },
                buildWhen: (previous, current) => current is ForgetPasswordState,
                builder: (context, state) {
                  var onTap = onResetPasswordTap;
                  Widget? child;
                  if (state is ForgetPasswordLoadingState) {
                    onTap = () {};
                    child = const LoadingIndicator(
                      color: AppColors.white,
                    );
                  }
                  return MainActionButton(
                    // Reset Password Button
                    width: 0.5 * screenWidth,
                    height: 0.06 * screenHeight,
                    text: resetPassword,
                    blurRadius: 3.16,
                    yAxisOffset: 3.16,
                    shadowColor: AppColors.boxShadowColor2,
                    fontSize: 12.51,
                    onTap: onTap,
                    child: child,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: BackTextButton(
                  text: backToLoginText,
                  onTap: onBackToLoginTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
