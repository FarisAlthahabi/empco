import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/job_details_contact.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/Widgets/main_error_widget.dart';
import 'package:empco/Core/bloc/profile/cubit/profile_cubit.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/models/profile_model/profile_model.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Features/Roles/Company/profile/view/widgets/icon_and_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class CompanyProfileViewCallBacks {
  void onEditTap(ProfileModel profile);

  void onTryAgainTap();
}

@RoutePage()
class CompanyProfileView extends StatelessWidget {
  const CompanyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<ProfileCubit>(),
      child: const CompanyProfilePage(),
    );
  }
}

class CompanyProfilePage extends StatefulWidget {
  const CompanyProfilePage({super.key});

  @override
  State<CompanyProfilePage> createState() => _CompanyProfilePageState();
}

class _CompanyProfilePageState extends State<CompanyProfilePage>
    implements CompanyProfileViewCallBacks {
  late final ProfileCubit profileCubit = context.read();

  @override
  void initState() {
    profileCubit.getProfile();
    super.initState();
  }

  @override
  void onEditTap(ProfileModel profile) {
    context.go(
        extra: profile,
        '$mainRoute/$loginRoute/$companyHomePageRoute/${editCompanyProfileRoute.replaceFirst(
          ':title',
          'Edit Profile',
        )}');
  }

  @override
  void onTryAgainTap() {
    profileCubit.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const EmpcoAppBar(
          automaticallyImplyLeading: true,
          title: Text(
            'profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff1D5BA4),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  const Image(
                    image: AssetImage(backgroungProfile),
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                  ),
                  BlocBuilder<ProfileCubit, GeneralProfileState>(
                    builder: (context, state) {
                      if (state is ProfileLoading) {
                        return const Column(
                          children: [
                            SizedBox(
                              height: 200,
                            ),
                            LoadingIndicator(),
                          ],
                        );
                      } else if (state is ProfileSuccess) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () => onEditTap(state.profile),
                                    icon: const Icon(Icons.edit),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    state.profile.homePlace ?? 'Company Name',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    state.profile.workAs ?? '200 ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  const Text(
                                    ' followers',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              IconWithText(
                                icon: badgeIcon,
                                text: state.profile.workAs ??
                                    'Software Development',
                                textSize: 15,
                                iconSize: 30,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              IconWithText(
                                icon: loctionIcon,
                                text: state.profile.homePlace ??
                                    ' Damascus, Syria',
                                textSize: 15,
                                iconSize: 25,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              IconWithText(
                                icon: connectionIcon,
                                text: state.profile.birthday ?? ' 2019',
                                textSize: 15,
                                iconSize: 25,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              IconWithText(
                                icon: ceoIcon,
                                text: state.profile.foundation ?? ' Elon Task',
                                textSize: 15,
                                iconSize: 25,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const IconWithText(
                                icon: aboutIcon,
                                text: 'Overview',
                                textSize: 20,
                                iconSize: 25,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 8),
                                child: Text(state.profile.overview ??
                                    'A great victory is the result of a great work, Deware provides  full software Services based on your needs, with its great team and superior stuff'),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const IconWithText(
                                icon: workIcon,
                                text: 'Projects',
                                textSize: 20,
                                iconSize: 25,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(state.profile.projects ??
                                  'website for DDS company  Mobile application for PDA company  Landing page for Travello company'),
                              const SizedBox(
                                height: 20,
                              ),
                              JobContactDetails(
                                email:
                                    state.profile.email ?? 'deware@gmail.com',
                                phoneNumber:
                                    state.profile.phoneNo ?? '+963764847864',
                                fontSize: 15,
                                title: 'Contact info',
                                width: 100,
                              )
                            ],
                          ),
                        );
                      } else if (state is ProfileFail) {
                        return MainErrorWidget(
                          error: state.error,
                          onTap: onTryAgainTap,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 75, left: 25),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      color: Colors.black),
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(backgroungProfile),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
