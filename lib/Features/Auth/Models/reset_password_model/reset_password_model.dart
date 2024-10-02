import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'reset_password_model.g.dart';

@JsonSerializable()
@immutable
class ResetPasswordModel {
  const ResetPasswordModel({
    String? password,
    String? token,
  })  : _password = password,
        _token = token;

  factory ResetPasswordModel.fromJsonStr(String str) =>
      ResetPasswordModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordModelFromJson(json);

  final String? _password;

  final String? _token;

  Map<String, dynamic> toJson() => _$ResetPasswordModelToJson(this);

  ResetPasswordModel copyWith({
    String? Function()? password,
    String? Function()? token,
  }) {
    return ResetPasswordModel(
      password: password != null ? password() : _password,
      token: token != null ? token() : _token,
    );
  }

  String get password {
    return _password == null || _password.isEmpty
        ? (throw Exception("Password can't be empty"))
        : _password;
  }

  String get token {
    return _token == null || _token.isEmpty
        ? (throw Exception("Verification code can't be empty"))
        : _token;
  }
}
