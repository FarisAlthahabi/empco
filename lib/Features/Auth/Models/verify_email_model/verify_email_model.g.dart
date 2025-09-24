// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmailModel _$VerifyEmailModelFromJson(Map<String, dynamic> json) =>
    VerifyEmailModel(
      email: json['email'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$VerifyEmailModelToJson(VerifyEmailModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'token': instance.token,
    };
