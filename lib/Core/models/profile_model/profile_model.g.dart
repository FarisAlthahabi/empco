// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: (json['id'] as num).toInt(),
      profileableType: json['profileable_type'] as String,
      profileableId: (json['profileable_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      image: json['image'] as String?,
      brief: json['brief'] as String?,
      bio: json['bio'] as String?,
      homePlace: json['home_place'] as String?,
      workPlace: json['work_place'] as String?,
      birthday: json['birthday'] as String?,
      email: json['email'] as String?,
      phoneNo: json['phone_no'] as String?,
      workAs: json['work_as'] as String?,
      overview: json['overview'] as String?,
      foundation: json['foundation'] as String?,
      ceo: json['ceo'] as String?,
      projects: json['projects'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'brief': instance.brief,
      'bio': instance.bio,
      'home_place': instance.homePlace,
      'work_place': instance.workPlace,
      'birthday': instance.birthday,
      'email': instance.email,
      'phone_no': instance.phoneNo,
      'work_as': instance.workAs,
      'overview': instance.overview,
      'foundation': instance.foundation,
      'ceo': instance.ceo,
      'projects': instance.projects,
      'profileable_type': instance.profileableType,
      'profileable_id': instance.profileableId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
