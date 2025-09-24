import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_model.g.dart';

@JsonSerializable()
@immutable
class ServiceModel {
  const ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.estimatedTime,
    required this.categoryId,
    required this.freelancerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ServiceModel.fromJsonStr(String str) =>
      ServiceModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  final int id;

  final String name;

  final String description;

  final String price;

  @JsonKey(name: 'estimated_time')
  final String estimatedTime;

@JsonKey(name: 'category_id')
  final int categoryId;

  @JsonKey(name: 'freelancer_id')
  final int freelancerId;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;


  

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}