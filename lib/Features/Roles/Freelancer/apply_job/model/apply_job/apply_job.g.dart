// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyJobModel _$ApplyJobModelFromJson(Map<String, dynamic> json) =>
    ApplyJobModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      resume: json['resume'] as String?,
    );

Map<String, dynamic> _$ApplyJobModelToJson(ApplyJobModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'resume': instance.resume,
    };
