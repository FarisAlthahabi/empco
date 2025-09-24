import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';

import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/Widgets/main_error_widget.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/bloc/following_cubit/cubit/following_cubit.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/models/application_model/application_model.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Features/Roles/Company/is_empty_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FollowingViewCallBacks {
  void onUnFollowTap(int id);

  void onTryAgainTap();

  void onImageTap(int freelancerId);
}

@RoutePage()
class FollowingView extends StatelessWidget {
  const FollowingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<FollowingCubit>(),
      child: const FollowingPage(),
    );
  }
}

class FollowingPage extends StatefulWidget {
  const FollowingPage({super.key});

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage>
    implements FollowingViewCallBacks {
  late final FollowingCubit followingCubit = context.read();

  @override
  void initState() {
    followingCubit.getFriends();
    super.initState();
  }

  @override
  void onUnFollowTap(int id) {
    followingCubit.unfollowFriend(id);
  }

  @override
  void onImageTap(int freelancerId) {
    ApplicationModel applicationModel = ApplicationModel(
      id: 1,
      resume: '',
      status: 'rejected',
      freelancerId: 1,
      name: 'name',
      email: 'email',
      jobId: 1,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    context.go(
      extra: applicationModel,
      '$loginRoute/$companyHomePageRoute/$followingViewRoute/${navigatorProfileEmployeeViewRoute.replaceFirst(
        ':freelancerId',
        freelancerId.toString(),
      )}',
    );
  }

  @override
  void onTryAgainTap() {
    followingCubit.getFriends();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const EmpcoAppBar(
          automaticallyImplyLeading: true,
          title: Text(
            'Followings',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
          ),
        ),
        body: BlocBuilder<FollowingCubit, GeneralFollowingState>(
          builder: (context, state) {
            if (state is FollowingLoading) {
              return const LoadingIndicator();
            } else if (state is FollowingSuccess) {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 20,
                  );
                },
                shrinkWrap: true,
                itemCount: state.followings.length,
                itemBuilder: (context, index) {
                  final item = state.followings[index];
                  return ListTile(
                    onTap: () => onImageTap(item.friendOneAbleId),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: AppColors.black),
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(backgroundEditProfile),
                      ),
                    ),
                    title: Text(
                      item.friendOneAbleId.toString(),
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                            fontSize: 15),
                      ),
                    ),
                    subtitle: Text(
                      item.friendTwoAbleType,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Color(0xff808080),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                    trailing:
                        BlocConsumer<FollowingCubit, GeneralFollowingState>(
                      listener: (context, state) {
                        if (state is UnFollowSuccess) {
                          showSnackBarMethod(
                            context,
                            'Success to unfollow',
                            AppColors.green,
                          );
                        } else if (state is UnFollowFail) {
                          showSnackBarMethod(
                            context,
                            state.error,
                            AppColors.red,
                          );
                        }
                      },
                      builder: (context, state) {
                        Widget? child;
                        var onTap = () => onUnFollowTap(item.friendOneAbleId);
                        if (state is UnFollowLoading) {
                          child = const LoadingIndicator(
                            color: AppColors.white,
                          );
                          onTap = () {};
                        }
                        return MainActionButton(
                          width: 130,
                          icon: unfollowIcon,
                          textColor: AppColors.white,
                          buttonColor: const Color(0xffD44E4E),
                          height: 25.02,
                          text: 'Unfollow',
                          blurRadius: 1.36,
                          yAxisOffset: 1.36,
                          shadowColor: AppColors.boxShadowColor2,
                          fontSize: 9.81,
                          onTap: onTap,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              );
            } else if (state is FollowingEmpty) {
              return const EmptyView(
                textt: 'There is no friends',
              );
            } else if (state is FollowingFail) {
              return MainErrorWidget(
                error: state.error,
                onTap: onTryAgainTap,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
