// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModel _$JobModelFromJson(Map<String, dynamic> json) => JobModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      requiredSkills: json['required_skills'] as String,
      salary: (json['salary'] as num).toDouble(),
      jobType: json['type_job'] as String,
      location: json['location'] as String,
      deadTime: DateTime.parse(json['dead_time'] as String),
      categoryId: (json['category_id'] as num).toInt(),
      ownerId: (json['owner_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$JobModelToJson(JobModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'required_skills': instance.requiredSkills,
      'salary': instance.salary,
      'type_job': instance.jobType,
      'location': instance.location,
      'dead_time': instance.deadTime.toIso8601String(),
      'category_id': instance.categoryId,
      'owner_id': instance.ownerId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
