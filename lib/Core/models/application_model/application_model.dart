import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application_model.g.dart';

@JsonSerializable()
@immutable
class ApplicationModel {
  const ApplicationModel({
    required this.id,
    required this.resume,
    required this.status,
    required this.freelancerId,
    required this.name,
    required this.email,
    required this.jobId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ApplicationModel.fromJsonStr(String str) =>
      ApplicationModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory ApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$ApplicationModelFromJson(json);


  final int id;

  final String resume;

  final String status;

  @JsonKey(name: 'freelancer_id')
  final int freelancerId;

  final String name;

  final String email;

  @JsonKey(name: 'job_id')
  final int jobId;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$ApplicationModelToJson(this);
  
}
