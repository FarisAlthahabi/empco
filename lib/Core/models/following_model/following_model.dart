import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'following_model.g.dart';  

@JsonSerializable()
@immutable
class FollowingModel {
  const FollowingModel({
    required this.id,
    required this.friendOneAbleType,
    required this.friendOneAbleId,
    required this.friendTwoAbleType,
    required this.friendTwoAbleId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FollowingModel.fromJsonStr(String str) =>
      FollowingModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory FollowingModel.fromJson(Map<String, dynamic> json) =>
      _$FollowingModelFromJson(json);

  final int id;

  @JsonKey(name: 'friend_one_able_type')
  final String friendOneAbleType;

  @JsonKey(name: 'friend_one_able_id')
  final int friendOneAbleId;

  @JsonKey(name: 'friend_two_able_type')
  final String friendTwoAbleType;

  @JsonKey(name: 'friend_two_able_id')
  final int friendTwoAbleId;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$FollowingModelToJson(this);
}