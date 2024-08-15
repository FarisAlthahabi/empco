import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:empco/Core/models/upload_licence_model/upload_licence_model.dart';

part 'upload_licence_response_model.g.dart';

@JsonSerializable()
@immutable
class UploadLicenceResponseModel {
  const UploadLicenceResponseModel({
    required this.message,
    this.licence,
  });

  factory UploadLicenceResponseModel.fromJsonStr(String str) =>
      UploadLicenceResponseModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory UploadLicenceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UploadLicenceResponseModelFromJson(json);

  @JsonKey(name: 'msg')
  final String message;

  @JsonKey(name: 'data')
  final UploadLicenceModel? licence;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$UploadLicenceResponseModelToJson(this);
}
