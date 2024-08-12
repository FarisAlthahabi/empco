// ignore_for_file: file_names

import 'package:empco/Features/Auth/View/Forget_Password/forget_password_page.dart';
import 'package:empco/Features/Auth/View/Login/login_page.dart';
import 'package:empco/Features/Auth/View/Register/register_page.dart';
import 'package:empco/Features/Auth/View/Select_Role/select_role_page.dart';
import 'package:empco/Features/Auth/View/Verify_Email/verify_email_page.dart';
import 'package:empco/Features/Intro/View/intro_pages/Info_Screens.dart';
import 'package:empco/Features/Intro/View/intro_pages/Spalsh_Screen.dart';
import 'package:empco/Features/Roles/Company/navigation_bar/navigation_bar.dart';
import 'package:empco/Features/Roles/Freelancer/Job_Details/View/job_details.dart';
import 'package:empco/Features/Roles/Freelancer/Navigation_Bar/navigation_bar.dart';
import 'package:go_router/go_router.dart';

const mainRoute = '/';
const introRoute = 'Intro';
const loginRoute = 'Login';
const selectRoleRoute = 'SelectRole';
const signUpRoute = 'SignUp';
const verifyRoute = 'Verify/:email';
const forgetPasswordRoute = 'ForgetPassword';
const freelancerHomePageRoute = 'freelancerHomePage';
const companyHomePageRoute = 'companyHomePage';
const customerHomePageRoute = 'customerHomePage';
const jobDetailsRoute = 'JobDetails';
const profileRoute = 'profile';

GoRouter router = GoRouter(routes: [
  GoRoute(
      path: mainRoute,
      builder: (context, state) => const SplashView(),
      routes: [
        GoRoute(
            path: introRoute,
            builder: (context, state) => const IntroView(),
            routes: [
              GoRoute(
                path: loginRoute,
                builder: (context, state) => const LoginView(),
              ),
              GoRoute(
                path: selectRoleRoute,
                builder: (context, state) => const SelectRoleView(),
              ),
              GoRoute(
                path: signUpRoute,
                builder: (context, state) => const RegisterPage(),
              ),
              GoRoute(
                path: verifyRoute,
                name: 'VerifyPage',
                builder: (context, state) => VerifyEmailPage(
                  email: state.pathParameters['email']!,
                ),
              ),
              GoRoute(
                path: forgetPasswordRoute,
                builder: (context, state) => const ForgetPasswordPage(),
              ),
              GoRoute(
                path: freelancerHomePageRoute,
                builder: (context, state) => const FreelancerNavigationBar(),
              ),
              GoRoute(
                path: companyHomePageRoute,
                builder: (context, state) => const CompanyNavigationBar(),
              ),
              // GoRoute(
              //   path: customerHomePageRoute,
              //   builder: (context, state) => const CostumerNavigationBar(),
              // ),
              GoRoute(
                path: jobDetailsRoute,
                builder: (context, state) => const FreelancerJobDetailsView(),
              ),
              // GoRoute(
              //   path: profileRoute,
              //   builder: (context, state) => const FreelancerJobDetailsView(),
              // ),
            ]),
      ]),
]);
