import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_search_post_model.g.dart';

@JsonSerializable()
@immutable
class JobSearchPostModel {
  const JobSearchPostModel({
    String? title,
    String? location,
  })  : _title = title,
        _location = location;

        factory JobSearchPostModel.fromJsonStr(String str) =>
      JobSearchPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory JobSearchPostModel.fromJson(Map<String, dynamic> json) =>
      _$JobSearchPostModelFromJson(json);

  final String? _title;

  final String? _location;

  JobSearchPostModel copyWith({
    String? Function()? title,
    String? Function()? location,
  }) {
    return JobSearchPostModel(
      title: title != null ? title() : _title,
      location: location != null ? location() : _location,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$JobSearchPostModelToJson(this);

  String get title {
    return _title ?? '';
  }

  String get location {
    return _location ?? '' ;
  }
}
