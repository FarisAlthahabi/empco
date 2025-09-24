// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'empco_router.dart';

/// generated route for
/// [AuthenticationView]
class AuthenticationRoute extends PageRouteInfo<void> {
  const AuthenticationRoute({List<PageRouteInfo>? children})
      : super(
          AuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthenticationView();
    },
  );
}

/// generated route for
/// [CompanyProfileView]
class CompanyProfileRoute extends PageRouteInfo<void> {
  const CompanyProfileRoute({List<PageRouteInfo>? children})
      : super(
          CompanyProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyProfileView();
    },
  );
}

/// generated route for
/// [EditProfileView]
class EditProfileRoute extends PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    Key? key,
    String? title,
    ProfileModel? profileModel,
    List<PageRouteInfo>? children,
  }) : super(
          EditProfileRoute.name,
          args: EditProfileRouteArgs(
            key: key,
            title: title,
            profileModel: profileModel,
          ),
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditProfileRouteArgs>(
          orElse: () => const EditProfileRouteArgs());
      return EditProfileView(
        key: args.key,
        title: args.title,
        profileModel: args.profileModel,
      );
    },
  );
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({
    this.key,
    this.title,
    this.profileModel,
  });

  final Key? key;

  final String? title;

  final ProfileModel? profileModel;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, title: $title, profileModel: $profileModel}';
  }
}

/// generated route for
/// [EmpcoNavigationBarView]
class EmpcoNavigationBarRoute
    extends PageRouteInfo<EmpcoNavigationBarRouteArgs> {
  EmpcoNavigationBarRoute({
    Key? key,
    required List<Widget> pages,
    List<PageRouteInfo>? children,
  }) : super(
          EmpcoNavigationBarRoute.name,
          args: EmpcoNavigationBarRouteArgs(
            key: key,
            pages: pages,
          ),
          initialChildren: children,
        );

  static const String name = 'EmpcoNavigationBarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EmpcoNavigationBarRouteArgs>();
      return EmpcoNavigationBarView(
        key: args.key,
        pages: args.pages,
      );
    },
  );
}

class EmpcoNavigationBarRouteArgs {
  const EmpcoNavigationBarRouteArgs({
    this.key,
    required this.pages,
  });

  final Key? key;

  final List<Widget> pages;

  @override
  String toString() {
    return 'EmpcoNavigationBarRouteArgs{key: $key, pages: $pages}';
  }
}

/// generated route for
/// [FollowingView]
class FollowingRoute extends PageRouteInfo<void> {
  const FollowingRoute({List<PageRouteInfo>? children})
      : super(
          FollowingRoute.name,
          initialChildren: children,
        );

  static const String name = 'FollowingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FollowingView();
    },
  );
}

/// generated route for
/// [ForgetPasswordView]
class ForgetPasswordRoute extends PageRouteInfo<void> {
  const ForgetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForgetPasswordView();
    },
  );
}

/// generated route for
/// [FreelancerNavigationBarView]
class FreelancerNavigationBarRoute extends PageRouteInfo<void> {
  const FreelancerNavigationBarRoute({List<PageRouteInfo>? children})
      : super(
          FreelancerNavigationBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'FreelancerNavigationBarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FreelancerNavigationBarView();
    },
  );
}

/// generated route for
/// [IntroRoutePage]
class IntroRouter extends PageRouteInfo<void> {
  const IntroRouter({List<PageRouteInfo>? children})
      : super(
          IntroRouter.name,
          initialChildren: children,
        );

  static const String name = 'IntroRouter';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const IntroRoutePage();
    },
  );
}

/// generated route for
/// [IntroView]
class IntroRoute extends PageRouteInfo<void> {
  const IntroRoute({List<PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const IntroView();
    },
  );
}

/// generated route for
/// [JobAppView]
class JobAppRoute extends PageRouteInfo<void> {
  const JobAppRoute({List<PageRouteInfo>? children})
      : super(
          JobAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'JobAppRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const JobAppView();
    },
  );
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginView();
    },
  );
}

/// generated route for
/// [MainNavigationView]
class MainNavigationRoute extends PageRouteInfo<void> {
  const MainNavigationRoute({List<PageRouteInfo>? children})
      : super(
          MainNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainNavigationView();
    },
  );
}

/// generated route for
/// [MyApplictionsView]
class MyApplictionsRoute extends PageRouteInfo<void> {
  const MyApplictionsRoute({List<PageRouteInfo>? children})
      : super(
          MyApplictionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyApplictionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyApplictionsView();
    },
  );
}

/// generated route for
/// [RegisterView]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterView();
    },
  );
}

/// generated route for
/// [SelectRoleView]
class SelectRoleRoute extends PageRouteInfo<void> {
  const SelectRoleRoute({List<PageRouteInfo>? children})
      : super(
          SelectRoleRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectRoleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SelectRoleView();
    },
  );
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsView();
    },
  );
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashView();
    },
  );
}

/// generated route for
/// [UploadLicenceView]
class UploadLicenceRoute extends PageRouteInfo<UploadLicenceRouteArgs> {
  UploadLicenceRoute({
    Key? key,
    required String userType,
    List<PageRouteInfo>? children,
  }) : super(
          UploadLicenceRoute.name,
          args: UploadLicenceRouteArgs(
            key: key,
            userType: userType,
          ),
          initialChildren: children,
        );

  static const String name = 'UploadLicenceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UploadLicenceRouteArgs>();
      return UploadLicenceView(
        key: args.key,
        userType: args.userType,
      );
    },
  );
}

class UploadLicenceRouteArgs {
  const UploadLicenceRouteArgs({
    this.key,
    required this.userType,
  });

  final Key? key;

  final String userType;

  @override
  String toString() {
    return 'UploadLicenceRouteArgs{key: $key, userType: $userType}';
  }
}

/// generated route for
/// [VerificationStatusView]
class VerificationStatusRoute
    extends PageRouteInfo<VerificationStatusRouteArgs> {
  VerificationStatusRoute({
    Key? key,
    required String verificationStatus,
    required String userType,
    List<PageRouteInfo>? children,
  }) : super(
          VerificationStatusRoute.name,
          args: VerificationStatusRouteArgs(
            key: key,
            verificationStatus: verificationStatus,
            userType: userType,
          ),
          initialChildren: children,
        );

  static const String name = 'VerificationStatusRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationStatusRouteArgs>();
      return VerificationStatusView(
        key: args.key,
        verificationStatus: args.verificationStatus,
        userType: args.userType,
      );
    },
  );
}

class VerificationStatusRouteArgs {
  const VerificationStatusRouteArgs({
    this.key,
    required this.verificationStatus,
    required this.userType,
  });

  final Key? key;

  final String verificationStatus;

  final String userType;

  @override
  String toString() {
    return 'VerificationStatusRouteArgs{key: $key, verificationStatus: $verificationStatus, userType: $userType}';
  }
}
