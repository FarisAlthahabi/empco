import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
@immutable
class ProfileModel {
  const ProfileModel({
    required this.id,
    required this.profileableType,
    required this.profileableId,
    required this.createdAt,
    required this.updatedAt,
    this.image,
    this.brief,
    this.bio,
    this.homePlace,
    this.workPlace,
    this.birthday,
    this.email,
    this.phoneNo,
    this.workAs,
    this.overview,
    this.foundation,
    this.ceo,
    this.projects,
  });

  factory ProfileModel.fromJsonStr(String str) =>
      ProfileModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  final int id;

  final String? image;

  final String? brief;

  final String? bio;

  @JsonKey(name: 'home_place')
  final String? homePlace;

  @JsonKey(name: 'work_place')
  final String? workPlace;

  final String? birthday;

  final String? email;
  @JsonKey(name: 'phone_no')
  final String? phoneNo;
  @JsonKey(name: 'work_as')
  final String? workAs;

  final String? overview;

  final String? foundation;

  final String? ceo;

  final String? projects;

  @JsonKey(name: 'profileable_type')
  final String profileableType;

  @JsonKey(name: 'profileable_id')
  final int profileableId;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
