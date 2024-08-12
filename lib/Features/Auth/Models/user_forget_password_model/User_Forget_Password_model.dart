// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'User_Forget_Password_model.g.dart';

@JsonSerializable()
@immutable
class UserForgetPasswordModel {
  
  const UserForgetPasswordModel({
    required this.email,
  });

   factory UserForgetPasswordModel.fromJsonStr(String str) =>
      UserForgetPasswordModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory UserForgetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$UserForgetPasswordModelFromJson(json);

  final String email;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$UserForgetPasswordModelToJson(this);

}
