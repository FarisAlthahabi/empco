import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/bloc/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:empco/Core/bloc/profile/cubit/profile_cubit.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/extensions/date_time_x.dart';
import 'package:empco/Core/models/profile_model/profile_model.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Features/Roles/Company/edit_profile/widgets/TextFormFieldToProfile.dart';
import 'package:empco/Features/Roles/Company/profile/view/widgets/icon_and_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class EditProfileViewCallBacks {
  void onNameChanged(String name);

  void onNameSubmitted(String name);

  void onLocationChanged(String location);

  void onLocationSubmitted(String location);

  void onEstablishmentYearChanged(String establishmentYear);

  void onEstablishmentYearSubmitted(String establishmentYear);

  void onCeoChanged(String ceo);

  void onCeoSubmitted(String ceo);

  void onOverviewChanged(String overview);

  void onOverviewSubmitted(String overview);

  void onProjectsChanged(String projects);

  void onProjectsSubmitted(String projects);

  void onEmailChanged(String email);

  void onEmailSubmitted(String email);

  void onPhoneNumberChanged(String phoneNumber);

  void onPhoneNumberSubmitted(String phoneNumber);

  void onEditImage();

  void onCancel();

  void onSaveTap();
}

@RoutePage()
class EditProfileView extends StatelessWidget {
  const EditProfileView({
    super.key,
    this.title,
    this.profileModel,
  });

