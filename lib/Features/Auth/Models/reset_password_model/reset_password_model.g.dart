// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordModel _$ResetPasswordModelFromJson(Map<String, dynamic> json) =>
    ResetPasswordModel(
      password: json['password'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ResetPasswordModelToJson(ResetPasswordModel instance) =>
    <String, dynamic>{
      'password': instance.password,
      'token': instance.token,
    };
