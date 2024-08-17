import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Resources/Constants/texts.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/job_details_contact.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/bloc/following_cubit/cubit/following_cubit.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Features/Roles/Company/profile/view/widgets/icon_and_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class NavigatorProfileEmployeeViewCallBacks {
  void onMessageTap();
  void onFollowTap(int id);
  void onShowTap();
}

class NavigatorProfileEmployeeView extends StatelessWidget {
  const NavigatorProfileEmployeeView({
    super.key,
    required this.freelancerId,
  });

  final int freelancerId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<FollowingCubit>(),
      child: NavigatorProfileEmployeePage(
        freelancerId: freelancerId,
      ),
    );
  }
}

class NavigatorProfileEmployeePage extends StatefulWidget {
  const NavigatorProfileEmployeePage({
    super.key,
    required this.freelancerId,
  });

  final int freelancerId;

  @override
  State<NavigatorProfileEmployeePage> createState() =>
      _NavigatorProfileEmployeePageState();
}

class _NavigatorProfileEmployeePageState
    extends State<NavigatorProfileEmployeePage>
    implements NavigatorProfileEmployeeViewCallBacks {
  late final FollowingCubit followingCubit = context.read();
  @override
  void onMessageTap() {
    // TODO: implement onMessageTap
  }

  @override
  void onFollowTap(int id) {
    followingCubit.addFriend(id);
  }

  @override
  void onShowTap() {
    // TODO: implement onOrderTap
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const EmpcoAppBar(
          automaticallyImplyLeading: true,
          title: Text(
            profile,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const Image(
                image: AssetImage(backgroungProfile),
                fit: BoxFit.cover,
                width: 1200,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 75, left: 25),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.black),
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(backgroungProfile),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 30, top: 150, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MainActionButton(
                        onTap: onMessageTap,
                        icon: sendMessageIcon,
                        fontSize: 10,
                        textColor: const Color(0xff002245),
                        text: 'Message',
                        buttonColor: const Color(0xffEFF2F5),
                        height: 30,
                        blurRadius: 3.71,
                        yAxisOffset: 3.71,
                        shadowColor: Colors.black.withOpacity(0.25),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      BlocConsumer<FollowingCubit, GeneralFollowingState>(
                        listener: (context, state) {
                          if (state is AddFollowSuccess) {
                            showSnackBarMethod(
                              context,
                              'freelancer is followed now',
                              AppColors.green,
                            );
                          } else if (state is AddFollowFail) {
                            showSnackBarMethod(
                              context,
                              state.error,
                              AppColors.red,
                            );
                          }
                        },
                        builder: (context, state) {
                          Widget? child;
                          var onTap = () => onFollowTap(widget.freelancerId);
                          if (state is AddFollowLoading) {
                            child = const LoadingIndicator(
                              color: AppColors.white,
                            );
                            onTap = () {};
                          }
                          return MainActionButton(
                            onTap: onTap,
                            icon: followIcon,
                            textColor: AppColors.white,
                            text: 'Follow',
                            height: 30,
                            blurRadius: 3.71,
                            yAxisOffset: 3.71,
                            shadowColor: Colors.black.withOpacity(0.25),
                            child: child,
                          );
                        },
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 180,
                    ),
                    Row(
                      children: [
                        Text(
                          'Elon Mask',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '200',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          'followers',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Text(
                          'show services',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color(0xff1D5BA4),
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ),
                        const Icon(
                          Icons.open_in_new_outlined,
                          color: Color(0xff1D5BA4),
                          size: 13,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const IconWithText(
                      iconColor: Color(0xff15416F),
                      icon: workIcon,
                      text: 'Front-end developer',
                      textSize: 15,
                      iconSize: 30,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const IconWithText(
                      icon: companyIcon,
                      text: 'Ggdev company',
                      textSize: 15,
                      iconSize: 25,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const IconWithText(
                      icon: loctionIcon,
                      text: ' Damascus, Syria',
                      textSize: 15,
                      iconSize: 25,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const IconWithText(
                      icon: dateIcon,
                      text: '19/2/2000',
                      textSize: 15,
                      iconSize: 25,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const IconWithText(
                      icon: aboutIcon,
                      text: 'Brief',
                      textSize: 20,
                      iconSize: 25,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 15, left: 8),
                      child: Text(
                          'As a passionate front-end developer, I specialize in creating dynamic and visually appealing user interfaces. With a strong foundation in HTML, CSS, and JavaScript, I,m open to new opportunities.'),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 190, top: 30),
                      child: JobContactDetails(
                        email: 'faris@gmail.com',
                        phoneNumber: '+963768466036',
                        fontSize: 15,
                        title: 'Contact info',
                        width: 100,
                      ),
                    ),
                    const SizedBox(height: 30,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
