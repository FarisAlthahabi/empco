import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
@immutable
class TokenModel {
  const TokenModel({
    required this.token,
  });

  factory TokenModel.fromJsonStr(String str) =>
      TokenModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  final String token;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
