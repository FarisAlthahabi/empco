// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User_Reset_Password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResetPasswordModel _$UserResetPasswordModelFromJson(
        Map<String, dynamic> json) =>
    UserResetPasswordModel(
      password: json['password'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$UserResetPasswordModelToJson(
        UserResetPasswordModel instance) =>
    <String, dynamic>{
      'password': instance.password,
      'token': instance.token,
    };
