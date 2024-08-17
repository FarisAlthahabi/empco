// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowingModel _$FollowingModelFromJson(Map<String, dynamic> json) =>
    FollowingModel(
      id: (json['id'] as num).toInt(),
      friendOneAbleType: json['friend_one_able_type'] as String,
      friendOneAbleId: (json['friend_one_able_id'] as num).toInt(),
      friendTwoAbleType: json['friend_two_able_type'] as String,
      friendTwoAbleId: (json['friend_two_able_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$FollowingModelToJson(FollowingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'friend_one_able_type': instance.friendOneAbleType,
      'friend_one_able_id': instance.friendOneAbleId,
      'friend_two_able_type': instance.friendTwoAbleType,
      'friend_two_able_id': instance.friendTwoAbleId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
