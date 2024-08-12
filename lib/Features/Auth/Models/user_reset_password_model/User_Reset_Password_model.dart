// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'User_Reset_Password_model.g.dart';

@JsonSerializable()
@immutable
class UserResetPasswordModel  {
  const UserResetPasswordModel({
    required this.password,
    required this.token,
  });

  factory UserResetPasswordModel.fromJsonStr(String str) =>
      UserResetPasswordModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory UserResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$UserResetPasswordModelFromJson(json);

  final String password;

  final String token;

   String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$UserResetPasswordModelToJson(this);
  }
