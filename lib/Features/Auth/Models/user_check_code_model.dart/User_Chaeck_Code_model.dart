// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'User_Chaeck_Code_model.g.dart';

@JsonSerializable()
@immutable
class UserCheckCodeModel {
  const UserCheckCodeModel({
    required this.success,
    required this.msg,
  });

  factory UserCheckCodeModel.fromJsonStr(String str) =>
      UserCheckCodeModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory UserCheckCodeModel.fromJson(Map<String, dynamic> json) =>
      _$UserCheckCodeModelFromJson(json);

  final bool success;

  final String msg;
  
      String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$UserCheckCodeModelToJson(this);
}
