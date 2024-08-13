import 'package:empco/Core/Widgets/show_dialog.dart';
import 'package:empco/Features/Roles/common_pages/empco_job_details/empco_job_details.dart';
import 'package:flutter/cupertino.dart';

abstract class CompanyJobDetailsCallBacks {
  void onEdit();

  void onDelete();
}

class CompanyJobDetailsView extends StatefulWidget
     {
  const CompanyJobDetailsView({super.key});

  @override
  State<CompanyJobDetailsView> createState() => _CompanyJobDetailsViewState();
}

class _CompanyJobDetailsViewState extends State<CompanyJobDetailsView> implements CompanyJobDetailsCallBacks {
  @override
  void onDelete() {
    empcoShowDialog(context);
  }

  @override
  void onEdit() {}

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double screenWidth = screenSize.width;

    return JobDetailsView(
      jobId: 1,
      onDelete: onDelete,
      onEdit: onEdit,
      screenWidth: screenWidth,
    );
  }
}
