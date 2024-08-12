import 'dart:convert';

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
    required this.categoryId,
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
  final String jobType;

  final String location;

  @JsonKey(name: 'dead_time')
  final DateTime deadTime;

  @JsonKey(name: 'category_id')
  final int categoryId;

  @JsonKey(name: 'owner_id')
  final int ownerId;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$JobModelToJson(this);
}
