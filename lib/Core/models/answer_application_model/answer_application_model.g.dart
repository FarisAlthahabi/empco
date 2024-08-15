// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerApplicationModel _$AnswerApplicationModelFromJson(
        Map<String, dynamic> json) =>
    AnswerApplicationModel(
      success: json['success'] as bool,
      message: json['msg'] as String,
    );

Map<String, dynamic> _$AnswerApplicationModelToJson(
        AnswerApplicationModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.message,
    };
