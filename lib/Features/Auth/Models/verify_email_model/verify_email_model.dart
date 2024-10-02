import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'verify_email_model.g.dart';

@JsonSerializable()
@immutable
class VerifyEmailModel {
  const VerifyEmailModel({
    String? email,
    String? token,
  })  : _email = email,
        _token = token;

  factory VerifyEmailModel.fromJsonStr(String str) =>
      VerifyEmailModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailModelFromJson(json);

  final String? _email;

  final String? _token;

  Map<String, dynamic> toJson() => _$VerifyEmailModelToJson(this);

  VerifyEmailModel copyWith({
    String? Function()? email,
    String? Function()? token,
  }) {
    return VerifyEmailModel(
      email: email != null ? email() : _email,
      token: token != null ? token() : _token,
    );
  }

  String get email {
    return _email == null || _email.isEmpty
        ? (throw Exception("Email can't be empty"))
        : _email;
  }

  String get token {
    return _token == null || _token.isEmpty
        ? (throw Exception("Verification code can't be empty"))
        : _token;
  }
}
