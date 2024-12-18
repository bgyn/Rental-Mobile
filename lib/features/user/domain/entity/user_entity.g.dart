// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      (json['id'] as num?)?.toInt(),
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['email'] as String?,
      json['address'] as String?,
      json['profilePic'] as String?,
      json['dob'] as String?,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'address': instance.address,
      'profilePic': instance.profilePic,
      'dob': instance.dob,
    };
