import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/bloc/licence_cubit/cubit/licence_cubit.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class UploadLicenceViewCallBacks {
  Future<void> onUploadTap();
}

@RoutePage()
class UploadLicenceView extends StatelessWidget {
  const UploadLicenceView({
    super.key,
    required this.userType,
  });

  final String userType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<LicenceCubit>(),
      child: UploadLicencePage(
        userType: userType,
      ),
    );
  }
}

class UploadLicencePage extends StatefulWidget {
  const UploadLicencePage({
    super.key,
    required this.userType,
  });

  final String userType;

  @override
  State<UploadLicencePage> createState() => _UploadLicencePageState();
}

class _UploadLicencePageState extends State<UploadLicencePage>
    implements UploadLicenceViewCallBacks {
  late final LicenceCubit licenceCubit = context.read();

  late final UserRepo userRepo = context.read();

  PlatformFile? file;
  @override
  Future<void> onUploadTap() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = result.files.first;
      //file == null ? false : OpenAppFile.open(file!.path.toString());
     // print(file!.path.toString());
      licenceCubit.uploadLicence(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const EmpcoAppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Account Verfication',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(uploadImage),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Upload File',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                textAlign: TextAlign.center,
                'Upload the company"s license to be reviewed for verfication',
                style: GoogleFonts.poppins(
                  textStyle:
                      const TextStyle(color: AppColors.black, fontSize: 13),
                ),
              ),
            ),
            BlocConsumer<LicenceCubit, GeneralLicenceState>(
              listener: (context, state) {
                if (state is UploadLicenceSuccess) {
                  licenceCubit.getLicenceStatus();
                  userRepo.setKey(isLicenceUploaded, true);
                  if (widget.userType == 'freelacer') {
                    context.go('$loginRoute/$freelancerHomePageRoute');
                  } else if (widget.userType == 'owner') {
                    context.go('$loginRoute/$companyHomePageRoute');
                  }
                  showSnackBarMethod(
                    context,
                    state.uploadLicenceResponseModel.message,
                    AppColors.green,
                  );
                } else if (state is UploadLicenceFail) {
                  licenceCubit.getLicenceStatus();
                  userRepo.setKey(isLicenceUploaded, true);
                  if (widget.userType == 'freelacer') {
                    context.go('$loginRoute/$freelancerHomePageRoute');
                  } else if (widget.userType == 'owner') {
                    context.go('$loginRoute/$companyHomePageRoute');
                  }
                  showSnackBarMethod(
                    context,
                    state.error,
                    AppColors.red,
                  );
                }
              },
              builder: (context, state) {
                Widget widget = IconButton(
                  onPressed: onUploadTap,
                  icon: const Icon(
                    Icons.add_circle_outline,
                    size: 100,
                    color: Color(0xff1D5BA4),
                  ),
                );
                if (state is UploadLicenceLoading) {
                  widget = const LoadingIndicator();
                }
                return widget;
              },
            )
          ],
        ),
      ),
    ));
  }
}
