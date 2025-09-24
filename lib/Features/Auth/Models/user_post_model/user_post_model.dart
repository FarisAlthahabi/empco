import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_post_model.g.dart';

@JsonSerializable()
@immutable
class UserPostModel {
  const UserPostModel({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? fcmToken,
  })  : _firstName = firstName,
        _lastName = lastName,
        _password = password,
        _email = email,
        _fcmToken = fcmToken;

  factory UserPostModel.fromJsonStr(String str) =>
      UserPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory UserPostModel.fromJson(Map<String, dynamic> json) =>
      _$UserPostModelFromJson(json);

  final String? _firstName;

  final String? _lastName;

  final String? _email;

  final String? _password;

  final String? _fcmToken;

  Map<String, dynamic> toJson() => _$UserPostModelToJson(this);

  UserPostModel copyWith({
    String? Function()? firstName,
    String? Function()? lastName,
    String? Function()? email,
    String? Function()? password,
    String? Function()? fcmToken,
  }) {
    return UserPostModel(
      firstName: firstName != null ? firstName() : _firstName,
      lastName: lastName != null ? lastName() : _lastName,
      email: email != null ? email() : _email,
      password: password != null ? password() : _password,
      fcmToken: fcmToken != null ? fcmToken() : _fcmToken,
    );
  }

  @JsonKey(name: 'first_name')
  String get firstName {
    return _firstName == null || _firstName.isEmpty
        ? (throw Exception('First name is empty'))
        : _firstName;
  }

  @JsonKey(name: 'last_name')
  String get lastName {
    return _lastName == null || _lastName.isEmpty
        ? (throw Exception('Last name is empty'))
        : _lastName;
  }

  String get email {
    return _email == null || _email.isEmpty
        ? (throw Exception('Email is empty'))
        : _email;
  }

  String get password {
    return _password == null || _password.isEmpty
        ? (throw Exception('Password is empty'))
        : _password;
  }

  @JsonKey(name: 'fcm_token')
  String get fcmToken {
    return _fcmToken == null || _fcmToken.isEmpty ? '' : _fcmToken;
  }
}
