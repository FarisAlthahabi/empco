// ignore_for_file: file_names

import 'package:empco/Features/Auth/View/Forget_Password/forget_password_page.dart';
import 'package:empco/Features/Auth/View/Login/login_page.dart';
import 'package:empco/Features/Auth/View/Register/register_page.dart';
import 'package:empco/Features/Auth/View/Select_Role/select_role_page.dart';
import 'package:empco/Features/Auth/View/Verify_Email/verify_email_page.dart';
import 'package:empco/Features/Intro/View/intro_pages/Info_Screens.dart';
import 'package:empco/Features/Intro/View/intro_pages/Spalsh_Screen.dart';
import 'package:empco/Features/Roles/Company/jop_post/view/job_post_view.dart';
import 'package:empco/Features/Roles/Company/my_app/my_appliction.dart';
import 'package:empco/Features/Roles/Company/navigation_bar/navigation_bar.dart';
import 'package:empco/Features/Roles/Freelancer/Job_details/View/job_details.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:empco/Features/Roles/Freelancer/Navigation_Bar/navigation_bar.dart';
import 'package:empco/Features/Roles/common_pages/Verification/upload_licence_view.dart';
import 'package:empco/Features/Roles/common_pages/Verification/verification_status_view.dart';
import 'package:empco/Features/Roles/Company/edit_profile/edit_profile.dart';
import 'package:empco/Features/Roles/Company/profile/profile.dart';
import 'package:go_router/go_router.dart';

const mainRoute = '/';
const introRoute = '/Intro';
const loginRoute = '/Login';
const selectRoleRoute = '/SelectRole';
const signUpRoute = '/SignUp';
const verifyRoute = 'Verify/:email';
const forgetPasswordRoute = 'ForgetPassword';
const freelancerHomePageRoute = 'freelancerHomePage';
const companyHomePageRoute = 'companyHomePage';
const customerHomePageRoute = 'customerHomePage';
const jobDetailsRoute = 'JobDetails/:jobId';
const companyProfileRoute = 'companyProfile';
const accountVerificationRoute =
    'accountVerification/:verificationStatus/:userType';
const uploadLicenceRoute = 'uploadLicence/:userType';
const editCompanyProfileRoute = 'editCompanyProfile/:title';
const jobPostRoute = 'jobPost';
const myApplicationsRoute = 'myApplications';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: mainRoute,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: introRoute,
      builder: (context, state) => const IntroView(),
    ),
    GoRoute(
      path: selectRoleRoute,
      builder: (context, state) => const SelectRoleView(),
    ),
    GoRoute(
      path: signUpRoute,
      builder: (context, state) => const RegisterView(),
      routes: [
        GoRoute(
          path: verifyRoute,
          name: 'VerifyPage',
          builder: (context, state) => VerifyEamilView(
            email: state.pathParameters['email']!,
          ),
        ),
      ],
    ),
    GoRoute(
      path: loginRoute,
      builder: (context, state) => const LoginView(),
      routes: [
        GoRoute(
          path: forgetPasswordRoute,
          builder: (context, state) => const ForgetPasswordView(),
        ),
        GoRoute(
          path: freelancerHomePageRoute,
          builder: (context, state) => const FreelancerNavigationBarView(),
          routes: [
            GoRoute(
              path: uploadLicenceRoute,
              builder: (context, state) => UploadLicenceView(
                userType: state.pathParameters['userType']!,
              ),
            ),
            GoRoute(
              path: accountVerificationRoute,
              name: 'freelancerAccountVerification',
              builder: (context, state) => VerificationStatusView(
                verificationStatus: state.pathParameters['verificationStatus']!,
                userType: state.pathParameters['userType']!,
              ),
            ),
            GoRoute(
              path: jobDetailsRoute,
              builder: (context, state) => FreelancerJobDetailsView(
                jobId: int.parse(state.pathParameters['jobId']!),
              ),
            ),
            GoRoute(
              path: myApplicationsRoute,
              builder: (context, state) => const MyApplictionsView(),
            ),
          ],
        ),
        GoRoute(
          path: companyHomePageRoute,
          builder: (context, state) => const CompanyNavigationBar(),
          routes: [
            GoRoute(
              path: jobPostRoute,
              name: 'jobPostView',
              builder: (context, state) {
                JobModel? jobModel = state.extra as JobModel?;
                return JobPostView(job: jobModel);
              },
            ),
            GoRoute(
              path: uploadLicenceRoute,
              builder: (context, state) => UploadLicenceView(
                  userType: state.pathParameters['userType']!),
            ),
            GoRoute(
              path: accountVerificationRoute,
              name: 'companyAccountVerification',
              builder: (context, state) => VerificationStatusView(
                verificationStatus: state.pathParameters['verificationStatus']!,
                userType: state.pathParameters['userType']!,
              ),
            ),
            GoRoute(
              path: companyProfileRoute,
              builder: (context, state) => const CompanyProfileView(),
              routes: [
                GoRoute(
                  path: editCompanyProfileRoute,
                  builder: (context, state) => EditProfileView(
                    title: state.pathParameters['title'] ?? 'profile',
                  ),
                ),
              ],
            ),
          ],
        ),
        // GoRoute(
        //   path: customerHomePageRoute,
        //   builder: (context, state) => const CostumerNavigationBar(),
        // ),
      ],
    ),
  ],
);
