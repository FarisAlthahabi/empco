// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_licence_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadLicenceResponseModel _$UploadLicenceResponseModelFromJson(
        Map<String, dynamic> json) =>
    UploadLicenceResponseModel(
      message: json['msg'] as String,
      licence: json['data'] == null
          ? null
          : UploadLicenceModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UploadLicenceResponseModelToJson(
        UploadLicenceResponseModel instance) =>
    <String, dynamic>{
      'msg': instance.message,
      'data': instance.licence,
    };
