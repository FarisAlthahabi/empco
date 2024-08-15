import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ai_description_model.g.dart';

@JsonSerializable()
@immutable
class AiDescriptionModel {
const AiDescriptionModel({
    required this.message,
    required this.description,
  });

  factory AiDescriptionModel.fromJsonStr(String str) =>
      AiDescriptionModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory AiDescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$AiDescriptionModelFromJson(json);

  @JsonKey(name: 'msg')
  final String message;

  @JsonKey(name: 'data')
  final String description;
  
  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$AiDescriptionModelToJson(this);
}
