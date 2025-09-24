// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_licence_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadLicenceModel _$UploadLicenceModelFromJson(Map<String, dynamic> json) =>
    UploadLicenceModel(
      id: (json['id'] as num).toInt(),
      fileLicence: json['license_file'] as String,
    );

Map<String, dynamic> _$UploadLicenceModelToJson(UploadLicenceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'license_file': instance.fileLicence,
    };
