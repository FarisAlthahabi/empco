// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'User_Login_Model.g.dart';

@JsonSerializable()
@immutable
class UserLoginModel {
  const UserLoginModel({
    required this.email,
    required this.password,
  });

  factory UserLoginModel.fromJsonStr(String str) =>
      UserLoginModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory UserLoginModel.fromJson(Map<String, dynamic> json) =>
      _$UserLoginModelFromJson(json);

  final String email;

  final String password;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$UserLoginModelToJson(this);
}
