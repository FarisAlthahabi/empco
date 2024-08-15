import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Features/Roles/Company/edit_profile/widgets/TextFormFieldToProfile.dart';
import 'package:empco/Features/Roles/Company/profile/widgets/icon_and_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return EditProfilePage(
      title: title,
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
    this.title,
  });

  final String? title;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage>
    implements EditProfileViewCallBacks {

  final nameFocusNode = FocusNode();
  final locationFocusNode = FocusNode();
  final establishmentYearFocusNode = FocusNode();
  final ceoFocusNode = FocusNode();
  final overviewFocusNode = FocusNode();
  final projectsFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();

  @override
  void onCancel() {
    // TODO: implement onCancel
  }

  @override
  void onEditImage() {
    // TODO: implement onEditImage
  }

  @override
  void onCeoChanged(String ceo) {
    // TODO: implement onCeoChanged
  }

  @override
  void onCeoSubmitted(String ceo) {
    // TODO: implement onCeoSubmitted
  }

  @override
  void onEmailChanged(String email) {
    // TODO: implement onEmailChanged
  }

  @override
  void onEmailSubmitted(String email) {
    // TODO: implement onEmailSubmitted
  }

  @override
  void onEstablishmentYearChanged(String establishmentYear) {
    // TODO: implement onEstablishmentYearChanged
  }

  @override
  void onEstablishmentYearSubmitted(String establishmentYear) {
    // TODO: implement onEstablishmentYearSubmitted
  }

  @override
  void onLocationChanged(String location) {
    // TODO: implement onLocationChanged
  }

  @override
  void onLocationSubmitted(String location) {
    // TODO: implement onLocationSubmitted
  }

  @override
  void onNameChanged(String name) {
    // TODO: implement onNameChanged
  }

  @override
  void onNameSubmitted(String name) {
    // TODO: implement onNameSubmitted
  }

  @override
  void onOverviewChanged(String overview) {
    // TODO: implement onOverviewChanged
  }

  @override
  void onOverviewSubmitted(String overview) {
    // TODO: implement onOverviewSubmitted
  }

  @override
  void onPhoneNumberChanged(String phoneNumber) {
    // TODO: implement onPhoneNumberChanged
  }

  @override
  void onPhoneNumberSubmitted(String phoneNumber) {
    // TODO: implement onPhoneNumberSubmitted
  }

  @override
  void onProjectsChanged(String projects) {
    // TODO: implement onProjectsChanged
  }

  @override
  void onProjectsSubmitted(String projects) {
    // TODO: implement onProjectsSubmitted
  }

  @override
  void onSaveTap() {
    // TODO: implement onSaveTap
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
        body: ListView(
          children: [
            Stack(
              children: [
                const Image(
                  image: AssetImage(backgroundEditProfile),
                  fit: BoxFit.cover,
                  width: 1200,
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
                    onTap: () {},
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
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 200,
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
                        focusNode: ceoFocusNode,
                        onChanged: onCeoChanged,
                        onSubmitted: onCeoSubmitted,
                        height: 45,
                      ),
                      const SizedBox(
                        height: 3,
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
                        focusNode: projectsFocusNode,
                        onChanged: onPhoneNumberChanged,
                        onSubmitted: onPhoneNumberSubmitted,
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
                      Row(
                        children: [
                          const Icon(
                            Icons.email,
                            size: 30,
                          ),
                          TextFormFieldToProfile(
                            height: 45,
                            focusNode: emailFocusNode,
                            onChanged: onEmailChanged,
                            onSubmitted: onEmailSubmitted,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            size: 30,
                          ),
                          TextFormFieldToProfile(
                            height: 45,
                            focusNode: phoneNumberFocusNode,
                            onChanged: onPhoneNumberChanged,
                            onSubmitted: onPhoneNumberSubmitted,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MainActionButton(
                            textColor: AppColors.black,
                            text: 'Cancel',
                            buttonColor: const Color(0xffEFF2F5),
                            width: 104,
                            height: 32,
                            blurRadius: 3.71,
                            yAxisOffset: 3.71,
                            shadowColor: Colors.black.withOpacity(0.25),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          MainActionButton(
                            text: 'Save',
                            width: 104,
                            height: 32,
                            blurRadius: 3.71,
                            yAxisOffset: 3.71,
                            shadowColor: Colors.black.withOpacity(0.25),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
