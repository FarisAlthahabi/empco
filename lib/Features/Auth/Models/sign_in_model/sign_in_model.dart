import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'sign_in_model.g.dart';

@JsonSerializable()
@immutable
class SignInModel {
  const SignInModel({
    String? email,
    String? password,
    String? fcmToken,
  })  : _password = password,
        _email = email,
        _fcmToken = fcmToken;

  factory SignInModel.fromJsonStr(String str) =>
      SignInModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);

  final String? _email;

  final String? _password;

  final String? _fcmToken;

  Map<String, dynamic> toJson() => _$SignInModelToJson(this);

  SignInModel copyWith({
    String? Function()? email,
    String? Function()? password,
    String? Function()? fcmToken,
  }) {
    return SignInModel(
      email: email != null ? email() : _email,
      password: password != null ? password() : _password,
      fcmToken: fcmToken != null ? fcmToken() : _fcmToken,
    );
  }

  String get email {
    return _email == null || _email.isEmpty
        ? (throw Exception('Email is null'))
        : _email;
  }

  String get password {
    return _password == null || _password.isEmpty
        ? (throw Exception('Password is null'))
        : _password;
  }

  @JsonKey(name: 'fcm_token')
  String get fcmToken {
    return _fcmToken == null || _fcmToken.isEmpty ? '' : _fcmToken;
  }
}
