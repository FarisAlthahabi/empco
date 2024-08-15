import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/job_details_contact.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Features/Roles/Company/profile/widgets/icon_and_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class CompanyProfileViewCallBacks {
  void onEditTap();
}

@RoutePage()
class CompanyProfileView extends StatelessWidget {
  const CompanyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CompanyProfilePage();
  }
}

class CompanyProfilePage extends StatefulWidget {
  const CompanyProfilePage({super.key});

  @override
  State<CompanyProfilePage> createState() => _CompanyProfilePageState();
}

class _CompanyProfilePageState extends State<CompanyProfilePage>
    implements CompanyProfileViewCallBacks {
  @override
  void onEditTap() {
    context.go(
        '$mainRoute/$loginRoute/$freelancerHomePageRoute/$companyProfileRoute/${editCompanyProfileRoute.replaceFirst(
      ':title',
      'Edit Profile',
    )}');
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const EditProfileView(
    //       title: 'Edit Profile',
    //     ),
    //   ),
    // );
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
                  Row(
                    children: [
                      const Spacer(),
                      IconButton(
                        onPressed: onEditTap,
                        icon: const Icon(Icons.edit),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Deware Company',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '200 ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              'followers',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        IconWithText(
                          icon: badgeIcon,
                          text: 'Software Development',
                          textSize: 15,
                          iconSize: 30,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        IconWithText(
                          icon: loctionIcon,
                          text: ' Damascus, Syria',
                          textSize: 15,
                          iconSize: 25,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        IconWithText(
                          icon: connectionIcon,
                          text: ' 2019',
                          textSize: 15,
                          iconSize: 25,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        IconWithText(
                          icon: ceoIcon,
                          text: ' Elon Task',
                          textSize: 15,
                          iconSize: 25,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        IconWithText(
                          icon: aboutIcon,
                          text: 'Overview',
                          textSize: 20,
                          iconSize: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10, left: 8),
                          child: Text(
                              'A great victory is the result of a great work, Deware provides  full software Services based on your needs, with its great team and superior stuff'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        IconWithText(
                          icon: workIcon,
                          text: 'Projects',
                          textSize: 20,
                          iconSize: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, right: 10),
                          child: Text(
                              'website for DDS company  Mobile application for PDA company  Landing page for Travello company'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 190, top: 30),
                          child: JobContactDetails(
                            fontSize: 15,
                            title: 'Contact info',
                            width: 100,
                          ),
                        )
                      ],
                    ),
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
