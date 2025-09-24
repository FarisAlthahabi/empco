import 'dart:convert';

import 'package:empco/Features/Roles/Company/jop_post/models/job_category_enum/job_category_enum.dart';
import 'package:empco/Features/Roles/Company/jop_post/models/job_type_enum/job_type_enum.dart';
import 'package:empco/Features/Roles/Company/jop_post/models/job_work_nature_enum/job_work_nature_enum.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_model.g.dart';

@JsonSerializable()
@immutable
class JobModel {
  const JobModel({
    required this.id,
    required this.title,
    required this.body,
    required this.requiredSkills,
    required this.salary,
    required this.jobType,
    required this.location,
    required this.deadTime,
    required this.jobCategory,
    required this.workNature,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory JobModel.fromJsonStr(String str) =>
      JobModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);

  final int id;

  final String title;

  final String body;

  @JsonKey(name: 'required_skills')
  final String requiredSkills;

  final double salary;

  @JsonKey(name: 'type_job')
  final JobTypeEnum jobType;

  final String location;

  @JsonKey(name: 'dead_time')
  final DateTime deadTime;

  @JsonKey(name: 'category_id')
  final JobCategoryEnum jobCategory;

  @JsonKey(name: 'work_nature')
  final WorkNatureEnum workNature;

  @JsonKey(name: 'owner_id')
  final int ownerId;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$JobModelToJson(this);
}
