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
      jobType: $enumDecode(_$JobTypeEnumEnumMap, json['type_job']),
      location: json['location'] as String,
      deadTime: DateTime.parse(json['dead_time'] as String),
      jobCategory: $enumDecode(_$JobCategoryEnumEnumMap, json['category_id']),
      workNature: $enumDecode(_$WorkNatureEnumEnumMap, json['work_nature']),
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
      'type_job': _$JobTypeEnumEnumMap[instance.jobType]!,
      'location': instance.location,
      'dead_time': instance.deadTime.toIso8601String(),
      'category_id': _$JobCategoryEnumEnumMap[instance.jobCategory]!,
      'work_nature': _$WorkNatureEnumEnumMap[instance.workNature]!,
      'owner_id': instance.ownerId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$JobTypeEnumEnumMap = {
  JobTypeEnum.fullTime: 'fullTime',
  JobTypeEnum.partTime: 'partTime',
};

const _$JobCategoryEnumEnumMap = {
  JobCategoryEnum.transportation: 'transportation',
  JobCategoryEnum.it: 'it',
  JobCategoryEnum.ai: 'ai',
  JobCategoryEnum.marketing: 'marketing',
  JobCategoryEnum.education: 'education',
  JobCategoryEnum.healthcare: 'healthcare',
};

const _$WorkNatureEnumEnumMap = {
  WorkNatureEnum.onSite: 'onSite',
  WorkNatureEnum.remote: 'remote',
  WorkNatureEnum.hybrid: 'hybrid',
};
