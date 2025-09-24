// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPostModel _$UserPostModelFromJson(Map<String, dynamic> json) =>
    UserPostModel(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      fcmToken: json['fcm_token'] as String?,
    );

Map<String, dynamic> _$UserPostModelToJson(UserPostModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'fcm_token': instance.fcmToken,
    };
