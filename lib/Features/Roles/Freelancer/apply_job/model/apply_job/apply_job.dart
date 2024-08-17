import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apply_job.g.dart';

@JsonSerializable()
@immutable
class ApplyJobModel {
  const ApplyJobModel({
    String? name,
    String? email,
    String? resume,
  })  : _name = name,
        _email = email,
        _resume = resume;

        factory ApplyJobModel.fromJsonStr(String str) =>
      ApplyJobModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory ApplyJobModel.fromJson(Map<String, dynamic> json) =>
      _$ApplyJobModelFromJson(json);


  final String? _name;

  final String? _email;

  final String? _resume;

  ApplyJobModel copyWith({
    String? Function()? name,
    String? Function()? email,
    String? Function()? resume,
  }) {
    return ApplyJobModel(
      name: name != null ? name() : _name,
      email: email != null ? email() : _email,
      resume: resume != null ? resume() : _resume,
     
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$ApplyJobModelToJson(this);

   String get name {
   if (_name == null || _name.isEmpty) {
      throw "Name can't be empty";
    }else{
      return _name;
    }
  }

   String get email {
   if (_email == null || _email.isEmpty) {
      throw "Email can't be empty";
    }else{
      return _email;
    }
  }

   String get resume {
   if (_resume == null ) {
      throw "Resume can't be empty";
    }else{
      return _resume;
    }
  }

}
