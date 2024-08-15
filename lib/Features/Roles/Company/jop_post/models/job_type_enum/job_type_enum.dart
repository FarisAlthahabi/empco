import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Features/Roles/Company/jop_post/view/widgets/job_post_option_widget.dart';

enum JobTypeEnum implements JobPostOptionWidgetItemModel{
  fullTime,
  partTime;

  dynamic get value => this;

  @override
  String get displayName {
    switch (this) {
      case JobTypeEnum.fullTime:
        return "Full-time";
      case JobTypeEnum.partTime:
        return "Part-time";
    }
  }

  @override
  String get icon {
    switch (this) {
      case JobTypeEnum.fullTime:
        return fullTimeIcon;
      case JobTypeEnum.partTime:
        return partTimeIcon;
    }
  }

  static JobTypeEnum fromJson(String value) {
    if (JobTypeEnum.fullTime.displayName == value) {
      return JobTypeEnum.fullTime;
    } else if (JobTypeEnum.partTime.displayName == value) {
      return JobTypeEnum.partTime;
    } else {
      throw Exception('Job Type is not supported');
    }
  }

  String get toJson {
    switch (this) {
      case JobTypeEnum.fullTime:
        return "Full-time";
      case JobTypeEnum.partTime:
        return "Part-time";
      default:
        throw Exception('Unknown JobTypeEnum value: $this');
    }
  }

}
