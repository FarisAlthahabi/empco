// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'User_Verify_Model.g.dart';

@JsonSerializable()
@immutable
class UserVerifyModel {
  const UserVerifyModel({
    required this.email,
    required this.token,
  });

   factory UserVerifyModel.fromJsonStr(String str) =>
      UserVerifyModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory UserVerifyModel.fromJson(Map<String, dynamic> json) =>
      _$UserVerifyModelFromJson(json);

  final String email;

  final String token;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$UserVerifyModelToJson(this);
}
