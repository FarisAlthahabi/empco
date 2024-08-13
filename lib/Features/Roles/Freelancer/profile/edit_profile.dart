import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Features/Roles/Freelancer/profile/widgets/TextFormFieldToProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class EditProfileViewCallBacks {
  void onImagePicked();

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

  void onContactInfoOneChanged(String contactInfoOne);

  void onContactInfoOneSubmitted(String contactInfoOne);

  void onContactInfoTwoChanged(String contactInfoTwo);

  void onContactInfoTwoSubmitted(String contactInfoTwo);

  void onCancelTap();

  void onSaveTap();
}

@RoutePage()
class EditProfileView extends StatelessWidget {
  const EditProfileView({
    super.key,
    required this.title,
  });

  final String title;

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
  final focusNodes = List.generate(
    8,
    (index) => FocusNode(),
  );

  @override
  void onCancelTap() {
    // TODO: implement onCancelTap
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
  void onContactInfoOneChanged(String contactInfoOne) {
    // TODO: implement onContactInfoOneChanged
  }

  @override
  void onContactInfoOneSubmitted(String contactInfoOne) {
    // TODO: implement onContactInfoOneSubmitted
  }

  @override
  void onContactInfoTwoChanged(String contactInfoTwo) {
    // TODO: implement onContactInfoTwoChanged
  }

  @override
  void onContactInfoTwoSubmitted(String contactInfoTwo) {
    // TODO: implement onContactInfoTwoSubmitted
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
  void onImagePicked() {
    // TODO: implement onImagePicked
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
  late final List<ValueSetter<String>> onChanged = [
    onNameChanged,
    onLocationChanged,
    onEstablishmentYearChanged,
    onCeoChanged,
    onOverviewChanged,
    onProjectsChanged,
    onContactInfoOneChanged,
    onContactInfoTwoChanged,
  ];

  late final List<ValueSetter<String>> onSubmitted = [
    onNameSubmitted,
    onLocationSubmitted,
    onEstablishmentYearSubmitted,
    onCeoSubmitted,
    onOverviewSubmitted,
    onProjectsSubmitted,
    onContactInfoOneSubmitted,
    onContactInfoTwoSubmitted,
  ];

  final textFieldsTitles = [
    'Name',
    'Location',
    'Establishment year',
    'Ceo',
    'Overview',
    'Projects',
    'Contact Info',
    null
  ];
  final textFieldsIcons = [
    personIcon,
    loctionIcon,
    connectionIcon,
    ceoIcon,
    aboutIcon,
    workIcon,
    contactIcon,
    null,
  ];

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
        body: SingleChildScrollView(
          child: 
              Stack(
                children: [
                  Column(
                    children: [
                      const Image(
                        image: AssetImage(backgroundEditProfile),
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                      ),                      
                      const SizedBox(height: 100,),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: onChanged.length,
                        itemBuilder: (context, index) {
                          return TextFormFieldToProfile(
                            focusNode: focusNodes[index],
                            onChanged: onChanged[index],
                            onSubmitted: onSubmitted[index],
                            icon:  index < 7 ? textFieldsIcons[index] : null,
                            title: index < 7 ? textFieldsTitles[index] : null,
                            textSize: index < 4 ? 15 : 20,
                            height: 45,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 12,
                          );
                        },
                      ),
                      const SizedBox(
                height: 50,
              ),
           
                    ],
                  ),
                  
                  Positioned(
                    top:70 ,
                    left: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
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
                        const SizedBox(height: 10,),
                        InkWell(
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
                      ],
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
