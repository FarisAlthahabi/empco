import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/Widgets/main_error_widget.dart';
import 'package:empco/Core/bloc/applications_cubit/cubit/applications_cubit.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/extensions/date_time_x.dart';
import 'package:empco/Features/Roles/Company/is_empty_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MyApplictionsViewCallBacks {
  void onTryAgainTap();

  void onDeleteTap();
}

@RoutePage()
class MyApplictionsView extends StatelessWidget {
  const MyApplictionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<ApplicationsCubit>(),
      child: const MyApplictionsPage(),
    );
  }
}

class MyApplictionsPage extends StatefulWidget {
  const MyApplictionsPage({super.key});

  @override
  State<MyApplictionsPage> createState() => _MyApplictionsPageState();
}

class _MyApplictionsPageState extends State<MyApplictionsPage>
    implements MyApplictionsViewCallBacks {
  late final ApplicationsCubit applicationsCubit = context.read();

  final List<String> list = ['a'];

  @override
  void initState() {
    applicationsCubit.getApplications();
    super.initState();
  }

  @override
  void onDeleteTap() {
    // TODO: implement onDeleteTap
  }

  @override
  void onTryAgainTap() {
    applicationsCubit.getApplications();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const EmpcoAppBar(
          automaticallyImplyLeading: true,
          title: Text(
            'My applications',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
          ),
        ),
        body: BlocBuilder<ApplicationsCubit, GeneralApplicationsState>(
          builder: (context, state) {
            if (state is ApplicationsLoading) {
              return const LoadingIndicator();
            } else if (state is ApplicationsSuccess) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: state.applications.length,
                  itemBuilder: (context, index) {
                    final item = state.applications[index];
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xff3F5772), width: 4),
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffF8F8F8)),
                      width: 200,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(jobSearchIcon),
                                  const SizedBox(
                                    width: 12.5,
                                  ),
                                  Text(
                                    item.name,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Color(0xff3F5772),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    empcoIcon,
                                    width: 20,
                                  ),
                                  const SizedBox(
                                    width: 12.5,
                                  ),
                                  Text(
                                    'name company',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black,
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    loctionIcon,
                                    width: 15,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    item.updatedAt.formatMMddYYYY,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Color(0xff808080),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  SvgPicture.asset(
                                    onstieIcon,
                                    width: 15,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    item.email,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Color(0xff808080),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: onDeleteTap,
                                icon: const Icon(
                                  Icons.cancel_outlined,
                                  size: 25,
                                  color: AppColors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      item.status == 'approved'
                                          ? approvedIcon
                                          : item.status == 'pending'
                                              ? processingIcon
                                              : rejectedIcon,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      item.status,
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            } else if (state is ApplicationsEmpty) {
              return const EmptyView(
                  textt: 'You haven’t applied to any job yet!');
            } else if (state is ApplicationsFail) {
              return MainErrorWidget(
                error: state.error,
                onTap: onTryAgainTap,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
