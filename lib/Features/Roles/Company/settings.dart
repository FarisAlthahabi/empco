import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';

import 'package:empco/Core/Widgets/empco_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  int? selectLanguage; // 1 Dark   2 Light
  int? selectTheme; // 1 arabic   2 english
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: const EmpcoAppBar(
              automaticallyImplyLeading: true,
              title: Text(
                'Settings',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                                builder: (context, StateSetter setState) {
                              return AlertDialog(
                                alignment: Alignment.center,
                                title: const Text(
                                  "Choose Theme",
                                  style: TextStyle(fontFamily: 'ReadexPro'),
                                ),
                                content: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        title: const Text('Dark'),
                                        leading: Radio<int>(
                                          value: 1,
                                          groupValue: selectLanguage,
                                          onChanged: (value) {
                                            setState(() {
                                              selectLanguage = value;
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: const Text('Light'),
                                        leading: Radio<int>(
                                          value: 2,
                                          groupValue: selectLanguage,
                                          onChanged: (value) {
                                            setState(() {
                                              selectLanguage = value;
                                            });
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            });
                          });
                    },
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: Row(
                        children: [
                          SvgPicture.asset(themesIcon),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Theme',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                                builder: (context, StateSetter setState) {
                              return AlertDialog(
                                alignment: Alignment.center,
                                title: const Text(
                                  "Choose Language",
                                  style: TextStyle(fontFamily: 'ReadexPro'),
                                ),
                                content: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        title: const Text('العربية'),
                                        leading: Radio<int>(
                                          value: 1,
                                          groupValue: selectLanguage,
                                          onChanged: (value) {
                                            setState(() {
                                              selectLanguage = value;
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: const Text('English'),
                                        leading: Radio<int>(
                                          value: 2,
                                          groupValue: selectLanguage,
                                          onChanged: (value) {
                                            setState(() {
                                              selectLanguage = value;
                                            });
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            });
                          });
                    },
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            languageIcon,
                            width: 25,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Language',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
