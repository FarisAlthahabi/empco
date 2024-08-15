import 'package:empco/Core/Resources/Constants/assets.dart';
import 'package:empco/Core/Widgets/main_drop_down_widget.dart';

enum JobCategoryEnum implements DropDownItemModel {
  transportation,
  it,
  ai,
  marketing,
  education,
  healthcare;

  dynamic get value => this;

  @override
  int get id {
    return index;
  }

  @override
  String get name {
    switch (this) {
      case JobCategoryEnum.transportation:
        return 'Transportation';
      case JobCategoryEnum.it:
        return 'IT';
      case JobCategoryEnum.ai:
        return 'AI';
      case JobCategoryEnum.marketing:
        return 'Marketing';
      case JobCategoryEnum.education:
        return 'Education';
      case JobCategoryEnum.healthcare:
        return 'Health Care';
    }
  }

  String get icon {
    switch (this) {
      case JobCategoryEnum.transportation:
        return fullTimeIcon;
      case JobCategoryEnum.it:
        return partTimeIcon;
        case JobCategoryEnum.ai:
        return fullTimeIcon;
      case JobCategoryEnum.marketing:
        return partTimeIcon;
        case JobCategoryEnum.education:
        return fullTimeIcon;
      case JobCategoryEnum.healthcare:
        return partTimeIcon;
    }
  }

  static JobCategoryEnum fromJson(int value) {
    switch (value) {
      case 1:
        return JobCategoryEnum.transportation;
      case 2:
        return JobCategoryEnum.it;
      case 3:
        return JobCategoryEnum.ai;
      case 4:
        return JobCategoryEnum.marketing;
      case 5:
        return JobCategoryEnum.education;
      case 6:
        return JobCategoryEnum.healthcare;
      default:
        throw Exception('Unknown JobCategoryEnum value: $value');
    }
  }

  int get toJson {
    switch (this) {
      case JobCategoryEnum.transportation:
        return 1;
      case JobCategoryEnum.it:
        return 2;
      case JobCategoryEnum.ai:
        return 3;
      case JobCategoryEnum.marketing:
        return 4;
      case JobCategoryEnum.education:
        return 5;
      case JobCategoryEnum.healthcare:
        return 6;
      default:
        throw Exception('Unknown JobCategoryEnum value: $this');
    }
  }
}
