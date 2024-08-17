import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Resources/Constants/font_weights.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Features/Auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.callBacks,
    required this.titles,
    required this.icons,
    required this.logout,
    required this.backgroundImage,
  });

  final List<VoidCallback> callBacks;
  final VoidCallback logout;
  final List<String> titles;
  final List<String> icons;
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(notionImage),
                ),
                title: Text(
                  'Notion',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: weightlevel7,
                      height: 1.30,
                    ),
                  ),
                ),
                subtitle: Text(
                  'Technology and Software',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color(0xFFDDDDDD),
                      fontSize: 13,
                      fontWeight: weightlevel7,
                      height: 1.20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SvgPicture.asset(icons[index]),
                    onTap: callBacks[index],
                    title: Text(
                      titles[index],
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Color(0xFF393939),
                          fontSize: 14.5,
                          fontWeight: weightlevel6,
                          height: 1.21,
                        ),
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: BlocConsumer<AuthBloc, GeneralAuthState>(
                  listener: (context, state) {
                    if (state is SuccessToLogoutState) {
                      showSnackBarMethod(
                        context,
                        'Logout out Successfully',
                        AppColors.green,
                      );
                      context.go('$mainRoute/$loginRoute');
                    } else if (state is FailedToLogoutState) {
                      showSnackBarMethod(
                        context,
                        state.error,
                        AppColors.red,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: AppColors.red,
                        ),
                      );
                    }
                    return SvgPicture.asset(logoutIcon);
                  },
                ),
                onTap: logout,
                title: Text(
                  'Log out',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color(0xFF393939),
                      fontSize: 14.5,
                      fontWeight: weightlevel6,
                      height: 1.21,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
