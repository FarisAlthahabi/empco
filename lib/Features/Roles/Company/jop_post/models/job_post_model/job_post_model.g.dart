// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobPostModel _$JobPostModelFromJson(Map<String, dynamic> json) => JobPostModel(
      title: json['title'] as String?,
      body: json['body'] as String?,
      requiredSkills: json['required_skills'] as String?,
      deadTime: json['dead_time'] == null
          ? null
          : DateTime.parse(json['dead_time'] as String),
      location: json['location'] as String?,
      salary: (json['salary'] as num?)?.toDouble(),
      jobType: $enumDecodeNullable(_$JobTypeEnumEnumMap, json['type_job']),
      workNature:
          $enumDecodeNullable(_$WorkNatureEnumEnumMap, json['work_nature']),
      jobCategory:
          $enumDecodeNullable(_$JobCategoryEnumEnumMap, json['category_id']),
    );

Map<String, dynamic> _$JobPostModelToJson(JobPostModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'required_skills': instance.requiredSkills,
      'category_id': _$JobCategoryEnumEnumMap[instance.jobCategory],
      'type_job': _$JobTypeEnumEnumMap[instance.jobType],
      'work_nature': _$WorkNatureEnumEnumMap[instance.workNature],
      'dead_time': instance.deadTime?.toIso8601String(),
      'location': instance.location,
      'salary': instance.salary,
    };

const _$JobTypeEnumEnumMap = {
  JobTypeEnum.fullTime: 'fullTime',
  JobTypeEnum.partTime: 'partTime',
};

const _$WorkNatureEnumEnumMap = {
  WorkNatureEnum.onSite: 'onSite',
  WorkNatureEnum.remote: 'remote',
  WorkNatureEnum.hybrid: 'hybrid',
};

const _$JobCategoryEnumEnumMap = {
  JobCategoryEnum.transportation: 'transportation',
  JobCategoryEnum.it: 'it',
  JobCategoryEnum.ai: 'ai',
  JobCategoryEnum.marketing: 'marketing',
  JobCategoryEnum.education: 'education',
  JobCategoryEnum.healthcare: 'healthcare',
};
