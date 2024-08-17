import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/bloc/applications_cubit/cubit/applications_cubit.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/models/application_model/application_model.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ViewApplicationViewCallBacks {
  void onApproveTap(int applicationId);

  void onRejectTap(int applicationId);

  void onNameTap();
}

class ViewApplicationView extends StatelessWidget {
  const ViewApplicationView({super.key, required this.applicationModel});

  final ApplicationModel applicationModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<ApplicationsCubit>(),
      child: ViewApplicationPage(
        applicationModel: applicationModel,
      ),
    );
  }
}

class ViewApplicationPage extends StatefulWidget {
  const ViewApplicationPage({
    super.key,
    required this.applicationModel,
  });

  final ApplicationModel applicationModel;

  @override
  State<ViewApplicationPage> createState() => _ViewApplicationPageState();
}

class _ViewApplicationPageState extends State<ViewApplicationPage>
    implements ViewApplicationViewCallBacks {
  late final ApplicationsCubit applicationsCubit = context.read();

  @override
  void onApproveTap(int applicationId) {
    applicationsCubit.approveApplications(applicationId);
  }

  @override
  void onRejectTap(int applicationId) {
    applicationsCubit.rejectApplications(applicationId);
  }

  @override
  void onNameTap() {
    context.go(
      extra: widget.applicationModel,
      '$loginRoute/$companyHomePageRoute/$jobAppViewRoute/$viewApplicationViewRoute/${navigatorProfileEmployeeViewRoute.replaceFirst(':freelancerId', widget.applicationModel.freelancerId.toString(),)}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const EmpcoAppBar(
          automaticallyImplyLeading: true,
          title: Text(
            'Application Details',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 40, top: 40, right: 15),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Basic Info',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Name',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: onNameTap,
                          child: Text(
                            widget.applicationModel.name,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Color(0xff224A79),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Email',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Text(
                          widget.applicationModel.email,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color(0xff224A79),
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Resume',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade300,
                      ),
                      width: 300,
                      height: 380,
                      child: Image.network('http://10.0.2.2:8000/${widget.applicationModel.resume}'),

                      // child: SfPdfViewer.network(
                      //   widget.applicationModel.resume,
                      // ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, bottom: 30),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BlocConsumer<ApplicationsCubit, GeneralApplicationsState>(
                        listener: (context, state) {
                          if (state is RejectApplicationSuccess) {
                            showSnackBarMethod(
                              context,
                              'application rejected successfully',
                              AppColors.green,
                            );
                          } else if (state is RejectApplicationFail) {
                            showSnackBarMethod(
                              context,
                              state.error,
                              AppColors.red,
                            );
                          }
                        },
                        builder: (context, state) {
                          Widget? child;
                          var onTap =
                              () => onRejectTap(widget.applicationModel.id);
                          if (state is RejectApplicationLoading) {
                            child = const LoadingIndicator();
                            onTap = () {};
                          }
                          return MainActionButton(
                            textColor: AppColors.red,
                            text: 'Reject',
                            buttonColor: const Color(0xffEFF2F5),
                            height: 32,
                            blurRadius: 3.71,
                            yAxisOffset: 3.71,
                            shadowColor: AppColors.black.withOpacity(0.25),
                            onTap: onTap,
                            child: child,
                          );
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      BlocConsumer<ApplicationsCubit, GeneralApplicationsState>(
                        listener: (context, state) {
                          if (state is ApproveApplicationSuccess) {
                            showSnackBarMethod(
                              context,
                              'application approved successfully',
                              AppColors.green,
                            );
                          } else if (state is ApproveApplicationFail) {
                            showSnackBarMethod(
                              context,
                              state.error,
                              AppColors.red,
                            );
                          }
                        },
                        builder: (context, state) {
                          Widget? child;
                          var onTap =
                              () => onApproveTap(widget.applicationModel.id);
                          if (state is ApproveApplicationLoading) {
                            child = const LoadingIndicator(
                              color: AppColors.white,
                            );
                            onTap = () {};
                          }
                          return MainActionButton(
                            text: 'Approve',
                            height: 32,
                            blurRadius: 3.71,
                            yAxisOffset: 3.71,
                            shadowColor: AppColors.black.withOpacity(0.25),
                            onTap: onTap,
                            child: child,
                          );
                        },
                      )
                    ],
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
