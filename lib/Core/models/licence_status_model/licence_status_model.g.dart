// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'licence_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LicenceStatusModel _$LicenceStatusModelFromJson(Map<String, dynamic> json) =>
    LicenceStatusModel(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$LicenceStatusModelToJson(LicenceStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
    };
