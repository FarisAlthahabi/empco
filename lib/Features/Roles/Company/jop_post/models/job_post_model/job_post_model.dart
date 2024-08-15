import 'dart:convert';

import 'package:empco/Features/Roles/Company/jop_post/models/job_category_enum/job_category_enum.dart';
import 'package:empco/Features/Roles/Company/jop_post/models/job_type_enum/job_type_enum.dart';
import 'package:empco/Features/Roles/Company/jop_post/models/job_work_nature_enum/job_work_nature_enum.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'job_post_model.g.dart';

@JsonSerializable()
@immutable
class JobPostModel {
  const JobPostModel({
    String? title,
    String? body,
    String? requiredSkills,
    DateTime? deadTime,
    String? location,
    double? salary,
    JobTypeEnum? jobType,
    WorkNatureEnum? workNature,
    JobCategoryEnum? jobCategory,
  })  : _title = title,
        _body = body,
        _requiredSkills = requiredSkills,
        _deadTime = deadTime,
        _location = location,
        _salary = salary,
        _jobType = jobType,
        _workNature = workNature,
        _jobCategory = jobCategory;

  factory JobPostModel.fromJsonStr(String str) =>
      JobPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory JobPostModel.fromJson(Map<String, dynamic> json) =>
      _$JobPostModelFromJson(json);

  final String? _title;

  final String? _body;

  final String? _requiredSkills;

  final DateTime? _deadTime;

  final String? _location;

  final double? _salary;

  final JobTypeEnum? _jobType;

  final WorkNatureEnum? _workNature;

  final JobCategoryEnum? _jobCategory;

  JobPostModel copyWith({
    String? Function()? title,
    String? Function()? body,
    String? Function()? requiredSkills,
    DateTime? Function()? deadTime,
    String? Function()? location,
    double? Function()? salary,
    JobTypeEnum? Function()? jobType,
    WorkNatureEnum? Function()? workNature,
    JobCategoryEnum? Function()? jobCategory,
  }) {
    return JobPostModel(
      title: title != null ? title() : _title,
      body: body != null ? body() : _body,
      requiredSkills:
          requiredSkills != null ? requiredSkills() : _requiredSkills,
      deadTime: deadTime != null ? deadTime() : _deadTime,
      location: location != null ? location() : _location,
      salary: salary != null ? salary() : _salary,
      jobType: jobType != null ? jobType() : _jobType,
      workNature: workNature != null ? workNature() : _workNature,
      jobCategory: jobCategory != null ? jobCategory() : _jobCategory,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$JobPostModelToJson(this);

  String? get title {
    if (_title == null || _title.isEmpty) {
      throw "Title can't be empty";
    }else{
      return _title;
    }
  }

  String? get body {
    if (_body == null || _body.isEmpty) {
      throw "Description can't be empty";
    }else{
      return _body;
    }
  }

  @JsonKey(name: 'required_skills')
  String? get requiredSkills {
    if (_requiredSkills == null || _requiredSkills.isEmpty) {
      throw "Required skills can't be empty";
    }else{
      return _requiredSkills;
    }
  }

  @JsonKey(name: 'category_id')
  JobCategoryEnum? get jobCategory {
    return _jobCategory ?? (throw "Job category can't be empty");
  }

  @JsonKey(name: 'type_job')
  JobTypeEnum? get jobType {
    return _jobType ?? (throw "Job type can't be empty");
  }

  @JsonKey(name: 'work_nature')
  WorkNatureEnum? get workNature {
    return _workNature ?? (throw "Work nature can't be empty");
  }

  @JsonKey(name: 'dead_time')
  DateTime? get deadTime {
    return _deadTime ?? (throw "Dead time can't be empty");
  }

  String? get location {
   if (_location == null || _location.isEmpty) {
      throw "Location can't be empty";
    }else{
      return _location;
    }
  }

  double? get salary {
    if (_salary == null || _salary.toString().isEmpty) {
      throw "Salary can't be empty";
    }else{
      return _salary;
    }
  }
}
