import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Features/Roles/Company/jop_post/view/widgets/job_post_option_widget.dart';

enum WorkNatureEnum implements JobPostOptionWidgetItemModel{
  onSite,
  remote,
  hybrid;

  dynamic get value => this;

  @override
  String get displayName {
    switch (this) {
      case WorkNatureEnum.onSite:
        return 'on-site';
      case WorkNatureEnum.remote:
        return 'Remote';
        case WorkNatureEnum.hybrid:
        return 'Hybrid';
    }
  }

  @override
  String get icon {
    switch (this) {
      case WorkNatureEnum.onSite:
        return onstieIcon;
      case WorkNatureEnum.remote:
        return remoteIcon;
        case WorkNatureEnum.hybrid:
        return hybridIcon;
    }
  }

  static WorkNatureEnum fromJson(String value) {
    if (value == 'on-site') {
      return WorkNatureEnum.onSite;
    } else if (value == 'Hybrid') {
      return WorkNatureEnum.remote;
    }else if (value == 'Remote') {
      return WorkNatureEnum.hybrid;
    }  else {
      throw Exception('Work Nature is not supported');
    }
  }

  String get toJson {
    switch (this) {
      case WorkNatureEnum.onSite:
        return 'on-site';
      case WorkNatureEnum.hybrid:
        return 'Hybrid';
        case WorkNatureEnum.remote:
        return 'Remote';
      default:
        throw Exception('Unknown WorkNatureEnum value: $this');
    }
  }
}
