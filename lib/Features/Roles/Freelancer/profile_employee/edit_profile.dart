import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Features/Roles/Freelancer/profile_company/widgets/TextFormFieldToProfile.dart';
import 'package:empco/Features/Roles/Freelancer/profile_company/widgets/icon_and_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class EditProfileEmployeeViewCallBacks {
  void onNameChanged(String name);

  void onNameSubmitted(String name);

  void onLocationChanged(String location);

  void onLocationSubmitted(String location);

  void onJobTitleChanged(String jobTitle);

  void onJobTitleSubmitted(String jobTitle);

  void onWorkPlaceChanged(String workPlace);

  void onWorkPlaceSubmitted(String workPlace);

  void onBriefChanged(String brief);

  void onBriefSubmitted(String brief);

  void onEmailChanged(String email);

  void onEmailSubmitted(String email);

  void onPhoneNumberChanged(String phoneNumber);

  void onPhoneNumberSubmitted(String phoneNumber);

  void onEditImage();

  void onCancel();

  void onSaveTap();
}

class EditProfileEmployeeView extends StatelessWidget {
  const EditProfileEmployeeView({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return EditProfileEmployeePage(
      title: title,
    );
  }
}

class EditProfileEmployeePage extends StatefulWidget {
  const EditProfileEmployeePage({
    super.key,
    this.title,
  });

  final String? title;

  @override
  State<EditProfileEmployeePage> createState() =>
      _EditProfileEmployeePageState();
}

class _EditProfileEmployeePageState extends State<EditProfileEmployeePage>
    implements EditProfileEmployeeViewCallBacks {

  final nameFocusNode = FocusNode();
  final locationFocusNode = FocusNode();
  final jobTitleFocusNode = FocusNode();
  final workPlaceFocusNode = FocusNode();
  final briefFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();

      @override
  void onBriefChanged(String brief) {
    // TODO: implement onBriefChanged
  }
  
  @override
  void onBriefSubmitted(String brief) {
    // TODO: implement onBriefSubmitted
  }
  
  @override
  void onCancel() {
    // TODO: implement onCancel
  }
  
  @override
  void onEditImage() {
    // TODO: implement onEditImage
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
  void onJobTitleChanged(String jobTitle) {
    // TODO: implement onJobTitleChanged
  }
  
  @override
  void onJobTitleSubmitted(String jobTitle) {
    // TODO: implement onJobTitleSubmitted
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
  void onPhoneNumberChanged(String phoneNumber) {
    // TODO: implement onPhoneNumberChanged
  }
  
  @override
  void onPhoneNumberSubmitted(String phoneNumber) {
    // TODO: implement onPhoneNumberSubmitted
  }
  
  @override
  void onSaveTap() {
    // TODO: implement onSaveTap
  }
  
  @override
  void onWorkPlaceChanged(String workPlace) {
    // TODO: implement onWorkPlaceChanged
  }
  
  @override
  void onWorkPlaceSubmitted(String workPlace) {
    // TODO: implement onWorkPlaceSubmitted
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
                        icon: workIcon,
                        text: 'Job title',
                        textSize: 15,
                        iconSize: 25,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormFieldToProfile(
                        focusNode: jobTitleFocusNode,
                        onChanged: onJobTitleChanged,
                        onSubmitted: onJobTitleSubmitted,
                        height: 45,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const IconWithText(
                        iconColor: Colors.black,
                        icon: companyIcon,
                        text: 'Work place',
                        textSize: 15,
                        iconSize: 25,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormFieldToProfile(
                        focusNode: workPlaceFocusNode,
                        onChanged: onWorkPlaceChanged,
                        onSubmitted: onWorkPlaceSubmitted,
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
                        text: 'Brief',
                        textSize: 20,
                        iconSize: 25,
                      ),
                      TextFormFieldToProfile(
                        focusNode: briefFocusNode,
                        onChanged: onBriefChanged,
                        onSubmitted: onBriefSubmitted,
                        height: 125,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const IconWithText(
                        iconColor: Colors.black,
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
                            focusNode: emailFocusNode,
                            onChanged: onEmailChanged,
                            onSubmitted: onEmailSubmitted,
                            height: 45
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
                            focusNode: phoneNumberFocusNode ,
                            onChanged: onPhoneNumberChanged,
                            onSubmitted: onPhoneNumberSubmitted,
                             height: 45
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
                            textColor: Colors.black,
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
