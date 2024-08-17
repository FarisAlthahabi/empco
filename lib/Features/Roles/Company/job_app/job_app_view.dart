import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/buttons.dart';
import 'package:empco/Core/Widgets/empco_app_bar.dart';
import 'package:empco/Core/Widgets/loading_indicator.dart';
import 'package:empco/Core/Widgets/main_error_widget.dart';
import 'package:empco/Core/bloc/applications_cubit/cubit/applications_cubit.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/models/application_model/application_model.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:empco/Features/Roles/Company/is_empty_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class JobAppViewCallBacks {
  void onExpandTap(ApplicationModel applicationModel);

  void onDeleteTap();

  void onViewApplicationTap(ApplicationModel applicationModel);

  void onTryAgainTap();
}

@RoutePage()
class JobAppView extends StatelessWidget {
  const JobAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<ApplicationsCubit>(),
      child: const JobAppPage(),
    );
  }
}

class JobAppPage extends StatefulWidget {
  const JobAppPage({super.key});

  @override
  State<JobAppPage> createState() => _JobAppPageState();
}

class _JobAppPageState extends State<JobAppPage>
    implements JobAppViewCallBacks {
  late final ApplicationsCubit applicationsCubit = context.read();

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
  void onExpandTap(ApplicationModel applicationModel) {
   context.go(
      '$loginRoute/$companyHomePageRoute/$jobAppViewRoute/$viewApplicationViewRoute',
      extra: applicationModel,
    );
  }

  @override
  void onViewApplicationTap(ApplicationModel applicationModel) {
    context.go(
      '$loginRoute/$companyHomePageRoute/$jobAppViewRoute/$viewApplicationViewRoute',
      extra: applicationModel,
    );
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
            'Jobs applications',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff1D5BA4)),
          ),
        ),
        body: BlocBuilder<ApplicationsCubit, GeneralApplicationsState>(
          builder: (context, state) {
            if (state is ApplicationsLoading) {
              return const LoadingIndicator();
            } else if (state is ApplicationsSuccess) {
            } else if (state is ApplicationsEmpty) {
              return const EmptyView(textt: 'You haven’t posted any job yet!');
            } else if (state is ApplicationsFail) {
              return MainErrorWidget(
                error: state.error,
                onTap: onTryAgainTap,
              );
            } else {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.applications.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    final item = state.applications[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xff3F5772), width: 4),
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffF8F8F8)),
                      child: Column(
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
                                'Ui Ux Designer',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Color(0xff3F5772),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: onDeleteTap,
                                icon: const Icon(
                                  Icons.delete_outline_outlined,
                                  size: 27,
                                  color: AppColors.red,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                memberIcon,
                                width: 20,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                item.name,
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.5,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              MainActionButton(
                                onTap: () => onViewApplicationTap(item),
                                text: 'View appication',
                                fontSize: 10.5,
                                height: 28,
                                blurRadius: 3.71,
                                yAxisOffset: 3.71,
                                shadowColor: Colors.black.withOpacity(0.25),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.open_in_full_rounded,
                                  size: 20,
                                  color: Color(0xff1D5BA4),
                                ),
                                onPressed: ()=> onExpandTap(item),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}
