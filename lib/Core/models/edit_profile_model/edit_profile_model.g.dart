// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileModel _$EditProfileModelFromJson(Map<String, dynamic> json) =>
    EditProfileModel(
      name: json['name'] as String?,
      location: json['home_place'] as String?,
      workAs: json['work_as'] as String?,
      birthday: json['birthday'] as String?,
      ceo: json['ceo'] as String?,
      workPlace: json['workPlace'] as String?,
      overview: json['overview'] as String?,
      brief: json['brief'] as String?,
      projects: json['projects'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_no'] as String?,
    );

Map<String, dynamic> _$EditProfileModelToJson(EditProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'home_place': instance.location,
      'work_as': instance.workAs,
      'birthday': instance.birthday,
      'ceo': instance.ceo,
      'workPlace': instance.workPlace,
      'overview': instance.overview,
      'brief': instance.brief,
      'projects': instance.projects,
      'email': instance.email,
      'phone_no': instance.phoneNumber,
    };
