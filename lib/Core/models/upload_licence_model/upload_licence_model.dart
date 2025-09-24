import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_licence_model.g.dart';

@JsonSerializable()
@immutable
class UploadLicenceModel {
  const UploadLicenceModel({
    required this.id,
    required this.fileLicence,
  });

  factory UploadLicenceModel.fromJsonStr(String str) =>
      UploadLicenceModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory UploadLicenceModel.fromJson(Map<String, dynamic> json) =>
      _$UploadLicenceModelFromJson(json);

  final int id;

  @JsonKey(name: 'license_file')
  final String fileLicence;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$UploadLicenceModelToJson(this);
}
