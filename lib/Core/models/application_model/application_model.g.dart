// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationModel _$ApplicationModelFromJson(Map<String, dynamic> json) =>
    ApplicationModel(
      id: (json['id'] as num).toInt(),
      resume: json['resume'] as String,
      status: json['status'] as String,
      freelancerId: (json['freelancer_id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      jobId: (json['job_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ApplicationModelToJson(ApplicationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resume': instance.resume,
      'status': instance.status,
      'freelancer_id': instance.freelancerId,
      'name': instance.name,
      'email': instance.email,
      'job_id': instance.jobId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
