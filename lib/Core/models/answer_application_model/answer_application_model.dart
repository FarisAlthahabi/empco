import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer_application_model.g.dart';

@JsonSerializable()
@immutable
class AnswerApplicationModel {
  const AnswerApplicationModel({
    required this.success,
    required this.message,
  });

  factory AnswerApplicationModel.fromJsonStr(String str) =>
      AnswerApplicationModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory AnswerApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerApplicationModelFromJson(json);


  final bool success;

  @JsonKey(name: 'msg')
  final String message;

   String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$AnswerApplicationModelToJson(this);
  
}
