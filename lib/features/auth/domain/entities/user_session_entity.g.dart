// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSessionEntity _$UserSessionEntityFromJson(Map<String, dynamic> json) =>
    UserSessionEntity(
      token: json['token'] as String?,
      isAdmin: json['isAdmin'] as bool?,
    );

Map<String, dynamic> _$UserSessionEntityToJson(UserSessionEntity instance) =>
    <String, dynamic>{
      'token': instance.token,
      'isAdmin': instance.isAdmin,
    };
