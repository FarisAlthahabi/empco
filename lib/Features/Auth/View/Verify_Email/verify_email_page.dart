import 'package:empco/Core/Resources/Constants/Texts.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/empcoIcon_and_empcoText.dart';
import 'package:empco/Core/Widgets/text_widgets.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/repos/user_repo.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Features/Auth/View/Verify_Email/Widgets/code_textfields.dart';
import 'package:empco/Features/Auth/View/Verify_Email/Widgets/is_wrong_widget.dart';
import 'package:empco/Features/Auth/View/Verify_Email/Widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:empco/Features/Auth/bloc/auth_bloc.dart';

late List<TextEditingController> verificationCode;
late List<FocusNode> focusNode;
late List<String> code = [];

bool isWrongCode = false;

abstract class VerifyViewCallBacks {
  void onGoBackTap(BuildContext context);

  void onConfirmTap(BuildContext context);

  void onChange(String value);

  void onSuccessToVerifyStateListened(BuildContext context);

  void onFailedToVerifyStateListened(BuildContext context);
}

class VerifyEamilView extends StatelessWidget {
  const VerifyEamilView({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<AuthBloc>(),
      child: VerifyEmailPage(
        email: email,
      ),
    );
  }
}

class VerifyEmailPage extends StatefulWidget {
  final String email;
  const VerifyEmailPage({
    super.key,
    required this.email,
  });

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage>
    implements VerifyViewCallBacks {
  late final AuthBloc authBloc = context.read();
  late final UserRepo userRepo = context.read();
  @override
  void initState() {
    isWrongCode = false;
    super.initState();
    code = [];
    verificationCode = List.generate(6, (i) => TextEditingController());
    focusNode = List.generate(6, (index) => FocusNode());
    for (int index = 0; index < verificationCode.length; index++) {
      verificationCode[index].addListener(() {
        if (index == verificationCode.length - 1 &&
            verificationCode[index].text.length == 1) {
          focusNode[verificationCode.length - 1].unfocus();
        }
        if (verificationCode[index].text.length == 1 &&
            index != verificationCode.length - 1) {
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
    if (code.length <= 6) {
      code.add(value);
    }
    print(code);
  }

  @override
  void onConfirmTap(BuildContext context) {
    print(verificationCode[0].text +
        verificationCode[1].text +
        verificationCode[2].text +
        verificationCode[3].text +
        verificationCode[4].text +
        verificationCode[5].text);
    authBloc.add(VerifyEvent(
        email: widget.email,
        token: verificationCode[0].text +
            verificationCode[1].text +
            verificationCode[2].text +
            verificationCode[3].text +
            verificationCode[4].text +
            verificationCode[5].text));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  @override
  void onGoBackTap(BuildContext context) {
    context.go('$mainRoute/$signUpRoute');
  }

  @override
  void onFailedToVerifyStateListened(BuildContext context) {
    isWrongCode = true;
    showSnackBarMethod(context, verifyFail, AppColors.red);
  }

  @override
  void onSuccessToVerifyStateListened(BuildContext context) {
    showSnackBarMethod(context, verifySuccess, AppColors.green);
    userRepo.setKey(isRegistered, true);
    context.go('$mainRoute/$loginRoute');
    dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessToVerifyState) {
          onSuccessToVerifyStateListened(context);
        } else if (state is FailedToVerifyState) {
          onFailedToVerifyStateListened(context);
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return const SafeArea(
              child: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ));
        } else if (state is AuthInitial ||
            state is SuccessToVerifyState ||
            state is FailedToVerifyState) {
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
                          const TitleOfPage(text: registeringYou),
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
                                        focusNode: focusNode,
                                        index: index,
                                        verificationCode: verificationCode,
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
                          MainActionButton(
                              width: 0.48 * screenWidth,
                              height: 0.081 * screenHeight,
                              text: confirm,
                              blurRadius: 4,
                              yAxisOffset: 4,
                              shadowColor: AppColors.boxShadowColor2,
                              fontSize: 17.09,
                              onTap: () => onConfirmTap(context)),
                          const SizedBox(
                            height: 20,
                          ),
                          BackTextButton(
                            text: goBack,
                            onTap: () {
                              onGoBackTap(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('error'),
            ),
          ));
        }
      },
    );
  }
}
