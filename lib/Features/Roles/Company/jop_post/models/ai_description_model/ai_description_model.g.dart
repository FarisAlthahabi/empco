// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_description_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiDescriptionModel _$AiDescriptionModelFromJson(Map<String, dynamic> json) =>
    AiDescriptionModel(
      message: json['msg'] as String,
      description: json['data'] as String,
    );

Map<String, dynamic> _$AiDescriptionModelToJson(AiDescriptionModel instance) =>
    <String, dynamic>{
      'msg': instance.message,
      'data': instance.description,
    };
