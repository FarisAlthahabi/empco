import 'package:auto_route/auto_route.dart';
import 'package:empco/Core/Mixins/post_frame_mixin.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Core/Widgets/show_snack_bar_method.dart';
import 'package:empco/Core/bloc/licence_cubit/cubit/licence_cubit.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/models/licence_status_model/licence_status_model.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/Core/router/Router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

@RoutePage()
class EmpcoNavigationBarView extends StatelessWidget {
  const EmpcoNavigationBarView({
    super.key,
    required this.pages,
  });

  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => config<LicenceCubit>(),
      child: BlocBuilder<LicenceCubit, GeneralLicenceState>(
        builder: (context, state) {
          LicenceStatusModel? licenceStatusModel;
          if (state is LicenceSuccess) {
            licenceStatusModel = state.licence;
          }
          return EmpcoNavigationBar(
            pages: pages,
            licenceStatusModel: licenceStatusModel,
          );
        },
      ),
    );
  }
}

class EmpcoNavigationBar extends StatefulWidget {
  const EmpcoNavigationBar({
    super.key,
    required this.pages,
    this.licenceStatusModel,
  });

  final List<Widget> pages;
  final LicenceStatusModel? licenceStatusModel;

  @override
  State<EmpcoNavigationBar> createState() => _EmpcoNavigationBarState();
}

class _EmpcoNavigationBarState extends State<EmpcoNavigationBar>
    with PostFrameMixin {
  late final UserRepo userRepo = context.read();
  int currentPageIndex = 0;
  String user = 'freelancer';

  @override
  void onPostFrame() async {
    if (await userRepo.getKey(role) == 'freelancer') {
      user = 'freelancer';
    } else if (await userRepo.getKey(role) == 'owner') {
      user = 'owner';
    } else {
      user = 'seeker';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widget.pages[currentPageIndex],
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          indicatorColor: const Color.fromRGBO(237, 245, 255, 1),
          height: 50,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: Color.fromRGBO(29, 29, 29, 1),
                ),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.shopping_bag_outlined,
                    color: Color.fromRGBO(29, 29, 29, 1)),
                label: 'jobs'),
            NavigationDestination(
                icon: Icon(Icons.messenger_outline,
                    color: Color.fromRGBO(29, 29, 29, 1)),
                label: 'Messages'),
            NavigationDestination(
                icon:
                    Icon(Icons.computer, color: Color.fromRGBO(29, 29, 29, 1)),
                label: 'Services')
          ],
        ),
        floatingActionButton: user == 'owner'
            ? FloatingActionButton(
                onPressed: () {
                  if (widget.licenceStatusModel?.status != 'approved') {
                    showSnackBarMethod(
                      context,
                      "You don't have licence yet to post a job",
                      AppColors.red,
                    );
                  } else {
                    context
                        .go('$loginRoute/$companyHomePageRoute/$jobPostRoute');
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                backgroundColor: const Color(0xFF0B2244),
                child: const Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              )
            : null,
      ),
    );
  }
}
