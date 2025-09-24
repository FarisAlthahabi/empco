// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInModel _$SignInModelFromJson(Map<String, dynamic> json) => SignInModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
      fcmToken: json['fcm_token'] as String?,
    );

Map<String, dynamic> _$SignInModelToJson(SignInModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'fcm_token': instance.fcmToken,
    };