  final String? title;
  final ProfileModel? profileModel;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => config<EditProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => config<ProfileCubit>(),
        ),
      ],
      child: EditProfilePage(title: title, profileModel: profileModel),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
    this.title,
    this.profileModel,
  });

  final String? title;
  final ProfileModel? profileModel;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage>
    implements EditProfileViewCallBacks {
  late final EditProfileCubit editProfileCubit = context.read();

  late final ProfileCubit profileCubit = context.read();

  late final UserRepo userRepo = context.read();

  final nameFocusNode = FocusNode();
  final locationFocusNode = FocusNode();
  final establishmentYearFocusNode = FocusNode();
  final ceoFocusNode = FocusNode();
  final overviewFocusNode = FocusNode();
  final projectsFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();

  @override
  void initState() {
    final profile = widget.profileModel;
    if (profile != null) {
      // editProfileCubit.setName(profile.name);
      editProfileCubit
          .setBirthday(profile.birthday ?? DateTime.now().formatMMddYYYY);
      editProfileCubit.setBrief(profile.brief ?? 'brief');
      editProfileCubit.setLocation(profile.homePlace ?? 'damas');
      editProfileCubit.setPhoneNumber(profile.phoneNo ?? '+963768977687');
      editProfileCubit.setEmail(profile.email ?? 'wael@gmail.com');
      editProfileCubit.setCeo(profile.ceo ?? 'ceo');
      editProfileCubit.setOverview(profile.overview ?? 'overview');
      editProfileCubit.setProjects(profile.projects ?? 'empco');
    }
    super.initState();
  }

  @override
  void onCancel() {
    context.pop();
  }

  @override
  void onEditImage() {
    // TODO: implement onEditImage
  }

  @override
  void onCeoChanged(String ceo) {
    editProfileCubit.setCeo(ceo);
  }

  @override
  void onCeoSubmitted(String ceo) {
    overviewFocusNode.requestFocus();
  }

  @override
  void onEmailChanged(String email) {
    editProfileCubit.setEmail(email);
  }

  @override
  void onEmailSubmitted(String email) {
    phoneNumberFocusNode.requestFocus();
  }

  @override
  void onEstablishmentYearChanged(String establishmentYear) {
    editProfileCubit.setBirthday(establishmentYear);
  }

  @override
  void onEstablishmentYearSubmitted(String establishmentYear) {
    ceoFocusNode.requestFocus();
  }

  @override
  void onLocationChanged(String location) {
    editProfileCubit.setLocation(location);
  }

  @override
  void onLocationSubmitted(String location) {
    establishmentYearFocusNode.requestFocus();
  }

  @override
  void onNameChanged(String name) {
    editProfileCubit.setName(name);
  }

  @override
  void onNameSubmitted(String name) {
    locationFocusNode.requestFocus();
  }

  @override
  void onOverviewChanged(String overview) {
    editProfileCubit.setOverview(overview);
  }

  @override
  void onOverviewSubmitted(String overview) {
    projectsFocusNode.requestFocus();
  }

  @override
  void onPhoneNumberChanged(String phoneNumber) {
    editProfileCubit.setPhoneNumber(phoneNumber);
  }

  @override
  void onPhoneNumberSubmitted(String phoneNumber) {
    phoneNumberFocusNode.unfocus();
  }

  @override
  void onProjectsChanged(String projects) {
    editProfileCubit.setProjects(projects);
  }

  @override
  void onProjectsSubmitted(String projects) {
    emailFocusNode.requestFocus();
  }

  @override
  void onSaveTap() {
    editProfileCubit.editProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: EmpcoAppBar(
          automaticallyImplyLeading: true,
          title: Text(
            widget.title ?? 'Profile Setup',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      const Image(
                        image: AssetImage(backgroundEditProfile),
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            const IconWithText(
                              iconColor: Colors.black,
                              icon: personIcon,
                              text: ' Name',
                              textSize: 15,
                              iconSize: 20,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            TextFormFieldToProfile(
                              initialValue: widget.profileModel?.bio,
                              focusNode: nameFocusNode,
                              onChanged: onNameChanged,
                              onSubmitted: onNameSubmitted,
                              height: 45,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const IconWithText(
                              iconColor: Colors.black,
                              icon: loctionIcon,
                              text: 'Location',
                              textSize: 15,
                              iconSize: 25,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            TextFormFieldToProfile(
                              initialValue: widget.profileModel?.homePlace,
                              focusNode: locationFocusNode,
                              onChanged: onLocationChanged,
                              onSubmitted: onLocationSubmitted,
                              height: 45,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const IconWithText(
                              iconColor: Colors.black,
                              icon: connectionIcon,
                              text: 'Establish Year',
                              textSize: 15,
                              iconSize: 25,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            TextFormFieldToProfile(
                              initialValue: widget.profileModel?.birthday,
                              focusNode: establishmentYearFocusNode,
                              onChanged: onEstablishmentYearChanged,
                              onSubmitted: onEstablishmentYearSubmitted,
                              height: 45,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const IconWithText(
                              iconColor: Colors.black,
                              icon: ceoIcon,
                              text: 'Ceo',
                              textSize: 15,
                              iconSize: 25,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            TextFormFieldToProfile(
                              initialValue: widget.profileModel?.ceo,
                              focusNode: ceoFocusNode,
                              onChanged: onCeoChanged,
                              onSubmitted: onCeoSubmitted,
                              height: 45,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const IconWithText(
                              iconColor: Colors.black,
                              icon: aboutIcon,
                              text: 'Overview',
                              textSize: 20,
                              iconSize: 25,
                            ),
                            TextFormFieldToProfile(
                              initialValue: widget.profileModel?.overview,
                              focusNode: overviewFocusNode,
                              onChanged: onOverviewChanged,
                              onSubmitted: onOverviewSubmitted,
                              height: 125,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const IconWithText(
                              iconColor: Colors.black,
                              icon: workIcon,
                              text: 'Projects',
                              textSize: 20,
                              iconSize: 25,
                            ),
                            TextFormFieldToProfile(
                              initialValue: widget.profileModel?.projects,
                              focusNode: projectsFocusNode,
                              onChanged: onProjectsChanged,
                              onSubmitted: onProjectsSubmitted,
                              height: 125,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const IconWithText(
                              iconColor: AppColors.black,
                              icon: contactIcon,
                              text: 'Contact info',
                              textSize: 20,
                              iconSize: 25,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            TextFormFieldToProfile(
                              initialValue: widget.profileModel?.email,
                              height: 45,
                              focusNode: emailFocusNode,
                              onChanged: onEmailChanged,
                              onSubmitted: onEmailSubmitted,
                              prefixIcon: smallEmailIcon,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            TextFormFieldToProfile(
                              initialValue: widget.profileModel?.phoneNo,
                              height: 45,
                              focusNode: phoneNumberFocusNode,
                              onChanged: onPhoneNumberChanged,
                              onSubmitted: onPhoneNumberSubmitted,
                              prefixIcon: smallPhoneIcon,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 75, left: 160),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Color(0xffE0E0E0)),
                      child: const Center(
                        child: Icon(
                          Icons.person_outline,
                          size: 80,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 185, top: 180, right: 150),
                    child: InkWell(
                      onTap: onCancel,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            editImageIcon,
                            width: 20,
                          ),
                          Text(
                            'edit',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Color(0xff1D5BA4),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 30),
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MainActionButton(
                      textColor: AppColors.black,
                      text: 'Cancel',
                      buttonColor: const Color(0xffEFF2F5),
                      height: 32,
                      blurRadius: 3.71,
                      yAxisOffset: 3.71,
                      shadowColor: Colors.black.withOpacity(0.25),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    BlocConsumer<EditProfileCubit, GeneralEditProfileState>(
                      listener: (context, state) async {
                        if (state is EditProfileSuccess) {
                          await userRepo.setKey(isProfileCreated, true);
                          showSnackBarMethod(
                            context,
                            await userRepo.getKey(isProfileCreated)
                                ? 'profile is updated successfully'
                                : 'profile is created successfully',
                            AppColors.green,
                          );
                          // profileCubit.getProfile();
                          context.pop();
                        } else if (state is EditProfileFail) {
                          showSnackBarMethod(
                            context,
                            state.error,
                            AppColors.red,
                          );
                        }
                      },
                      builder: (context, state) {
                        Widget? child;
                        var onTap = onSaveTap;
                        if (state is EditProfileLoading) {
                          child = const LoadingIndicator(
                            color: AppColors.white,
                          );
                          onTap = () {};
                        }
                        return MainActionButton(
                          onTap: onTap,
                          text: widget.profileModel == null
                              ? 'Save'
                              : 'Apply Changes',
                          height: 32,
                          blurRadius: 3.71,
                          yAxisOffset: 3.71,
                          shadowColor: Colors.black.withOpacity(0.25),
                          child: child,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
