// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User_Chaeck_Code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCheckCodeModel _$UserCheckCodeModelFromJson(Map<String, dynamic> json) =>
    UserCheckCodeModel(
      success: json['success'] as bool,
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$UserCheckCodeModelToJson(UserCheckCodeModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
    };
