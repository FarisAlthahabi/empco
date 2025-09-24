// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      estimatedTime: json['estimated_time'] as String,
      categoryId: (json['category_id'] as num).toInt(),
      freelancerId: (json['freelancer_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'estimated_time': instance.estimatedTime,
      'category_id': instance.categoryId,
      'freelancer_id': instance.freelancerId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
