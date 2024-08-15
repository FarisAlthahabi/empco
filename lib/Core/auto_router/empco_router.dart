import 'package:auto_route/auto_route.dart';
import 'package:empco/Features/Auth/View/Forget_Password/forget_password_page.dart';
import 'package:empco/Features/Auth/View/Login/login_page.dart';
import 'package:empco/Features/Auth/View/Register/register_page.dart';
import 'package:empco/Features/Auth/View/Select_Role/select_role_page.dart';
import 'package:empco/Features/Intro/View/intro_pages/Info_Screens.dart';
import 'package:empco/Features/Intro/View/intro_pages/Spalsh_Screen.dart';
import 'package:empco/Features/Intro/View/intro_pages/intro_router.dart';
import 'package:empco/Features/Roles/Freelancer/Navigation_Bar/navigation_bar.dart';
import 'package:empco/Features/Roles/Freelancer/Verification/upload_licence_view.dart';
import 'package:empco/Features/Roles/Freelancer/Verification/verification_status_view.dart';
import 'package:empco/Features/Roles/Company/profile_company/edit_profile.dart';
import 'package:empco/Features/Roles/Company/profile_company/profile.dart';
import 'package:empco/Features/auth_manager/view/auth_view.dart';
import 'package:empco/Features/main_navigation/view/main_navigation_view.dart';
import 'package:flutter/material.dart';

part 'empco_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Tab|Page,Route')
class AppRouter extends RootStackRouter  {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          initial: true,
          transitionsBuilder: TransitionsBuilders.noTransition,
          page: SplashRoute.page,
        ),
        AdaptiveRoute(
          page: AuthenticationRoute.page,
          children: [
            AdaptiveRoute(
              page: LoginRoute.page,
            ),
            AutoRoute(
              page: IntroRouter.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: IntroRoute.page,
                ),
                AutoRoute(
                  page: SelectRoleRoute.page,
                ),
              ],
            ),
            AdaptiveRoute(
              page: MainNavigationRoute.page,
              children: [
                // AutoRoute(
                //   initial: true,
                //   page: DashboardRoute.page,
                //   children: [
                //     AutoRoute(
                //       initial: true,
                //       page: HomeRoute.page,
                //     ),
                //     AutoRoute(
                //       page: BreedersRoute.page,
                //     ),
                //     AutoRoute(
                //       page: LittersRoute.page,
                //     ),
                //     AutoRoute(
                //       page: SettingsRoute.page,
                //     ),
                //   ],
                // ),
                // AutoRoute(
                //   page: BreederDetailsRoute.page,
                // ),
            
              ],
            ),
          ],
        ),
      ];
}
