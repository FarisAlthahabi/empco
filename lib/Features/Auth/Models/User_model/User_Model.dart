import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'User_Model.g.dart';

@JsonSerializable()
@immutable
class UserModel {
  const UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJsonStr(String str) =>
      UserModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  final String email;

  final String password;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
