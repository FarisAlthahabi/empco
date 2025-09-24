import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'licence_status_model.g.dart';

@JsonSerializable()
@immutable
class LicenceStatusModel {
  const LicenceStatusModel({
    required this.id,
    required this.status,
  });

  factory LicenceStatusModel.fromJsonStr(String str) =>
      LicenceStatusModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory LicenceStatusModel.fromJson(Map<String, dynamic> json) =>
      _$LicenceStatusModelFromJson(json);

  final int id;

  final String status;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$LicenceStatusModelToJson(this);
  
}
