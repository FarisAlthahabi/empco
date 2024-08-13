import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Resources/Constants/colors.dart';
import 'package:empco/Core/Resources/Constants/font_weights.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Features/Auth/View/Login/login_page.dart';
import 'package:empco/Features/Auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FreelancerDrawer extends StatelessWidget {
  const FreelancerDrawer({
    super.key,
    required this.callBacks,
    required this.titles,
    required this.icons,
    required this.image,
  });

  final List<VoidCallback> callBacks;
  final List<String> titles;
  final List<String> icons;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), bottomRight: Radius.circular(30))),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            )),
            child: Center(
                child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage(notionImage),
              ),
              title: Text(
                'Notion',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: white,
                    fontSize: 20,
                    fontWeight: weightlevel7,
                    height: 1.30,
                  ),
                ),
              ),
              subtitle: Text(
                'Technology and Software',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: const Color(0xFFDDDDDD),
                    fontSize: 13,
                    fontWeight: weightlevel7,
                    height: 1.20,
                  ),
                ),
              ),
            )),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is SuccessToLogoutState) {
                        if (index == 5 && titles.length == 6 ||
                            index == 7 && titles.length == 8 ||
                            index == 3 && titles.length == 4) {
                          showSnackBarMethod(
                              context, 'Logout out Successfully', green);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ));
                        }
                      } else if (state is FailedToLogoutState) {
                        if (index == 5 && titles.length == 6 ||
                            index == 7 && titles.length == 8 ||
                            index == 3 && titles.length == 4) {
                          showSnackBarMethod(context, state.error.error, red);
                        }
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingState) {
                        if (index != 5 && titles.length == 6 ||
                            index != 7 && titles.length == 8 ||
                            index != 3 && titles.length == 4) {
                          return SvgPicture.asset(icons[index]);
                        } else {
                          return SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: red,
                              ));
                        }
                      }
                      return SvgPicture.asset(icons[index]);
                    },
                  ),
                  onTap: index == 5 && titles.length == 6 ||
                          index == 7 && titles.length == 8 ||
                          index == 3 && titles.length == 4
                      ? () {
                          BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                        }
                      : callBacks[index],
                  title: Text(
                    titles[index],
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: const Color(0xFF393939),
                        fontSize: 14.5,
                        fontWeight: weightlevel6,
                        height: 1.21,
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
